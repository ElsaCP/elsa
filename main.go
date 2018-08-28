package main

import (
	hlp "github.com/elsacp/elsa-cli/helper"
	"github.com/elsacp/elsa-cli/cmd"
)

// This variables generated during build
const (
  VERSION    = "0.0.2"
  BUILD_DATE = "Tue Aug 28 21:42:31 DST 2018"
  BUILD_ARCH = ""
)

func main() {
	hlp.CheckOS()
  hlp.CheckPrivileges()
	cmd.Execute(VERSION, BUILD_DATE, BUILD_ARCH)
}
