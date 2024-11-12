#!/bin/sh

# https://git.herrbischoff.com/awesome-macos-command-line/about/
# https://macos-defaults.com/#%F0%9F%92%BB-list-of-commands
# https://www.real-world-systems.com/docs/defaults.1.html
# https://github.com/kevinSuttle/macOS-Defaults/blob/master/.macos

# Ask for the administrator password upfront
sudo -v

# Disable `gamed` process
defaults write com.apple.gamed Disabled -bool true

# Disable the sound effects on boot
# sudo nvram SystemAudioVolume=%01
# sudo nvram SystemAudioVolume=%80
# sudo nvram SystemAudioVolume=%00
sudo nvram SystemAudioVolume=" "
sudo nvram SystemStartupMute=%01

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate "ScheduleFrequency" -int 1

# Set keyboard repeat rate
defaults write NSGlobalDomain "KeyRepeat" -int 2
defaults write NSGlobalDomain "InitialKeyRepeat" -int 25
# defaults write NSGlobalDomain "KeyRepeat" -int 1
# defaults write NSGlobalDomain "InitialKeyRepeat" -int 10

# Set the timezone; see `sudo systemsetup -listtimezones` for other values
sudo systemsetup -settimezone "America/Ciudad_Juarez" > /dev/null

# Disable AirPlay and AirDrop
sudo ifconfig awdl0 down

# Disable Notification Center and remove the menu bar icon
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

# Disable bluetooth
sudo defaults write /Library/Preferences/com.apple.Bluetooth "ControllerPowerState" -int 0 && sudo killall -HUP bluetoothd

# Enable integrity protection
csrutil enable
csrutil status

# Enable firewall
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate

# Enable file valut/encrypt disc contents
sudo fdesetup enable

# Enable stealth mode/don't respond to pings
defaults read /Library/Preferences/com.apple.alf stealthenabled
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on

# Disable Login for Hidden User ">Console"
defaults write com.apple.loginwindow "DisableConsoleAccess" -bool true

# Desktop icon size
defaults write com.apple.finder "gridSpacing" -int 34
defaults write com.apple.finder "iconSize" -int 36
defaults write com.apple.finder "labelOnBottom" -int 0
defaults write com.apple.finder "textSize" -int 12

# Show hidden files
defaults write com.apple.finder "AppleShowAllFiles" -bool true && killall Finder

# Show all filename extensions
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool false && killall Finder

# Put the Dock on the left of the screen
defaults write com.apple.dock "orientation" -string "left" && killall Dock

# Finder List view
defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv" && killall Finder

# Show hard disks on desktop
defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool true && killall Finder

# Show external disks on desktop
defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool true && killall Finder

# Show connected servers on desktop
defaults write com.apple.finder "ShowMountedServersOnDesktop" -bool true && killall Finder

# Set TextEdit format to text
defaults write com.apple.TextEdit "RichText" -bool "false" && killall TextEdit

# Disable autocorrect
defaults write NSGlobalDomain "NSAutomaticSpellingCorrectionEnabled" -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain "NSAutomaticDashSubstitutionEnabled" -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain "NSAutomaticPeriodSubstitutionEnabled" -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain "NSAutomaticQuoteSubstitutionEnabled" -bool false

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain "NSAutomaticCapitalizationEnabled" -bool false

# Disable guest account
sudo defaults write GuestEnabled /Library/Preferences/com.apple.loginwindow -int 0

# Disable remote access
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate -configure -access -off

# Login text
sudo defaults write /Library/Preferences/com.apple.loginwindow "LoginwindowText" "Gondor is watching"

# Show full path in finder title
defaults write com.apple.finder "ShowPathbar" -bool true && killall Finder
defaults write com.apple.finder "_FXShowPosixPathInTitle" -bool true && killall Finder

# Show finder status bar
defaults write com.apple.finder "ShowStatusBar" -bool true && killall Finder

# Screensaver immediate lock
defaults write com.apple.screensaver "askForPassword" -int 1
defaults write com.apple.screensaver "askForPasswordDelay" -int 0

# turn off idiotic doc bounce
defaults write com.apple.doc no-bouncing -int 0

# Generate system performance report
sudo sysdiagnose -f ~/Desktop/