#!/bin/bash
if [[ $# -eq 0 || $1 == "--help" ]]; then
  echo "Usage ./package.sh -<option> --[architecture]"
  echo "      <option>: b - build"
  echo "                d - deploy"
  echo "                ud - update deploy"
  echo "                dd - update dev deployment image"
  echo "                dt - update test deployment image"
  echo "                mt - manual testing"
  echo "                e - create environment image"
  echo "                d - deploy"
  echo "                t - unittest"
  echo "                a - all"
  echo "                      "
  echo "      <architecture>: arm - ARM 32bit"
elif [ "$2" == "--arm" ]; then
  if [[ "$1" == "-b" || $1 == "--build" ]]; then
    sudo docker build -t image_rotate.dev:arm -f ./Docker/arm/dev.Dockerfile .
    sudo docker push dock101/image_rotate.dev:arm

  elif [[ "$1" == "-ud" || $1 == "--update-deploy" ]]; then
    sudo docker build -t dock101/image_rotate:arm -f ./Docker/arm/deploy.Dockerfile .
    sudo docker push dock101/image_rotate:arm

  elif [[ "$1" == "-d" || $1 == "--deploy" ]]; then
    mkdir -p NavVis_data
    sudo docker-compose -f ./Docker/arm/deploy.docker-compose.yml up -d

  elif [[ "$1" == "-t" || $1 == "--unit-test" ]]; then
    echo -e "\n\n ##############\n\n Executing Unit tests \n\n #############\n\n"
    sudo docker build -t image_rotate.test:arm -f ./Docker/arm/test.Dockerfile .
    sudo docker push dock101/image_rotate.test:arm
  
  elif [[ "$1" == "-dt" || $1 == "--deploy-test" ]]; then
    echo -e "\n\n ##############\n\n Deploying to test environment \n\n #############\n\n"
    sudo docker-compose -f ./Docker/arm/test.docker-compose.yml up -d

  elif [[ "$1" == "-dd" || $1 == "--deploy-dev" ]]; then
    echo -e "\n\n ##############\n\n Deploying to dev environment \n\n #############\n\n"
    sudo docker-compose -f ./Docker/arm/dev.docker-compose.yml up -d

  elif [[ "$1" == "-mt" || $1 == "--manual-test" ]]; then
    mkdir -p NavVis_data
    sudo docker-compose -f ./Docker/arm/dev.docker-compose.yml run image_rotate

  elif [[ "$1" == "-e" || $1 == "--env" ]]; then
    sudo docker build -t dock101/image_rotate.env:arm -f ./Docker/arm/env.Dockerfile .
    sudo docker push dock101/image_rotate.env:arm

  elif [[ "$1" == "-a" || $1 == "-all" ]]; then
    sudo docker build -t image_rotate.test -f ./Docker/arm/dev.Dockerfile .

  else
    echo "Invalid command. Try ./run_build_test.sh --help"
  fi
else
  if [[ "$1" == "-b" || $1 == "--build" ]]; then
    sudo docker build -t image_rotate.dev:x64 -f ./Docker/x64/dev.Dockerfile .
    sudo docker push dock101/image_rotate.dev:x64

  elif [[ "$1" == "-ud" || $1 == "--update-deploy" ]]; then
    sudo docker build -t dock101/image_rotate:x64 -f ./Docker/x64/deploy.Dockerfile .
    sudo docker push dock101/image_rotate:x64

  elif [[ "$1" == "-d" || $1 == "--deploy" ]]; then
    mkdir -p NavVis_data
    sudo docker-compose -f ./Docker/x64/deploy.docker-compose.yml up -d

  elif [[ "$1" == "-t" || $1 == "--unit-test" ]]; then
    echo -e "\n\n ##############\n\n Executing Unit tests \n\n #############\n\n"
    sudo docker build -t image_rotate.test:x64 -f ./Docker/x64/test.Dockerfile .
    sudo docker push dock101/image_rotate.test:x64
  
  elif [[ "$1" == "-dt" || $1 == "--deploy-test" ]]; then
    echo -e "\n\n ##############\n\n Deploying to test environment \n\n #############\n\n"
    sudo docker-compose -f ./Docker/x64/test.docker-compose.yml up -d

  elif [[ "$1" == "-dd" || $1 == "--deploy-dev" ]]; then
    echo -e "\n\n ##############\n\n Deploying to dev environment \n\n #############\n\n"
    sudo docker-compose -f ./Docker/x64/dev.docker-compose.yml up -d

  elif [[ "$1" == "-mt" || $1 == "--manual-test" ]]; then
    mkdir -p NavVis_data
    sudo docker-compose -f ./Docker/x64/dev.docker-compose.yml run image_rotate

  elif [[ "$1" == "-e" || $1 == "--env" ]]; then
    sudo docker build -t dock101/image_rotate.env:x64 -f ./Docker/x64/env.Dockerfile .
    sudo docker push dock101/image_rotate.env:x64

  elif [[ "$1" == "-a" || $1 == "-all" ]]; then
    sudo docker build -t image_rotate.test -f ./Docker/x64/dev.Dockerfile .

  else
    echo "Invalid command. Try ./run_build_test.sh --help"
  fi
fi