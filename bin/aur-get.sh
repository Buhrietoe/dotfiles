#!/bin/bash
curl -sL https://aur.archlinux.org/packages/${1:0:2}/$1/$1.tar.gz | tar -xvz
