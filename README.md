[![Docker CI / CD](https://github.com/Shashankreddysunkara/NavVis/actions/workflows/ci-cd.yml/badge.svg)](https://github.com/Shashankreddysunkara/NavVis/actions/workflows/ci-cd.yml)

# Summary of my work

## Table of Contents 

- [Structure](#structure)
- [Getting Started](#getting_started)
- [Deployment](#deployment)
- [Usage](#usage)
- [Artifacts](#artifacts) 
- [Author](#author)

## 1. Structure
<a name = "structure"></a>

The skeleton structure of my approach for dockerising c++ application to run in ubuntu18.04 host consists of following structure: 

<img width=250px height=550px src="./docs/skeleton structure.png" alt="Project Plan"></a> 

## 2. Getting Started <a name = "getting_started"></a>

To make things easier for developers, I have made use of Dockerfile and docker-compose file for build, dev, test, and deployment. This takes away most of the problems that you might face during project setup which includes library installation, environment variable setup etc. For the upcoming steps to work, I installed following applications on my OS via a script but we can even install manually.

### 2.a Prerequisites

- Docker - v20.10.12
- Docker-Compose - v1.23.1
- Git - 2.17.1
- Ubuntu OS - 18.04
- Dockerhub
- Github

### 2.b Build

There are in-total 4 jobs created in single "ci-cd.yml" pipeline. 

## Job 1: build_x64

The build steps within this job makes use of docker that comes packed with all the necessary libraries that we are using. Under the hood, it builds the Dockerfile, create a base image i.e. env image and pushes to dockerhub. If the image creation exits with a non-zero code, then the build will be not successful (same for all below Jobs).

Respective docker commands for this job will be run via a script file "./package.sh" with argument "-e"

### Automation: 
Github Actions will run the shell script automatically upon push to respective branch based on conditions set to piepline.
### Manual: 
Run the following command from project root:
```bash
./package.sh -e
```

## Job 2: dev_x64

This job purpose is to create a development environment image to be deployed in development target servers. The build steps involved in this job 
builds the "dev.Dockerfile" and tag it with "<docker-target-account>/image_rotate.dev:x64" which is then pushed to dockerhub and deploys this image in dev env with argument as "-dd" to "./package.sh".

### Automation: 
Github Actions will run the shell script automatically upon push to respective branch based on conditions set to piepline.
### Manual: 
Run the following command from project root:
```bash
./package.sh -b && ./package.sh -dd
```

## Job 3: test_x64

This job has steps involved to run unit-tests from the "test.Dockerfile" and creates an image and pushed to dockerhub to be later pulled and run it in test environment.

### Automation: 
Github Actions will run the shell script automatically upon push to respective branch based on conditions set to piepline.
### Manual: 
Run the following command from project root:
```bash
./package.sh -t && ./package.sh -dt
```

### Unit-Test results: 

<img width=450px height=150px src="./docs/NavVis Unit-test results.png" alt="Project Plan"></a>

## Job 3: deploy_x64

This Job will deploy dockerised c++ app in production environment by pulling prod image from dockerhub.
  
### Automation: 
Github Actions will run the shell script automatically upon push to respective branch based on conditions set to piepline.
### Manual: 
Run the following command from project root:
```bash
./package.sh -ud && ./package.sh -d
```
  
---  

## 3. Deployment  <a name = "deployment"></a>

For the purpose of deployment, we can straight away use the docker hub image that automated ci-cd pipeline deployed into dockerhub.

![Docker Pulls](https://img.shields.io/docker/pulls/dock101/image_rotate)
  
To run the deployment build, simply run the following command:
```bash
./package.sh -d
```  
---

### Deployment results:
<a name = "test_x64"></a>


<img width=1000px height=450px src="./docs/NavVis CI-CD Pipeline results.png" alt="Project Plan"></a> 

## 4. Usage
<a name = "usage"></a>

Once the production deployment build has been completed in the container, the logs of that container will show output of the file generated.

<img width=750px height=50px src="./docs/NavVis Final solution of binary execution.png" alt="Project Plan"></a> 

## 4. Artifacts
<a name = "artifacts"></a>

Generated docker images as artifacts are deployed to target dockerhub registry

<img width=740px height=250px src="./docs/NavVis artifacts in dockerhub results.png" alt="Project Plan"></a>

## 5. Author
<a name = "author"></a>

- [@Shashank Reddy Sunkara](https://shashankreddysunkara.github.io/blog/)  

---

---
# NavVis Task - ImageRotate

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
