#!/bin/bash

yes_no () {
  select yn in "Sì" "No"
  do
	case $yn in
	  "Sì" )
		return 0
		;;
	  "No" )
		return 1
		;;
	  * )
		echo "Sì o No?"
		;;
	esac
  done
}
