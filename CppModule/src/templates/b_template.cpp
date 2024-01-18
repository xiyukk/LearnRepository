#include <iostream>
#include <string>
#include <vector>
// 实现一个简单的泛型数组类
template <typename T>
class GenericArray {
public:
    GenericArray(size_t size) : size_(size), data_(new T[size]) {}

    T& operator[](size_t index) {
        if (index >= size_) {
            throw std::out_of_range("Index out of range");
        }
        return data_[index];
    }

    ~GenericArray() {
        delete[] data_;
    }

private:
    size_t size_;
    T* data_;
};

// 实现一个泛型的查找算法：
template <typename Iterator, typename T>
Iterator find(Iterator begin, Iterator end, const T& value) {
    for (Iterator it = begin; it != end; ++it) {
        if (*it == value) {
            return it;
        }
    }
    return end;
}

// 创建一个类型特征来检查类型是否是指针：
template <typename T>
struct is_pointer {
    static const bool value = false;
};

template <typename T>
struct is_pointer<T*> {
    static const bool value = true;
};



template <typename T>
class Wrapper {
public:
    Wrapper(const T& value) : value_(value) {}

    void print() const {
        std::cout << value_ << std::endl;
    }

private:
    T value_;
};

// 特化版本
template <>
class Wrapper<std::string> {
public:
    Wrapper(const std::string& value) : value_(value) {}

    void print() const {
        std::cout << "String value: " + value_ << std::endl;
    }

private:
    std::string value_;
};

// 策略模式和策略选择
template <typename SortingStrategy>
class SortedData {
public:
    SortedData(const std::vector<int>& data) : data_(data) {
        SortingStrategy().sort(data_);
    }

    void print() const {
        for (const auto& item : data_) {
            std::cout << item << " ";
        }
        std::cout << std::endl;
    }

private:
    std::vector<int> data_;
};

// 定义排序策略
struct QuickSortStrategy {
    void sort(std::vector<int>& data) {
        // 实现快速排序
    }
};

struct MergeSortStrategy {
    void sort(std::vector<int>& data) {
        // 实现归并排序
    }
};

// 函数对象和Lambda表达式
template <typename Func>
void applyFunction(std::vector<int>& data, Func func) {
    for (auto& item : data) {
        func(item);
    }
}

// 类型推导和自动类型
template <typename Container>
auto getFirstElement(const Container& c) -> decltype(*c.begin()) {
    return *c.begin();
}

//  编译时多态
template <typename Renderer>
class GraphicsObject {
public:
    void render() {
        Renderer::render(*this);
    }
};

class OpenGLRenderer {
public:
    static void render(const GraphicsObject<OpenGLRenderer>& obj) {
        // OpenGL渲染逻辑
    }
};

class Direct3DRenderer {
public:
    static void render(const GraphicsObject<Direct3DRenderer>& obj) {
        // Direct3D渲染逻辑
    }
};



int main(int argc, char const *argv[])
{
    // 使用
    static_assert(is_pointer<int*>::value, "Int pointer");
    static_assert(!is_pointer<int>::value, "Not a pointer");
    // 使用
    SortedData<QuickSortStrategy> sortedDataQuick({5, 2, 9, 1});
    sortedDataQuick.print();

    // 使用
    std::vector<int> data = {1, 2, 3, 4, 5};
    applyFunction(data, [](int& x) { x *= 2; });

    // 使用
    std::vector<int> vec = {10, 20, 30};
    auto firstElement = getFirstElement(vec);

    // 使用
    GraphicsObject<OpenGLRenderer> openglObject;
    GraphicsObject<Direct3DRenderer> direct3dObject;
    return 0;
}

