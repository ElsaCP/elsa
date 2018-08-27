package cmd

import (
	"github.com/spf13/cobra"
    "github.com/matishsiao/goInfo"
)

func init() {
	rootCmd.AddCommand(vhostCreateCmd)
}

var (
	// VERSION is defining the app build information
	// VERSION = "Elsa Cli v0.1.1 - Build date: 27/08/2018"
)

var vhostCreateCmd = &cobra.Command{
	Use:   "vhost",
	Short: "Create Nginx virtualhost",
	Long:  "Generate Nginx VirtualHost configuration file.",
	Run: func(cmd *cobra.Command, args []string) {
        gi := goInfo.GetInfo()
        gi.VarDump()
	},
}
