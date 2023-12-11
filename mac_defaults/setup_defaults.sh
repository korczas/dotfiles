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
defaults write com.apple.menuextra.clock "DateFormat" -string "d MMM 'at' HH:mm:ss"
defaults write com.apple.menuextra.clock "ShowSeconds" -int 1
defaults write com.apple.menuextra.clock "ShowDate" -int 1
defaults write com.apple.menuextra.clock "FlashDateSeparators" -int 0
defaults write com.apple.menuextra.clock "ShowDayOfWeek" -int 0

## always show scrollbar
defaults write -g AppleShowScrollBars -string Always

## control center - might not work
### bt
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -int 1
defaults write com.apple.controlcenter "NSStatusItem Preferred Position Bluetooth" -int 344

### dnd
defaults write com.apple.controlcenter "NSStatusItem Visible FocusModes" -int 1
defaults write com.apple.controlcenter "NSStatusItem Preferred Position FocusModes" -int 376

### sound
defaults write com.apple.controlcenter "NSStatusItem Visible Sound" -int 1
defaults write com.apple.controlcenter "NSStatusItem Preferred Position FocusModes" -int 376


## finder
### show hidden files by default
defaults write com.apple.Finder "AppleShowAllFiles" -bool TRUE
### enable "Quit" option
# defaults write com.apple.finder "QuitMenuItem" -bool FALSE && killall Finder

# ## menu bar
# ### hide spotlight icon
# defaults write com.apple.Spotlight.MenuItemHidden -int 1
# ### show percentage next to battery icon
# defaults write com.apple.controlcenter.BatteryShowPercentage -int 1
# ### show bluetooth icon
# defaults write com.apple.controlcenter.Bluetooth -int 18
# ### show dnd icon
# defaults write com.apple.controlcenter.DoNotDisturb -int 2

# ## screen saver
# defaults write com.apple.screensaver.idleTime -int 0
# defaults write com.apple.screensaver.lastDelayTime -int 1200

## turn off accented characters when holding down a key - requires logout
defaults write -g ApplePressAndHoldEnabled -bool false

defaults write -g AppleFontSmoothing -int 0

# "com.apple.keyboard.modifiermapping.1452-832-0" =         (
#                 {
#         HIDKeyboardModifierMappingDst = 30064771113;
#         HIDKeyboardModifierMappingSrc = 30064771129;
#     }
# );