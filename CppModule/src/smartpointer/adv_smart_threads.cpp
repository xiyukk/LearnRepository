#include <iostream>
#include <memory>
#include <string>
#include <thread>
#include <vector>
#include <mutex>

// Logger类，用于日志记录
class Logger {
public:
    void log(const std::string& message) {
        std::lock_guard<std::mutex> lock(mutex_);
        std::cout << "Log: " << message << std::endl;
    }

private:
    std::mutex mutex_; // 用于同步的互斥量
};

// Database类，代表数据库连接
class Database {
public:
    Database(const std::string& name, const std::shared_ptr<Logger>& logger) 
        : name_(name), logger_(logger) {}

    void query(const std::string& sql) {
        // 假设的数据库查询操作
        logger_->log("Executing query on database " + name_ + ": " + sql);
        // ... 数据库查询操作 ...
    }

private:
    std::string name_;
    std::shared_ptr<Logger> logger_; // 使用shared_ptr共享Logger
};

void threadFunction(std::weak_ptr<Database> db_weak, const std::string& sql) {
    if (auto db = db_weak.lock()) { // 尝试从weak_ptr获得一个shared_ptr
        db->query(sql);
    }
}

int main() {
    auto logger = std::make_shared<Logger>();
    auto db1 = std::make_shared<Database>("DB1", logger);
    auto db2 = std::make_shared<Database>("DB2", logger);

    // 创建多个线程，模拟多线程环境下数据库查询
    std::vector<std::thread> threads;
    threads.emplace_back(threadFunction, std::weak_ptr<Database>(db1), "SELECT * FROM table1");
    threads.emplace_back(threadFunction, std::weak_ptr<Database>(db2), "SELECT * FROM table2");

    // 等待所有线程完成
    for (auto& thread : threads) {
        thread.join();
    }

    return 0;
}