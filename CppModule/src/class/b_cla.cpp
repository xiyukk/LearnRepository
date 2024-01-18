#include <iostream>
#include <fstream>
#include <string>
#include <mutex>
#include <memory>
#include <sstream>
#include <cstdio> // 用于std::remove

// 如何设计一个工业级类的最佳实践
class Logger {
public:
    Logger(const std::string& filename) : logFile_(filename) {
        if (!logFile_.is_open()) {
            throw std::runtime_error("Unable to open file: " + filename);
        }
    }

    void log(const std::string& message) {
        std::lock_guard<std::mutex> lock(mutex_);
        logFile_ << message << std::endl;
    }

    // 禁止拷贝和赋值
    Logger(const Logger&) = delete;
    Logger& operator=(const Logger&) = delete;

    // 支持移动构造和赋值
    Logger(Logger&&) noexcept = default;
    Logger& operator=(Logger&&) noexcept = default;

    ~Logger() {
        if (logFile_.is_open()) {
            logFile_.close();
        }
    }

private:
    std::ofstream logFile_;
    std::mutex mutex_;
};


// 用于读取日志文件内容的辅助函数
std::string readFileContent(const std::string& filename) {
    std::ifstream file(filename);
    std::stringstream buffer;
    buffer << file.rdbuf();
    return buffer.str();
}

void testLogger() {
    std::string filename = "test_log.txt";

    // 测试日志记录功能
    {
        Logger logger(filename);
        logger.log("Test message 1");
        logger.log("Test message 2");
    } // Logger析构，关闭文件

    // 验证文件内容
    std::string content = readFileContent(filename);
    if (content.find("Test message 1") != std::string::npos &&
        content.find("Test message 2") != std::string::npos) {
        std::cout << "Log writing test passed." << std::endl;
    } else {
        std::cout << "Log writing test failed." << std::endl;
    }

    // 测试异常处理（尝试打开不存在的文件）
    try {
        Logger logger("non_existent_directory/non_existent_file.log");
        std::cerr << "Exception was expected but not thrown." << std::endl;
    } catch (const std::exception& e) {
        std::cout << "Caught expected exception: " << e.what() << std::endl;
    }

    // 清理测试文件
    std::remove(filename.c_str());
}

int main() {
    testLogger();
    return 0;
}