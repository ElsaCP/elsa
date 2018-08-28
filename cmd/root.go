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
    SOURCE_DATE string
)

var rootCmd = &cobra.Command{
	Use:   "elsa-cli",
	Short: "A simplified Open Source Linux server administration tool",
	Long: "\nElsaCP is a robust and simplified Open Source Linux server administration tool." +
		"\nBuilt in Indonesia based on the author's experience in managing Linux servers." +
		"\n\nComplete documentation available at https://elsacp.github.io",
	// Args: cobra.MinimumNArgs(1),
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
    rootCmd.PersistentFlags().StringVar(&cfgFile, "config", "", "Config file (default is /etc/elsacp/elsacp.yaml)")
    // rootCmd.PersistentFlags().StringVarP(&projectBase, "projectbase", "b", "", "base project directory eg. github.com/spf13/")
    // rootCmd.PersistentFlags().StringP("author", "a", "YOUR NAME", "Author name for copyright attribution")
    // rootCmd.PersistentFlags().StringVarP(&userLicense, "license", "l", "", "Name of license for the project (can provide `licensetext` in config)")
    // rootCmd.PersistentFlags().Bool("viper", true, "Use Viper for configuration")
    // viper.BindPFlag("author", rootCmd.PersistentFlags().Lookup("author"))
    // viper.BindPFlag("projectbase", rootCmd.PersistentFlags().Lookup("projectbase"))
    // viper.BindPFlag("useViper", rootCmd.PersistentFlags().Lookup("viper"))
    // viper.SetDefault("author", "Aris Ripandi <ripandi@pm.me>")
    // viper.SetDefault("license", "MIT")
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

func Execute(appVersion string, appBuildDate string) {
    VERSION = appVersion
    SOURCE_DATE = appBuildDate
	if err := rootCmd.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}

/*
func checkConfig() {
	if _, err := os.Stat(cfgDir); os.IsNotExist(err) {
		fmt.Println("Initialize configuration files..")
		err = os.MkdirAll(cfgDir, 0755)
		if err != nil {
			fmt.Println("Cannot create configuration directory!")
			os.Exit(0)
		}
	}

	configFile := cfgDir + "/elsacp.conf"
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
*/
