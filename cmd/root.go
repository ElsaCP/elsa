package cmd

import (
	"fmt"
	"os"

	"github.com/spf13/cobra"
)

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
	Args: cobra.MinimumNArgs(1),
	Run: func(cmd *cobra.Command, args []string) {
		// Do Stuff Here
	},
}

func Execute(appVersion string, appBuildDate string) {
    VERSION = appVersion
    SOURCE_DATE = appBuildDate

	if err := rootCmd.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}
