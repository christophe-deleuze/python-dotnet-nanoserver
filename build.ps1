#!/usr/bin/env pwsh
$TARGET_PYTHON_VERSION=('3.9.9', '3.10.1')
$TARGET_WINDOWS_VERSION=('ltsc2022', '20H2', '1809')
$TARGET_DOTNET_RUNTIME_VERSION=('3.1.22', '5.0.13', '6.0.1')
$TARGET_PYTHON_PIP_VERSION='21.3.1'
$TARGET_PYTHON_GET_PIP_URL='https://github.com/pypa/get-pip/raw/d59197a3c169cef378a22428a3fa99d33e080a5d/get-pip.py'

foreach ($EACH_PYTHON_VERSION in $TARGET_PYTHON_VERSION) {
    foreach ($EACH_WIN_VERSION in $TARGET_WINDOWS_VERSION) {
        foreach ($EACH_DOTNET_RUNTIME_VERSION in $TARGET_DOTNET_RUNTIME_VERSION) {
            $IMAGE_TAG="${EACH_PYTHON_VERSION}_${EACH_WIN_VERSION}_${EACH_DOTNET_RUNTIME_VERSION}"
            docker build `
                -t python-dotnet-nanoserver:$IMAGE_TAG `
                --build-arg WINDOWS_VERSION=$EACH_WIN_VERSION `
                --build-arg DOTNET_RUNTIME_VERSION=$EACH_DOTNET_RUNTIME_VERSION `
                --build-arg PYTHON_VERSION=$EACH_PYTHON_VERSION `
                --build-arg PYTHON_RELEASE=$EACH_PYTHON_VERSION `
                --build-arg PYTHON_PIP_VERSION=$TARGET_PYTHON_PIP_VERSION `
                --build-arg PYTHON_GET_PIP_URL=$TARGET_PYTHON_GET_PIP_URL `
                .
            docker tag python-dotnet-nanoserver:$IMAGE_TAG deleuzech/python-dotnet-nanoserver:$IMAGE_TAG
            docker push deleuzech/python-dotnet-nanoserver:$IMAGE_TAG
            docker rmi python-dotnet-nanoserver:$IMAGE_TAG
        }
    }
}

docker container prune
docker image prune
