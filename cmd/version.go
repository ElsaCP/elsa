package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

func init() {
	rootCmd.AddCommand(versionCmd)
}

var (
	// VERSION is defining the app build information
	VERSION = "Elsa Cli v0.1.1 - Build date: 27/08/2018"
)

var versionCmd = &cobra.Command{
	Use:   "version",
	Short: "Print the version number of elsa-cli",
	Long:  `All software has versions. This software is part of ElsaCP.`,
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println(VERSION)
	},
}
