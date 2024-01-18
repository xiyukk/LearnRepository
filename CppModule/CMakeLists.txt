find_package(Threads REQUIRED)

file(GLOB_RECURSE SOURCES "src/*.cpp")
foreach(SOURCE ${SOURCES})
    get_filename_component(TARGET_NAME "${SOURCE}" NAME_WE)
    get_filename_component(SOURCE_PATH "${SOURCE}" PATH)
    get_filename_component(SOURCE_SUBDIR "${SOURCE_PATH}" NAME)

    add_executable(${TARGET_NAME} ${SOURCE})
    target_compile_features(${TARGET_NAME} PUBLIC cxx_std_17)

    # 设置输出目录
    set_target_properties(${TARGET_NAME} PROPERTIES
                          RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/output/${CMAKE_BUILD_TYPE}/CppModule/${SOURCE_SUBDIR}")
     # 链接线程库
     target_link_libraries(${TARGET_NAME} PRIVATE Threads::Threads)
endforeach()