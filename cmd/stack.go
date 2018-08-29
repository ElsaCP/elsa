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
  stackCmd.AddCommand(subStackAll)
  stackCmd.AddCommand(subStackNginx)
  stackCmd.AddCommand(subStackMySQL)
  stackCmd.AddCommand(subStackPgSQL)
  stackCmd.AddCommand(subStackPhp)
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

var subStackAll = &cobra.Command{
  Use:   "all",
  Short: "Install full stack packages",
  Run: func(cmd *cobra.Command, args []string) {
    subStackNginx.Execute()
    subStackMySQL.Execute()
    subStackPgSQL.Execute()
    subStackPhp.Execute()
  },
}

var subStackNginx = &cobra.Command{
  Use:   "nginx",
  Short: "Install Nginx packages for static sites",
  Run: func(cmd *cobra.Command, args []string) {
    stack.InstallNginx(Verbose)
  },
}

var subStackMySQL = &cobra.Command{
  Use:   "mysql",
  Short: "Install MySQL packages",
  Run: func(cmd *cobra.Command, args []string) {
    fmt.Println("TODO")
  },
}

var subStackPgSQL = &cobra.Command{
  Use:   "pgsql",
  Short: "Install PostgreSQL packages",
  Run: func(cmd *cobra.Command, args []string) {
    fmt.Println("TODO")
  },
}

var subStackPhp = &cobra.Command{
  Use:   "php",
  Short: "Install PostgreSQL packages",
  Run: func(cmd *cobra.Command, args []string) {
    fmt.Println("TODO")
  },
}
