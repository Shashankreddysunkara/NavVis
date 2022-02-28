cmake_minimum_required(VERSION 3.5)

project(image_rotate CXX)

find_package(OpenCV REQUIRED COMPONENTS core photo imgproc imgcodecs)
list(APPEND INCLUDE_DIRS ${OpenCV_INCLUDE_DIRS})
list(APPEND LIBRARY_DIRS ${OpenCV_LIBRARY_DIRS})
list(APPEND GLOBAL_LIBS ${OpenCV_LIBS})

include_directories(${OpenCV_INCLUDE_DIRS})
link_directories(${OpenCV_LIBRARY_DIRS})

add_executable(image_rotate src/main.cpp)
target_link_libraries(image_rotate ${OpenCV_LIBS})

enable_testing()
add_subdirectory(test)