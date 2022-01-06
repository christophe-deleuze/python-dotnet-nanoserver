# Python Docker Image for DotNet Runtime Nano Server

This repository contains a Python docker image build script for Windows DotNet Runtime Nano Server.

[Docker Hub](https://hub.docker.com/repository/docker/deleuzech/python-dotnet-nanoserver)

## How to use

```powershell
docker pull deleuzech/python-dotnet-nanoserver:3.10.1_1809_6.0.1
docker run -it deleuzech/python-dotnet-nanoserver:3.10.1_1809_6.0.1
```

## How to build

You can build your Nano Server-based Python image with the below command.

```powershell
$EACH_PYTHON_VERSION='3.10.1'
$EACH_WIN_VERSION='1809'
$EACH_DOTNET_RUNTIME_VERSION='6.0.1'
$IMAGE_TAG="${EACH_PYTHON_VERSION}_${EACH_WIN_VERSION}_${EACH_DOTNET_RUNTIME_VERSION}"

$TARGET_PYTHON_PIP_VERSION='21.3.1'
$TARGET_PYTHON_GET_PIP_URL='https://github.com/pypa/get-pip/raw/d59197a3c169cef378a22428a3fa99d33e080a5d/get-pip.py'

docker build \
    -t python-nanoserver:$IMAGE_TAG \
    --build-arg WINDOWS_VERSION=$EACH_WIN_VERSION \
    --build-arg DOTNET_RUNTIME_VERSION=$EACH_DOTNET_RUNTIME_VERSION \
    --build-arg PYTHON_VERSION=$EACH_PYTHON_VERSION \
    --build-arg PYTHON_RELEASE=$EACH_PYTHON_VERSION \
    --build-arg PYTHON_PIP_VERSION=$TARGET_PYTHON_PIP_VERSION \
    --build-arg PYTHON_GET_PIP_URL=$TARGET_PYTHON_GET_PIP_URL \
    .
```

This image includes pip and virtualenv.

## Contribution

I tested this Docker image for Windows Nano Server 1809. If you make a docker image for another version of Windows, please make a pull request with some tests.

### Test Criteria

- The image you built should support the pip tool.
- The image you built should support the virtualenv tool.
- The image you built can install Django via a virtualenv isolated environment.
- The image you built can install AWS CLI, and it does not display .py file association missing error.
- More testing criteria are welcome!