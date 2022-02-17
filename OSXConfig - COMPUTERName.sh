#!/bin/sh

# OSX Setup for Yosemite, forked from MatthewMueller/osx-for-hackers.sh
#
# Source: https://gist.github.com/emrehan/53d8a9668ae616b03b55/edit

# Ask for the administrator password upfront
sudo -v

###############################################################################
# General UI/UX
###############################################################################

echo ""
echo "Welcome to the dark side"
sudo defaults write /Library/Preferences/.GlobalPreferences.plist _HIEnableThemeSwitchHotKey -bool true

echo ""
echo "Would you like to set your computer name?  (y/n)"
read -r response
case $response in
  [yY])
      echo "What would you like it to be? ( A/Z..0/9 & - )"
      read COMPUTER_NAME
      sudo scutil --set ComputerName $COMPUTER_NAME
      sudo scutil --set HostName $COMPUTER_NAME.local
      sudo scutil --set LocalHostName $COMPUTER_NAME.local
      sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $COMPUTER_NAME
      break;;
  *) break;;
esac

###############################################################################
# Terminate
###############################################################################

echo ""
echo "Some of these changes require a restart to take effect."

echo ""
echo "Would you restart now?  (y/n)"
read -r response
case $response in
  [yY])
      sudo shutdown -r now
      break;;
  *) break;;
esac
