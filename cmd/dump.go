package cmd

import (
	"fmt"
	"github.com/spf13/cobra"
	"github.com/spf13/viper"
  yaml "gopkg.in/yaml.v2"
  // "encoding/json"
)

func init() {
	rootCmd.AddCommand(cfgDumpCmd)
}

var cfgDumpCmd = &cobra.Command{
	Use:   "dump",
	Short: "Print the configuration file",
	Run: func(cmd *cobra.Command, args []string) {
    x := viper.AllSettings()
    res, err := yaml.Marshal(x)
    // res, err := json.MarshalIndent(x, "", "  ")
    if err != nil {
      fmt.Println("Error:", err)
    }
    fmt.Print(string(res))
	},
}
