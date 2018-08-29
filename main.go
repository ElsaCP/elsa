package main

import (
	hlp "github.com/elsacp/elsa-cli/helper"
	"github.com/elsacp/elsa-cli/cmd"
)

// This variables generated during build
const (
  VERSION    = "0.0.1"
  BUILD_DATE = "Wed Aug 29 07:13:56 DST 2018"
  BUILD_ARCH = ""
)

func main() {
	hlp.CheckOS()
  hlp.CheckPrivileges()
	cmd.Execute(VERSION, BUILD_DATE, BUILD_ARCH)
}
