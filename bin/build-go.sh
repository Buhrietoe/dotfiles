#!/bin/bash
# Downloads, builds, and installs a specified go version into your home
# Installed as ~/go[version] and symlinked to ~/go
# After install, just add to your path:
# export PATH=$PATH:~/go/bin

set -e

if [ $1 ]; then
    # Download and extract
    if [ ! -f "go$1.src.tar.gz" ]; then
	curl -LO "https://dl.google.com/go/go$1.src.tar.gz"
    fi
    rm -rf go
    tar -xvf "go$1.src.tar.gz" || true

    # Build
    export GOROOT_BOOTSTRAP=$(go env GOROOT)
    export GOROOT_FINAL=~/go$1
    pushd go/src
    ./all.bash
    popd
    mv -v go $GOROOT_FINAL
    ln -snfv $GOROOT_FINAL ~/go
else
    echo "specify version. Ex: 1.9.3"
    exit 1
fi
