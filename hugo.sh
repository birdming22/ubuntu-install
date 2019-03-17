#!/bin/bash

VERSION=0.54

cd /tmp
wget https://github.com/gohugoio/hugo/releases/download/v$VERSION.0/hugo_$VERSION.0_Linux-64bit.deb

dpkg -i hugo_$VERSION.0_Linux-64bit.deb

# verify that it runs
hugo version

cd -

