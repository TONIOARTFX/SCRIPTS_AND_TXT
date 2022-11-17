#/bin/bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive sudo until `clenaup.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

oldAvailable=$(df / | tail -1 | awk '{print $4}')

echo 'Empty User Cache...'
sudo rm -rfv ~/Library/Caches/* &>/dev/null

echo 'Empty Mac Cache...'
sudo rm -rfv /Library/Caches/* &>/dev/null

echo 'Clear C-One Files...'
sudo rm ~/Library/Preferences/com.phaseone.captureone12.plist &>/dev/null
sudo rm ~/Library/Preferences/com.phaseone.captureone13.plist &>/dev/null
sudo rm ~/Library/Preferences/com.phaseone.QLICProcessor.plist &>/dev/null
sudo rm ~/Library/Preferences/com.captureone.captureone13.plist &>/dev/null
sudo rm ~/Library/Preferences/com.captureone.COOpenWithPluginPluginHost.plist &>/dev/null
sudo rm -fRv /Users/Shared/Capture\ One/ &>/dev/null
sudo rm -rfv ~/Library/Application\ Support/com.captureone.captureone13/* &>/dev/null
sudo rm -rfv ~/Library/Application\ Support/com.phaseone.captureone13/* &>/dev/null
sudo rm -rfv ~/Library/Application\ Support/com.captureone.captureone14/* &>/dev/null
sudo rm -rfv ~/Library/Application\ Support/com.phaseone.captureone14/* &>/dev/null
sudo rm -rfv ~/Library/Application\ Support/com.captureone.captureone15/* &>/dev/null
sudo rm -rfv ~/Library/Application\ Support/com.phaseone.captureone15/* &>/dev/null
sudo rm -rfv ~/Library/Application\ Support/Capture\ One/* &>/dev/null
find ~/Library/Logs -iname *captureone* -delete
find ~/Library/Logs -iname *phaseone* -delete
find ~/Library/Preferences -iname *phaseone* -delete
find ~/Library/Preferences -iname *captureone* -delete

sudo purge

echo -e "\033[32m Success"
echo -e "\033[37m "

newAvailable=$(df / | tail -1 | awk '{print $4}')
count=$((oldAvailable - newAvailable))
#count=$(( $count * 512))
bytesToHuman $count

echo -e "\033[31m Quittez cette Appli Relancez COne & mettez les Mises à jour à Zéro !! ..."
echo -e "\033[37m "