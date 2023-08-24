#!/bin/bash

resolve_dir () {
  SOURCE=${BASH_SOURCE[0]}
  while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
	  TARGET=$(readlink "$SOURCE")
	if [[ $TARGET == /* ]]; then
	  SOURCE=$TARGET
	else
	  DIR=$( dirname "$SOURCE" )
	  SOURCE=$DIR/$TARGET # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
	fi
  done
  RDIR=$( dirname "$SOURCE" )
  DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
}

sources=("colors.sh" "p_parts.sh" "utils.sh")

resolve_dir

for s in "${sources[@]}"
do
  [ -f $DIR/sources/$s ] && . $DIR/sources/$s || { echo "Non trovo $DIR/$s"; exit 1; };
done

NEW_PS1=""
echo -e "Seleziona cosa vuoi aggiungere al tuo prompt:\n"
while true
do
  parts_choice part
  if [[ ! ${nocolor_parts[@]} =~ "$part" ]] 
  then
	color_choice col
	NEW_PS1+="\[$col\]$part\[$NC\]"
  else
	NEW_PS1+="$part"
  fi
  echo -e "Questo è il tuo nuovo prompt:\n$NEW_PS1"
  echo "Vuoi aggiungere altro al prompt?"
  yes_no || break;

done

echo "export PS1=\"$NEW_PS1\" " > ~/.prompt
if ! grep -q "[ -f ~/.prompt ] &&  . ~/.prompt" ~/.bash_profile
then
  echo "[ -f ~/.prompt ] &&  . ~/.prompt" >> ~/.bash_profile
fi
echo -e "Prompt aggiornato, per applicare il nuovo prompt da subito puoi lanciare il comando:\nsource ~/.prompt\nAltrimenti vedrai il nuovo prompt al prossimo accesso"

