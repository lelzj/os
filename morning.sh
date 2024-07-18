#!/bin/sh


# Samba share mounts
function mount_drive {
	{
	  if [[ ! -f $2 ]]; then
		mkdir -p $2
	  fi
	  mount -t smbfs $1 $2
	} #&> /dev/null
}

stty -echo
printf "VM Share Password: "
read -rs PASSWORD
stty echo
printf "\n"

mount_drive //jadissa-griffin:"$PASSWORD"@dev-jadissa-griffin.lan.vsmedia.net/web ~/vm-web	# VM web
mount_drive //jadissa-griffin:"$PASSWORD"@dev-jadissa-griffin.lan.vsmedia.net/code ~/vm-code	# VM code
mount_drive //jadissa.griffin:"$PASSWORD"@dev-billing/web ~/billing 				# dev-billing
#mount_drive //jadissa-griffin:"$PASSWORD"@dev-billing7/web ~/billing7				# dev-billing7

#mount_drive //guest:asdf@webdev.lan.vsmedia.net ~/webdev					# webdev



# Software Update Tool - automatically find and install macOS software from Apple
#softwareupdate --all --install --force

# Check your system for potential problems. Will exit with a non-zero status if any potential problems are found
#brew doctor --verbose

# Fetch the newest version of Homebrew and all formulae from GitHub using git(1) and perform any necessary migrations
#brew update --verbose

# Automatically upgrade your installed formulae. If the Caskroom exists locally Casks will be upgraded as well. Must be passed with start
#brew upgrade --verbose
