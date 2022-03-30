#!/bin/sh

# So, this time you’re looking to mount an AFP share, sync files to it from a local folder
# error check this and unmount the share? Here you go:

# rsync mount

# Sync files from location A (local) to location B (File server)

Server="file-server.adress"			# <- This loads in a varible called "Server" of the server address

Username="file-user"						# <- This loads in a varible called "Username" of the server share username

Password="12345"							# <- This loads in a varible called "Password" of the server share password

Share="test_backup"							# <- This loads in a varible called "Share" of the server share name

Source="/Users/XXX"				# <- This loads in a varible called "Source" of the place to sync files from

Destination="/Volumes/test_backup/"		# <- This loads in a varible called "Destination" of the place to sync files to

#########################################################################################################################################################

echo "Make Share folder and mount volume"	# <- This echos the information between the speech marks into the terminal window

mkdir /Volumes/test_backup					# <- This makes a directory (folder) in Volumes for the share to mount on.

sleep 2										# <- This pauses the script for 2 seconds

mount_afp "afp://$Username:$Password@$Server/$Share" /Volumes/test_backup
											# ^^ This mounts the "Share" on the "Server" using the "Username" and "Password" onto the folder in Volumes

echo "Volume mount complete"				# <- This echos the information between the speech marks into the terminal window

echo "Starting syncing"						# <- This echos the information between the speech marks into the terminal window

rysnc --archive --verbose --progress --delete --no-g -E $Source $Destination				# <- This syncs the files from "Source" to "Destination" with deleting

if [$? = 0]									# <- This asks if the exit code of the sync is '0' (and so fine)

	then									# <- This is the action taken if the exit code is '0'

		echo "Sync completed without error"	# <- This echos the information between the speech marks into the terminal window

	else									# <- This is the action taken if the exit code is not '0'

		echo "Sync completed, but with an error" # <- This echos the information between the speech marks into the terminal window

fi											# <- This closes the 'if' question

umount /Volumes/test_backup