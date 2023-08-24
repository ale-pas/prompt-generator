#!/bin/bash

declare -A arr_col
arr_col[Black]='\033[0;30m'
arr_col[Light_Gray]='\033[0;37m'
arr_col[Dark_Gray]='\033[1;30m'
arr_col[Red]='\033[0;31m'
arr_col[Light_Red]='\033[1;31m'
arr_col[Green]='\033[0;32m'
arr_col[Brown_Orange]='\033[0;33m'
arr_col[Yellow]='\033[1;33m'
arr_col[Blue]='\033[0;34m'
arr_col[Light_Blue]='\033[1;34m'
arr_col[Purple]='\033[0;35m'
arr_col[Light_Purple]='\033[1;35m'
arr_col[Cyan]='\033[0;36m'
arr_col[Light_Cyan]='\033[1;36m'
arr_col[Light_Gray]='\033[0;37m'
arr_col[White]='\033[1;37m'
arr_col[NoColor]='\033[0m'
NC='\033[0m'


color_choice () {
  local __resultvar=$1 
  echo "Che colore vuoi?"
  select col in "${!arr_col[@]}"
  do
	[[ " ${!arr_col[@]} " =~ " $col " ]] \
	&& { 
	echo -e "hai scelto ${arr_col[$col]}$col$NC, va bene?";
	yes_no && { eval $__resultvar="'${arr_col[$col]}'" && break; }; 
	}
  done
}


