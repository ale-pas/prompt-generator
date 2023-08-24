#!/bin/bash

declare -A arr_parts
arr_parts[Date]='\d'
arr_parts[Hostname_Short]='\h'
arr_parts[Hostname]='\H'
arr_parts[Newline]='\n'
arr_parts[Shell_name]='\s'
arr_parts[Time24_seconds]='\t'
arr_parts[Time24]='\A'
arr_parts[Time12_seconds]='\T'
arr_parts[TimeAMPM]='\@'
arr_parts["@"]='@'
arr_parts[Username]='\u'
arr_parts[Work_dir]='\w'
arr_parts[Work_dir_base]='\W'
arr_parts["$/#"]='\$'
arr_parts[Space]=' '

nocolor_parts=("${arr_parts[Space]}" "${arr_parts[Newline]}") 



parts_choice () {
  local __resultvar=$1 
  select parts in "${!arr_parts[@]}"
  do
	[[ " ${!arr_parts[@]} " =~ " $parts " ]] \
	&& { 
	echo -e "hai scelto $parts, va bene?";
	yes_no && { eval $__resultvar="'${arr_parts[$parts]}'" && break; }; 
	}
  done
}


