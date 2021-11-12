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

## menu bar
### hide spotlight icon
defaults write com.apple.Spotlight.MenuItemHidden -int 1
### show percentage next to battery icon
defaults write com.apple.controlcenter.BatteryShowPercentage -int 1
### show bluetooth icon
defaults write com.apple.controlcenter.Bluetooth -int 18
### show dnd icon
defaults write com.apple.controlcenter.DoNotDisturb -int 2

## screen saver
defaults write com.apple.screensaver.idleTime -int 0
defaults write com.apple.screensaver.lastDelayTime -int 1200

## turn off accented characters when holding down a key - requires logout
defaults write -g ApplePressAndHoldEnabled -bool false

# "com.apple.keyboard.modifiermapping.1452-832-0" =         (
#                 {
#         HIDKeyboardModifierMappingDst = 30064771113;
#         HIDKeyboardModifierMappingSrc = 30064771129;
#     }
# );