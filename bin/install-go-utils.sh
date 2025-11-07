#!/bin/bash

utils=(
    "golang.org/x/tools/gopls@latest"
    "github.com/rakyll/govalidate@latest"
    "github.com/rakyll/hey@latest"
    "github.com/Buhrietoe/httpdir@latest"
    "github.com/sheepla/gofind@latest"
    "github.com/claudiodangelis/qrcp@latest"
    "github.com/charmbracelet/crush@latest"
    "github.com/jesseduffield/lazygit@latest"
    "github.com/Buhrietoe/todo-mcp@latest"
)

for util in ${utils[@]}; do
    echo "Installing $util"
    nice go install -v $util
done
