package cmd

import (
	"fmt"
  "os"
	"github.com/spf13/cobra"
  hlp "github.com/elsacp/elsa-cli/helper"
  "strconv"
)

var SafeUrl bool

func init() {
	rootCmd.AddCommand(pwgenCmd)
  pwgenCmd.PersistentFlags().BoolVarP(&SafeUrl, "safe-url", "s", false, "return a URL-safe, base64 encoded")
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
      if (SafeUrl) {
        PrintPwgenSafe(i)
      } else {
        PrintPwgen(i)
      }
    } else {
      if (SafeUrl) {
        PrintPwgenSafe(8)
      } else {
        PrintPwgen(8)
      }
    }
	},
}

func PrintPwgen(n int) {
  p, _ := hlp.StrRand(n)
  fmt.Println(p)
}

func PrintPwgenSafe(n int) {
  p, _ := hlp.StrRandURLSafe(n)
  fmt.Println(p)
}
