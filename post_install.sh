#!/bin/bash

main_menu()
{
	PS3="Select what you want to do: "
	options=(
		"Full install"
		"Update installed packages"
		"Install favorites packages"
		"Remove useless packages"
		"Configure ubuntu"
	)
	while [[ -z $stop ]]; do
		select opt in "${options[@]}" "Quit"; do
			case $opt in
				${options[0]})
					update
					to_install_all
					to_remove_all
					upgrade
					config
					;;
				${options[1]})
					update
					upgrade
					;;
				${options[2]})
					update
					to_install
					;;
				${options[3]})
					to_remove
					;;
				${options[4]})
					config
					;;
				"Quit")
					echo "Quit"
					stop="yes"
					;;
				*)
					echo "You fail sir"
					;;
			esac
			break
		done
		echo ""
	done
	unset stop
}


lend_passwd()
{
	unset passwd
	echo "I need you to lend me your password. Rest assured that your password won't be kept after installation."
	while [[ -z $passwd ]]; do
		echo -n "Passwd: "
		read -s passwd
		./res/chkpasswd > /dev/null 2>&1
		if [[ $? -ne 0 ]]; then
			unset passwd
		fi
	done
	echo $passwd
}

main()
{
	echo "+--------------------------------------+"
	echo "|                                      |"
	echo "|   Ubuntu 14.04 post-install script   |"
	echo "|                                      |"
	echo "+--------------------------------------+"
	echo ""

	unset stop
	first="yes"
	passwd=$(lend_passwd)
	main_menu
	unset passwd
}

. scripts/config
. scripts/install
. scripts/remove
. scripts/update_upgrade
main $@
