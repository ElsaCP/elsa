package cmd

import (
	"fmt"
  "os"
	"github.com/spf13/cobra"
  "github.com/gobuffalo/packr"
  hlp "github.com/elsacp/elsa-cli/helper"
)

func init() {
	rootCmd.AddCommand(testCmd)
}

var testCmd = &cobra.Command{
	Use: "test",
	Short: "This only just for fun or testing purpose",
	Run: func(cmd *cobra.Command, args []string) {
    pwd, err := os.Getwd()
    if err != nil {
      fmt.Println(err)
      os.Exit(1)
    }
    cf := packr.NewBox(pwd + "/manifest")
    rs := cf.String("nginx/nginx.conf")
    fo := pwd + "/nginx.conf"
    hlp.WriteFile(fo, rs)
    fmt.Println("File writen to: " + fo)
	},
}
