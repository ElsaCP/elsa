package main

import (
	"github.com/elsacp/elsa-cli/helper"
	"github.com/elsacp/elsa-cli/cmd"
)

// This variables generated during build
var VERSION     = "0.0.1"
var SOURCE_DATE = "2018-08-27T10:05:11+07:00"

func main() {
	helper.CheckOS()
    helper.CheckPrivileges()
	cmd.Execute(VERSION, SOURCE_DATE)
}
