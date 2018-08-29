package cmd

import (
	"fmt"
  "os"
	"github.com/spf13/cobra"
  stack "github.com/elsacp/elsa-cli/stack"
)

var Verbose bool

func init() {
	rootCmd.AddCommand(stackCmd)
  stackCmd.AddCommand(subStackNginx)
  stackCmd.PersistentFlags().BoolVarP(&Verbose, "verbose", "v", false, "verbose output")
}

var stackCmd = &cobra.Command{
	Use: "stack",
  TraverseChildren: true,
	Short: "Install application stack",
  Args: cobra.MaximumNArgs(1),
	Run: func(cmd *cobra.Command, args []string) {
		if len(args) < 1 {
      fmt.Println("You need at least one arg. Type `elsa-cli stack -h` to see the available args")
      os.Exit(1)
    }
	},
}

var subStackNginx = &cobra.Command{
  Use:   "nginx",
  Short: "Install Nginx package for static sites",
  Run: func(cmd *cobra.Command, args []string) {
    stack.InstallNginx(Verbose)
  },
}
