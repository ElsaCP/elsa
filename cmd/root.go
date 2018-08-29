package cmd

import (
	"fmt"
	"os"
	"github.com/spf13/cobra"
	"github.com/spf13/viper"
)

const defaultConfigFile = "elsacp"
const defaultConfigPath = "/etc/elsacp/"

var (
	VERSION string
  BUILD_DATE string
  BUILD_ARCH string
)

var rootCmd = &cobra.Command{
	Use: "elsa-cli",
	Short: "A simplified Open Source Linux server administration tool",
	Long: "\nElsaCP is a robust and simplified Open Source Linux server administration tool." +
		"\nBuilt in Indonesia based on the author's experience in managing Linux servers." +
		"\n\nComplete documentation available at https://elsacp.github.io",
	Run: func(cmd *cobra.Command, args []string) {
		if len(args) < 1 {
      fmt.Println("You need at least one arg!")
      fmt.Println("Use `help` flag to see the available commands")
    }
	},
}

var cfgDir string
var cfgFile string

func init() {
  cobra.OnInitialize(initConfig)
  rootCmd.PersistentFlags().StringVar(&cfgFile, "config", "", "Config file (default is " + defaultConfigPath + defaultConfigFile + ".yaml)")
  viper.SetDefault("config", defaultConfigPath + defaultConfigFile + ".yaml")
}

func initConfig() {
  if cfgFile != "" {
    // Use config file from the flag.
    viper.SetConfigFile(cfgFile)
  } else {
    if _, err := os.Stat(defaultConfigPath); os.IsNotExist(err) {
      fmt.Println(err)
      os.Exit(1)
    }
    // Search config file in etc directory
    viper.SetConfigName(defaultConfigFile)
    viper.AddConfigPath(defaultConfigPath)
  }

  if err := viper.ReadInConfig(); err != nil {
    fmt.Println("Error:", err)
    os.Exit(1)
  }
}

func Execute(ver string, build string, arch string) {
  VERSION    = ver
  BUILD_DATE = build
  BUILD_ARCH = arch
	if err := rootCmd.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}
