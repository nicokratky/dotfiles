#!/bin/bash

mkdir -p $HOME/.gnupg
touch $HOME/.gnupg/gpg-agent.conf
echo enable-ssh-support >> $HOME/.gnupg/gpg-agent.conf
