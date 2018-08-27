package main

import (
	"fmt"
	"os"
	"os/exec"
	"log"
	"strconv"
	"runtime"
	"reflect"
	"github.com/acobaugh/osrelease"
	"github.com/elsacp/elsa-cli/cmd"
)

// This variables generated during build
var (
	VERSION     = "0.0.1"
	SOURCE_DATE = "2018-08-27T09:47:56+07:00"
)

var (
	elsa_config_dir = "/etc/elsacp"
	osList          = []string{"linux"}
	archList        = []string{"386", "amd64"}
	distroList      = []string{"Debian GNU/Linux", "Ubuntu"}
	debianVersion   = []string{"8", "9"}
	ubuntuVersion   = []string{"16.04", "18.04"}
)

func main() {
	checkOS()
	checkConfig()

	isSudo := exec.Command("id", "-u")
	output, err := isSudo.Output()

	if err != nil {
		log.Fatal(err)
	}

	// 0 = root, 501 = non-root user
	i, err := strconv.Atoi(string(output[:len(output)-1]))
	if err != nil {
		log.Fatal(err)
	}

	if i != 0 {
		fmt.Println("This program must be run as root! (sudo)")
		os.Exit(0)
	}

	cmd.Execute(VERSION, SOURCE_DATE)
}

func checkConfig() {
	if _, err := os.Stat(elsa_config_dir); os.IsNotExist(err) {
		fmt.Println("Initialize configuration files..")
		err = os.MkdirAll(elsa_config_dir, 0755)
		if err != nil {
			fmt.Println("Cannot create configuration directory!")
			os.Exit(0)
		}
	}

	configFile := elsa_config_dir + "/elsacp.conf"
	if _, err := os.Stat(configFile); os.IsNotExist(err) {
		fmt.Println("Configuration file %v doesn't exists!", configFile)
		os.Exit(0)
	}

	file, err := os.Open(configFile) // For read access.
	if err != nil {
		fmt.Println("Cannot read configuration files: %v", file)
		os.Exit(0)
	}
}

func checkOS() {
	// Check OS type
	osType := runtime.GOOS
	osTypeCheck := inArray(osType, osList)
	if osTypeCheck == false {
		exitFailedCheck(osType)
	}

	// Check architecture
	osArch := runtime.GOARCH
	osArchCheck := inArray(osArch, archList)
	if osArchCheck == false {
		exitFailedCheck(osArch)
	}

	osrelease, err := osrelease.Read()
	if err != nil {
		fmt.Printf("Error: %v\n", err)
		return
	}

	// Check distro name
	osName := osrelease["NAME"]
	osVersion := osrelease["VERSION_ID"]
	osNameCheck := inArray(osName, distroList)
	if osNameCheck == false {
		exitFailedCheck(osName)
	}

	// Check Debian version
	if osName == distroList[0] {
		versionCheck := inArray(osVersion, debianVersion)
		if versionCheck == false {
			exitFailedCheck(osName + " " + osVersion)
		}
	}

	// Check Ubuntu version
	if osName == distroList[1] {
		versionCheck := inArray(osrelease["VERSION_ID"], ubuntuVersion)
		if versionCheck == false {
			exitFailedCheck(osName + " " + osVersion)
		}
	}
}

func exitFailedCheck(msg string) {
	fmt.Printf("%v currently is not supported!\n", msg)
	os.Exit(0)
}

func inArray(item interface{}, slice interface{}) bool {
	s := reflect.ValueOf(slice)

	if s.Kind() != reflect.Slice {
		panic("SliceExists() given a non-slice type")
	}

	for i := 0; i < s.Len(); i++ {
		if s.Index(i).Interface() == item {
			return true
		}
	}

	return false
}
