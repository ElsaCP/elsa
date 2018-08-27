# Elsa CLI

Easy Linux Server Administration tool.
Currently work on Debian Jessi, Debian Stretch, Ubuntu 16.04 and Ubuntu 18.04 only.

## Prepare the requirements

```bash
go get -v github.com/laher/goxc
go get -u github.com/spf13/cobra/cobra
go get github.com/matishsiao/goInfo
go get github.com/acobaugh/osrelease
go get golang.org/x/crypto/acme/autocert
```

## Cross compiling

Please read: <https://kylewbanks.com/blog/cross-compiling-go-applications-for-multiple-operating-systems-and-architectures>

```bash
for GOARCH in 386 amd64; do go build -v -o docs/release/elsa-cli-$GOARCH ; done
```

## Compiling with version

Please read: <https://sbstjn.com/create-golang-cli-application-with-cobra-and-goxc.html>

```bash
goxc -pv=0.0.1 -build-ldflags "-X cmd.version.VERSION=0.0.1"
```