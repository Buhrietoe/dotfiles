#!/bin/bash

utils=(
    "github.com/rakyll/govalidate@latest"
    "github.com/rakyll/hey@latest"
    "github.com/Buhrietoe/httpdir@latest"
    "github.com/claudiodangelis/qrcp@latest"
)

for util in ${utils[@]}; do
    echo "Installing $util"
    nice go install -v $util
done
