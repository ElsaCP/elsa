# Elsa CLI

Easy Linux Server Administration tool.
Currently work on Debian Jessie, Debian Stretch, Ubuntu 16.04 and Ubuntu 18.04 only.

__Important Note:__ *This project still heavy development, not ready to use at production server*

## Installing Dependencies

```bash
apt install gcc make cmake build-essential nodejs npm
```

```bash
make deps
```

## Automatic Build

```bash
make build
```

## Installing to system

```bash
make install
```

## Prepare the requirements for developing

Create `.makerc` file and put this configuration:

```plain
CHIPER_KEY=16CharactersSalt

GITHUB_TOKEN=your_github_token
GITHUB_USER=your_github_username
GITHUB_REPO=your_github_project
```

```bash
make deps
sudo npm install -g commitizen
```

```
git config --global user.name "Your Awesome Name"
git config --global user.email "you@domain.tld"
```

### If you want to sign commit and release

```bash
gpg --keyid-format long --list-keys
git config --global user.signingkey xxxxxxxxxxxxxxxx
```

Read more about [signing commit with GPG](https://help.github.com/articles/signing-commits-with-gpg/)
and [signing tags using GPG](https://help.github.com/articles/signing-tags-using-gpg/).

## References

- <https://kylewbanks.com/blog/cross-compiling-go-applications-for-multiple-operating-systems-and-architectures>
- <https://sbstjn.com/create-golang-cli-application-with-cobra-and-goxc.html>

## License

This project license under [`MIT`](./LICENSE).