# Elsa CLI

Easy Linux Server Administration tool.
Currently work on Debian Jessie, Debian Stretch, Ubuntu 16.04 and Ubuntu 18.04 only.

## Prepare the requirements

```
git config --global user.name "Your Awesome Name"
git config --global user.email "you@domain.tld"

# Used if you want to sign commit and release
gpg --keyid-format long --list-keys
git config --global user.signingkey xxxxxxxxxxxxxxxx
```

```bash
make deps
sudo npm install -g np commitizen semantic-release
```

## Cross compiling

Please read: <https://kylewbanks.com/blog/cross-compiling-go-applications-for-multiple-operating-systems-and-architectures>

```bash
for GOARCH in 386 amd64; do go build -v -o docs/release/elsa-cli-$GOARCH ; done
```

## Compiling with version

Please read: <https://sbstjn.com/create-golang-cli-application-with-cobra-and-goxc.html>

```bash
apt install gcc make cmake build-essential
```

```bash
go get -v github.com/laher/goxc
goxc -pv=0.0.1 -build-ldflags "-X main.VERSION=0.0.1"
```