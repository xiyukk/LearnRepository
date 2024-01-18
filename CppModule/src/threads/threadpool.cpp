#include <iostream>
#include <vector>
#include <thread>
#include <queue>
#include <mutex>
#include <condition_variable>
#include <future>
#include <functional>
#include <stdexcept>
#include <chrono>
#include <atomic>


class ThreadPool {
public:
    ThreadPool(size_t);
    template<class F, class... Args>
    auto enqueue(F&& f, Args&&... args) 
        -> std::future<typename std::result_of<F(Args...)>::type>;
    ~ThreadPool();

private:
    // 线程工作组
    std::vector< std::thread > workers;
    // 任务队列
    std::queue< std::function<void()> > tasks;
    
    // 同步
    std::mutex queue_mutex;
    std::condition_variable condition;
    bool stop;
};

// 构造函数启动一定数量的工作线程
inline ThreadPool::ThreadPool(size_t threads)
    :   stop(false)
{
    for(size_t i = 0; i<threads; ++i)
        workers.emplace_back(
            [this]
            {
                for(;;)
                {
                    std::function<void()> task;

                    {
                        std::unique_lock<std::mutex> lock(this->queue_mutex);
                        this->condition.wait(lock,
                            [this]{ return this->stop || !this->tasks.empty(); });
                        if(this->stop && this->tasks.empty())
                            return;
                        task = std::move(this->tasks.front());
                        this->tasks.pop();
                    }

                    task();
                }
            }
        );
}

// 将新任务添加到工作队列中
template<class F, class... Args>
auto ThreadPool::enqueue(F&& f, Args&&... args) 
    -> std::future<typename std::result_of<F(Args...)>::type>
{
    using return_type = typename std::result_of<F(Args...)>::type;

    auto task = std::make_shared< std::packaged_task<return_type()> >(
            std::bind(std::forward<F>(f), std::forward<Args>(args)...)
        );
        
    std::future<return_type> res = task->get_future();
    {
        std::unique_lock<std::mutex> lock(queue_mutex);

        // 不允许在停止ThreadPool后入队任务
        if(stop)
            throw std::runtime_error("enqueue on stopped ThreadPool");

        tasks.emplace([task](){ (*task)(); });
    }
    condition.notify_one();
    return res;
}

// 销毁所有线程
inline ThreadPool::~ThreadPool()
{
    {
        std::unique_lock<std::mutex> lock(queue_mutex);
        stop = true;
    }
    condition.notify_all();
    for(std::thread &worker: workers)
        worker.join();
}
// int main()
// {
//     ThreadPool pool(4); // 创建拥有4个工作线程的线程池

//     // 将任务入队并获取future
//     auto result = pool.enqueue([](int answer) { return answer; }, 42);

//     // 获取并输出结果
//     std::cout << result.get() << std::endl;

//     return 0; // ThreadPool对象被销毁，线程池中所有线程将完成其任务并退出
// }

#if 0 
int main() {
    ThreadPool pool(4); // 创建4个工作线程的线程池

    // 多任务测试
    auto task1 = pool.enqueue([]{ return std::string("Hello"); });
    auto task2 = pool.enqueue([]{ return std::string("World"); });
    auto task3 = pool.enqueue([]{ return 42; });

    std::cout << task1.get() << " " << task2.get() << " " << task3.get() << std::endl;

    // 性能测试
    auto start = std::chrono::high_resolution_clock::now();
    std::vector<std::future<int>> results;

    for(int i = 0; i < 1000; ++i) {
        results.emplace_back(
            pool.enqueue([i] {
                // 模拟计算密集型任务
                int result = 0;
                for(int j = 0; j < 1000; ++j) {
                    result += j * i;
                }
                return result;
            })
        );
    }

    for(auto && result: results)
        result.get();

    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed = end - start;
    std::cout << "Performance test took: " << elapsed.count() << " seconds." << std::endl;

    // 异常安全测试（如果需要）
    // 异常安全测试
    try {
        // 提交一个会抛出异常的任务
        auto exceptionTask = pool.enqueue([] {
            throw std::runtime_error("Intentional exception");
            return 0;
        });
        exceptionTask.get(); // 获取任务的结果（这里应该会抛出异常）
    } catch (const std::exception& e) {
        std::cout << "Caught exception: " << e.what() << std::endl;
    }

    // 检查线程池是否仍然可以正常工作
    auto taskAfterException = pool.enqueue([]{ return 123; });
    if (taskAfterException.get() == 123) {
        std::cout << "ThreadPool still functional after exception." << std::endl;
    } else {
        std::cout << "ThreadPool not functional after exception." << std::endl;
    }

    return 0;
}
#endif


void increment_atomic(std::atomic<int>& counter) {
    for (int i = 0; i < 1000; ++i) {
        counter++;
    }
}

struct Counter {
    int count = 0;
    std::mutex mutex;

    void increment() {
        std::lock_guard<std::mutex> lock(mutex);
        for (int i = 0; i < 1000; ++i) {
            count++;
        }
    }
};

int main() {
    ThreadPool pool(4);  // 创建4个工作线程的线程池

    std::atomic<int> atomic_counter(0);
    Counter counter_obj;

    std::vector<std::future<void>> futures;

    // 测试原子操作的线程安全
    for (int i = 0; i < 100; ++i) {
        futures.push_back(pool.enqueue(increment_atomic, std::ref(atomic_counter)));
    }

    // 测试函数对象的线程安全
    for (int i = 0; i < 100; ++i) {
        futures.push_back(pool.enqueue(&Counter::increment, &counter_obj));
    }

    // 等待所有任务完成
    for (auto& fut : futures) {
        fut.get();
    }

    std::cout << "Atomic counter value: " << atomic_counter << std::endl;
    std::cout << "Counter object value: " << counter_obj.count << std::endl;

    return 0;
}

