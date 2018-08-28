package cmd

import (
  "fmt"
	"github.com/spf13/cobra"
  "github.com/matishsiao/goInfo"
)

func init() {
	rootCmd.AddCommand(certbotCreateCmd)
}

// https://goenning.net/2017/11/08/free-and-automated-ssl-certificates-with-go/
var certbotCreateCmd = &cobra.Command{
	Use: "certbot",
	Short: "Generate Letsencrypt SSL Certificate",
	Long: "Generate Letsencrypt SSL Certificate without certbot.",
	Run: func(cmd *cobra.Command, args []string) {
    gi := goInfo.GetInfo()
    fmt.Println(gi.Hostname)
	},
}
