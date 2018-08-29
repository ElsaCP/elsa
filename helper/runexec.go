package helper

import (
	"bytes"
	"fmt"
	"io"
	"log"
	"os"
	"os/exec"
  "strings"
)

func RunExec(command string, progress bool) {

	x := exec.Command("bash", "-c", command)

  if progress == true {
    stdoutIn, _ := x.StdoutPipe()
    stderrIn, _ := x.StderrPipe()

    var stdoutBuf, stderrBuf bytes.Buffer
    var errStdout, errStderr error
    stdout := io.MultiWriter(os.Stdout, &stdoutBuf)
    stderr := io.MultiWriter(os.Stderr, &stderrBuf)
    err := x.Start()
    if err != nil {
      log.Fatalf("Error: '%s'\n", err)
    }

    go func() {
      _, errStdout = io.Copy(stdout, stdoutIn)
    }()

    go func() {
      _, errStderr = io.Copy(stderr, stderrIn)
    }()

    err = x.Wait()
    if err != nil {
      log.Fatalf("Error: '%s'\n", err)
    }
    if errStdout != nil || errStderr != nil {
      log.Fatal("failed to capture stdout or stderr\n")
    }
    // outStr := string(stdoutBuf.Bytes())
    // fmt.Printf("out:\n%s\n", outStr)
  } else {
    out, err := x.CombinedOutput()
    if err != nil {
        log.Fatalf("Error: %s\n", err)
    }
    WriteLog(string(out))
  }
}

// Run external command and get the single line value from result
func RunExecV(c string) string {
  x := exec.Command("bash", "-c", c)
  out, err := x.CombinedOutput()
  if err != nil {
      log.Fatalf("Error: %s\n", err)
  }
  r := fmt.Sprintf("%s", out)
  z := strings.Replace(r, "\n", "", -1)
  return z
}
