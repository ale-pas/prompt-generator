#!/bin/bash

declare -A arr_col
arr_col[Black]='\e[0;30m'
arr_col[Light_Gray]='\e[0;37m'
arr_col[Dark_Gray]='\e[1;30m'
arr_col[Red]='\e[0;31m'
arr_col[Light_Red]='\e[1;31m'
arr_col[Green]='\e[0;32m'
arr_col[Brown_Orange]='\e[0;33m'
arr_col[Yellow]='\e[1;33m'
arr_col[Blue]='\e[0;34m'
arr_col[Light_Blue]='\e[1;34m'
arr_col[Purple]='\e[0;35m'
arr_col[Light_Purple]='\e[1;35m'
arr_col[Cyan]='\e[0;36m'
arr_col[Light_Cyan]='\e[1;36m'
arr_col[Light_Gray]='\e[0;37m'
arr_col[White]='\e[1;37m'
arr_col[NoColor]='\e[0m'
NC='\e[0m'


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


