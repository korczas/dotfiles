#!/bin/bash

# change swaping direction
defaults write -g com.apple.swipescrolldirection -bool FALSE

## dock
### turn off showing recent apps in doc
defaults write com.apple.dock show-recents -bool FALSE
### turn on autohide
defaults write com.apple.dock autohide -bool TRUE
### turn on magnification on hover
defaults write com.apple.dock magnification -bool TRUE
### set size of dock icon
defaults write com.apple.dock tilesize -int 40
### set size of dock icon when magnitude
defaults write com.apple.dock largesize -int 80
### kill Dock to apply changes (it will relaunch automatically)
killall Dock

## date format
defaults write com.apple.menuextra.clock "DateFormat" -string "\"d MMM HH:mm:ss\""

## finder
### show hidden files by default
defaults write com.apple.Finder "AppleShowAllFiles" -bool TRUE
### enable "Quit" option
# defaults write com.apple.finder "QuitMenuItem" -bool FALSE && killall Finder





# defaults write com.apple.systemuiserver menuExtras -array \
# "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
# "/System/Library/CoreServices/Menu Extras/Volume.menu"
