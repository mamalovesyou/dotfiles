#!/bin/bash
set -e

VERSION="1.12.6"

[ -z "$GOROOT" ] && GOROOT="$HOME/.go"
[ -z "$GOPATH" ] && GOPATH="$HOME/go"

OS="$(uname -s)"
ARCH="$(uname -m)"
case $OS in
    "Linux")
        case $ARCH in
        "x86_64")
            ARCH=amd64
            ;;
        "armv6")
            ARCH=armv6l
            ;;
        "armv8")
            ARCH=arm64
            ;;
        .*386.*)
            ARCH=386
            ;;
        esac
        PLATFORM="linux-$ARCH"
    ;;
    "Darwin")
        PLATFORM="darwin-amd64"
    ;;
esac

if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
    shell_profile="zshrc"
elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
    shell_profile="bashrc"
fi

PACKAGE_NAME="go$VERSION.$PLATFORM.tar.gz"

if [ -d "$GOROOT" ]; then
    echo "The Go install directory ($GOROOT) already exists. Exiting."
    exit 1
fi

echo "Downloading $PACKAGE_NAME ..."
if hash wget 2>/dev/null; then
    wget https://storage.googleapis.com/golang/$PACKAGE_NAME -O /tmp/go.tar.gz
else
    curl -o /tmp/go.tar.gz https://storage.googleapis.com/golang/$PACKAGE_NAME
fi

if [ $? -ne 0 ]; then
    echo "Download failed! Exiting."
    exit 1
fi

echo "Extracting File..."
mkdir -p "$GOROOT"
tar -C "$GOROOT" --strip-components=1 -xzf /tmp/go.tar.gz
touch "$HOME/.${shell_profile}"
{
    echo '# GoLang'
    echo "export GOROOT=${GOROOT}"
    echo 'export PATH=$GOROOT/bin:$PATH'
    echo "export GOPATH=$GOPATH"
    echo 'export PATH=$GOPATH/bin:$PATH'
} >> "$HOME/.${shell_profile}"

mkdir -p $GOPATH/{src,pkg,bin}
echo -e "\nGo $VERSION was installed into $GOROOT.\nMake sure to relogin into your shell or run:"
echo -e "\n\tsource $HOME/.${shell_profile}\n\nto update your environment variables."
rm -f /tmp/go.tar.gz
