ubuntu_14.04_postinstall
========================

Post install script for ubuntu 14.04

There is 3 directories :
- datas			: list files that whould be read by a script
- packages		: file for package install
- ressources	: contain bin usefull for installation
- scripts		: where the scripts non directly link to a package are placed

For the package, you need to create a file :
- name as the package
- which contain, if package from depot are need, a variable named "packages" with package(s) needed
- which contain, if package need to be configure, a function named "config" that contain the command to config the package


