package helper

import (
	"fmt"
	"io"
	"os"
  "time"
)

func CreateFile(path string) {
	var _, err = os.Stat(path)
	if os.IsNotExist(err) {
		var file, err = os.Create(path)
		if isError(err) { return }
		defer file.Close()
	}
}

func WriteFile(file string, content string) {
	// open file using READ & WRITE permission
	var f, err = os.OpenFile(file, os.O_RDWR|os.O_CREATE, 0644)
	if isError(err) { return }
	defer f.Close()

	// write some text line-by-line to file
	_, err = f.WriteString(content)
	if isError(err) { return }

	// save changes
	err = f.Sync()
	if isError(err) { return }
}

func ReadFile(path string) {
	// re-open file
	var file, err = os.OpenFile(path, os.O_RDWR, 0644)
	if isError(err) { return }
	defer file.Close()

	// read file, line by line
	var text = make([]byte, 1024)
	for {
		_, err = file.Read(text)

		// break if finally arrived at end of file
		if err == io.EOF {
			break
		}

		// break if error occured
		if err != nil && err != io.EOF {
			isError(err)
			break
		}
	}

	fmt.Println("==> done reading from file %v", path)
	fmt.Println(string(text))
}

func deleteFile(path string) {
	// delete file
	var err = os.Remove(path)
	if isError(err) { return }

	fmt.Println("==> done deleting file %v", path)
}

func isError(err error) bool {
	if err != nil {
		fmt.Println(err.Error())
	}

	return (err != nil)
}

func WriteLog(msg string) {
  d := "/var/log/elsacp"

  // Create log directory if not exists
	if _, err := os.Stat(d); os.IsNotExist(err) {
		err = os.MkdirAll(d, 0755)
		if err != nil {
			fmt.Println("Error: cannot create log directory!")
			os.Exit(0)
		}
	}

  // Write log message to file
  t := time.Now()
  f := d + "/elsa-cli-" + t.Format("200601021504") + ".log"
  WriteFile(f, msg)
  fmt.Println("Task completed, see log at: " + f)
}
