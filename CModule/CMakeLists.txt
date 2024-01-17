file(GLOB_RECURSE SOURCES "src/*.c")

foreach(SOURCE ${SOURCES})
    get_filename_component(TARGET_NAME "${SOURCE}" NAME_WE)
    get_filename_component(SOURCE_PATH "${SOURCE}" PATH)
    get_filename_component(SOURCE_SUBDIR "${SOURCE_PATH}" NAME)

    add_executable(${TARGET_NAME} ${SOURCE})

    # 设置输出目录
    set_target_properties(${TARGET_NAME} PROPERTIES
                          RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/output/${CMAKE_BUILD_TYPE}/CModule/${SOURCE_SUBDIR}")
endforeach()