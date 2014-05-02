#!/bin/sh
git submodule init
git submodule update
cp -v .* ~/
cp -rv scripts .config .vim ~/
