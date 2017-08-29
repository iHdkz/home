#!/bin/sh

curl -O https://bootstrap.pypa.io/get-pip.py
#export PATH="$HOME/.local/bin:"$PATH
python get-pip.py --user
pip install virtualenv --user
