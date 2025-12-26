#!/bin/bash

planet="$1"

case $planet in
Mercury)
	echo "0"
	exit
	;;
Venus)
	echo "0"
	exit
	;;
Mars)
	echo "2"
	exit
	;;
Jupiter)
	echo "98"
	exit
	;;
Saturn)
	echo "83"
	exit
	;;
Uranus)
	echo "27"
	exit
	;;
Neptune)
	echo "14"
	exit
	;;
Earth)
	echo "1"
	exit
	;;
*)
	echo "Unknown planet"
	;;
esac

