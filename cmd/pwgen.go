package cmd

import (
	"fmt"
  "os"
	"github.com/spf13/cobra"
  hlp "github.com/elsacp/elsa-cli/helper"
  "strconv"
)

var Length int

func init() {
	rootCmd.AddCommand(pwgenCmd)
  // pwgenCmd.PersistentFlags().BoolVarP(&Length, "length", "v", false, "verbose output")
}

var pwgenCmd = &cobra.Command{
	Use: "pwgen",
	Short: "Generate random password",
  Args: cobra.MaximumNArgs(1),
	Run: func(cmd *cobra.Command, args []string) {
    if len(args) > 0 {
      i, err := strconv.Atoi(args[0])
      if err != nil {
        fmt.Println(err)
        os.Exit(1)
      }
      p, _ := hlp.GenerateRandomString(i)
      fmt.Println(p)
    } else {
      p, _ := hlp.GenerateRandomString(8)
      fmt.Println(p)
    }
	},
}
