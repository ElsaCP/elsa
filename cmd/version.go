package cmd

import (
	"fmt"
	"github.com/spf13/cobra"
)

func init() {
	rootCmd.AddCommand(versionCmd)
}

var versionCmd = &cobra.Command{
	Use: "version",
	Short: "Print the version and build information",
	Long: "All software has versions. This software is part of ElsaCP.",
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("elsa-cli " + BUILD_ARCH + " v" + VERSION +
      " - " + "Build date: " + BUILD_DATE)
	},
}
