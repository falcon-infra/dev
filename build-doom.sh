#!/usr/bin/env bash
set -euo pipefail

DOOM_BIN=~/.config/emacs/bin/doom
DOOM_CONF_DIR=~/.config/doom

# doom emacs
mkdir $DOOM_CONF_DIR -p
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.config/emacs

$DOOM_BIN env
$DOOM_BIN install
cp ~/*.el $DOOM_CONF_DIR
$DOOM_BIN sync -j 64

# doom doctor
apt install -y markdown shellcheck ispell

# clear
cd && rm ./*.el -rf
