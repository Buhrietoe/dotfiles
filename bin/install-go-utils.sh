#!/bin/bash

utils=(
    "github.com/rakyll/govalidate@latest"
    "github.com/rakyll/hey@latest"
    "github.com/Buhrietoe/httpdir@latest"
    "github.com/sheepla/gofind@latest"
    "github.com/claudiodangelis/qrcp@latest"
    "github.com/charmbracelet/crush@latest"
    "github.com/jesseduffield/lazygit@latest"
    "golang.org/x/tools/gopls@latest"
    "github.com/Buhrietoe/todo-mcp@latest"
    "github.com/f/mcptools/cmd/mcptools@latest"
)

for util in ${utils[@]}; do
    echo "Installing $util"
    nice go install -v $util
done
