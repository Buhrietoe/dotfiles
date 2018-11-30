#!/bin/bash
# Downloads, builds, and installs a specified go version into your home
# Installed as ~/go[version] and symlinked to ~/go
# After install, just prepend to your path:
# export PATH=~/go/bin:$PATH

set -e

if [ $1 ]; then
    # download and extract
    if [ ! -f "go$1.src.tar.gz" ]; then
	curl -LO "https://dl.google.com/go/go$1.src.tar.gz"
    fi
    if [ -d "go" ]; then
        rm -rf go
    fi
    tar -xvf "go$1.src.tar.gz" || true

    # build
    export GOROOT_BOOTSTRAP=$(go env GOROOT)
    export GOROOT_FINAL=~/go$1
    pushd go/src
    ./make.bash
    popd

    # cleanup
    gohostos=$(go env GOHOSTOS)
    gohostarch=$(go env GOHOSTARCH)
    rm -rf "go/pkg/${gohostos}_${gohostarch}"* 
    rm -rf go/pkg/bootstrap
    rm -rf go/pkg/obj
    rm -rf go/misc
    rm -rf go/test

    # install
    if [ -d "$GOROOT_FINAL" ]; then
        rm -rf "$GOROOT_FINAL"
    fi
    mv -v go $GOROOT_FINAL
    ln -snfv $GOROOT_FINAL ~/go
else
    echo "specify version. Ex: 1.9.3"
    exit 1
fi
