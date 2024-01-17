#!/bin/bash

build_type=${1:-Debug}  # 如果没有提供构建类型，使用Debug作为默认值,也可以运行./script/build.sh Release构建Release版本

build_dir="build/$build_type"
output_dir="output/$build_type"

# 创建构建目录
mkdir -p "$build_dir"
cd "$build_dir"

# 清理特定构建类型的输出目录
rm -rf "../../$output_dir"

# 运行CMake配置
cmake -DCMAKE_BUILD_TYPE="$build_type" ../..

# 构建项目
cmake --build .