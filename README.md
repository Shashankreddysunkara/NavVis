# ImageRotate

## Required dependencies

This project depends is built on **Ubuntu 18.04** and requires the following system dependencies

* cmake
* coreutils
* gcc
* g++
* libopencv-dev

## How to build

```bash
mkdir build && cd build
cmake ..
make 
```

## How to run unit tests

```bash
mkdir build && cd build
cmake ..
make && make test
```

## How to run the exec

```bash
mkdir build && cd build
cmake ..
make 
./image_rotate ../plane.jpg plane_out.jpg
```