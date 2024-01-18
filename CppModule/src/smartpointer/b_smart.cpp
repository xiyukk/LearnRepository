#include <memory>

class Resource {
public:
    void doSomething() {}
};

void example1() {
    std::unique_ptr<Resource> resourcePtr(new Resource());

    resourcePtr->doSomething();

    // 当离开作用域时，resourcePtr会自动释放所指向的对象。
}

void example2() {
    std::shared_ptr<Resource> sharedPtr1 = std::make_shared<Resource>();
    std::shared_ptr<Resource> sharedPtr2 = sharedPtr1; // 共享所有权

    sharedPtr1->doSomething();
    sharedPtr2->doSomething();

    // 当sharedPtr1和sharedPtr2都离开作用域并销毁时，所指向的对象才会被释放。
}

class Resource;

class Observer {
    std::weak_ptr<Resource> resourcePtr;
public:
    void observe(const std::shared_ptr<Resource>& resource) {
        resourcePtr = resource;
    }

    void doSomething() {
        if (auto sharedPtr = resourcePtr.lock()) {
            // 通过lock()获得一个shared_ptr，如果资源仍然存在
            sharedPtr->doSomething();
        }
    }
};

void example3() {
    std::shared_ptr<Resource> resource = std::make_shared<Resource>();
    Observer observer;
    observer.observe(resource);

    observer.doSomething();

    // 当resource离开作用域并销毁时，observer中的weak_ptr不影响其生命周期。
}
int main(int argc, char const *argv[])
{
    /* code */
    return 0;
}
