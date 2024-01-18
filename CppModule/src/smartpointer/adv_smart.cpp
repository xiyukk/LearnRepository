#include <iostream>
#include <memory>
#include <vector>
#include <thread>
#include <mutex>

// 基类：图形对象
class GraphicObject {
public:
    virtual ~GraphicObject() = default;
    virtual void draw() const = 0;
};

// 圆形类
class Circle : public GraphicObject {
public:
    void draw() const override {
        std::cout << "Drawing a circle." << std::endl;
    }
};

// 矩形类
class Rectangle : public GraphicObject {
public:
    void draw() const override {
        std::cout << "Drawing a rectangle." << std::endl;
    }
};

// 创建一个GraphicEditor类，它使用std::unique_ptr来管理图形对象，并且提供了一个线程安全的方法来添加新的图形对象
class GraphicEditor {
    std::vector<std::unique_ptr<GraphicObject>> graphics;
    std::mutex graphicsMutex;

public:
    void addGraphic(std::unique_ptr<GraphicObject> graphic) {
        std::lock_guard<std::mutex> lock(graphicsMutex);
        graphics.push_back(std::move(graphic));
    }

    void drawAll() const {
        for (const auto& graphic : graphics) {
            graphic->draw();
        }
    }
};

// 定义一个Renderer类，它在多线程环境中使用std::shared_ptr来安全地访问和渲染图形对象
class Renderer {
    std::weak_ptr<const GraphicObject> graphic;

public:
    void setGraphic(const std::shared_ptr<const GraphicObject>& newGraphic) {
        graphic = newGraphic;
    }

    void render() {
        if (auto sharedGraphic = graphic.lock()) {
            sharedGraphic->draw();
        } else {
            std::cout << "Graphic object no longer exists." << std::endl;
        }
    }
};

int main() {
    GraphicEditor editor;
    Renderer renderer;

    // 在主线程中添加图形对象
    editor.addGraphic(std::make_unique<Circle>());
    editor.addGraphic(std::make_unique<Rectangle>());

    // 获取一个共享指针到第一个图形对象
    std::shared_ptr<const GraphicObject> sharedCircle = std::make_shared<Circle>();

    // 在另一个线程中渲染
    renderer.setGraphic(sharedCircle);
    std::thread renderThread(&Renderer::render, &renderer);

    // 在主线程中绘制所有图形
    editor.drawAll();

    renderThread.join();
    return 0;
}