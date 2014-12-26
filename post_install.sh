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
					to_install
					to_remove
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
	main_menu
}

. scripts/config
. scripts/install_remove
. scripts/update_upgrade
main $@
