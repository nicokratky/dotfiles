#!/usr/bin/env bash

# exit immediately if a command exits with a non-zero exitcode
set -e
# treat unset variables as errors when subtituting
set -u

if ! which brew > /dev/null; then
    # install brew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade

PACKAGE_LIST=macos-package-list.txt
PACKAGE_LIST_GRAPHICAL=macos-package-list-graphicsl.txt

cat $PACKAGE_LIST | xargs brew install
cat $PACKAGE_LIST_GRAPHICAL | xargs brew install --cask

brew cleanup -s --prune=all

xcode-select --install || true

# Don't write .DS_Store files to network drives and external storage media
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Show extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Save screenshots in PNG format
defaults write com.apple.screencapture type -string "png"

# Change location of screenshots
defaults write com.apple.screencapture location ~/Dropbox/screenshots/

# Show battery percent in Menubar
defaults write com.apple.menuextra.battery ShowPercent -bool true

# Enable right click and tap with two fingers
defaults -currentHost write -g com.apple.trackpad.enableSecondaryClick -bool YES

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -integer 50

# Make keyboard repeat faster
defaults write -g InitialKeyRepeat -int 12
defaults write -g KeyRepeat -int 1

# Hide Desktop Icons
defaults write com.apple.finder CreateDesktop -bool false

# Disable Time Machine
sudo tmutil disable

source ./common.sh
cp -va files/.zshrc-platform-macos $HOME/.zshrc-platform
