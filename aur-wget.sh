#!/bin/bash
wget http://aur.archlinux.org/packages/$1/$1.tar.gz
tar xvzf $1.tar.gz
rm -f $1.tar.gz
