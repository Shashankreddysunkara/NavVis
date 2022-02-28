add_library(catch_main STATIC catch_main.cpp)

add_executable(tests tests.cpp)
target_link_libraries(tests PRIVATE catch_main ${OpenCV_LIBS})
target_include_directories(tests PRIVATE ${PROJECT_SOURCE_DIR}/src)

add_test(NAME tests COMMAND tests)