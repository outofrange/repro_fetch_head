#!/bin/bash

DIR=repro_fetch_head$1

echo "### Cloning"
cd ..
git clone https://github.com/outofrange/repro_fetch_head.git "$DIR"
cd "$DIR"

echo
echo "### Checkout branch b1 & fetch, setting FETCH_HEAD"
git checkout b1
git fetch

echo
echo "### Checkout branch b2 & fetch, setting FETCH_HEAD"
git checkout b2
git fetch

echo
echo "### Checkout master again"
git checkout master

echo
echo "### FETCH_HEAD before git pull @ master"
cat .git/FETCH_HEAD

echo
git pull -v

echo
echo "### FETCH_HEAD after git pull @ master"
cat .git/FETCH_HEAD

