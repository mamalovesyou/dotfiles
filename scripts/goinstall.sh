#!/bin/bash


GO_VERSION="1.11.4"

if $(uname) == "darwin"; then
    GO_FILE="go${GO_VERSION}.darwin-amd64.tar.gz"
else
    GO_FILE="go${GO_VERSION}.linux-amd64.tar.gz"
fi

# Download go
curl -o /tmp/${GO_FILE} https://storage.googleapis.com/golang/${GO_FILE}

# Untar go archive
tar -xvf /tmp/${GO_FILE} -C /tmp

# Move go
sudo mv /tmp/go $HOME

# update .profile
touch ~/.profile
{
    export GOROOT=$HOME/go
    export GOPATH=$HOME/work
    export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
} >> ~/.profile


