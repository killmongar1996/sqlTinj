#!/bin/bash

usage () {
echo -n $'\E[31m'
echo $''
echo $'      _,.'
echo $'    ,` -.)'
echo $'   \'( _/\'-\\\\-.'
echo $'  /,|`--._,-^|          ,'
echo $'  \\_| |`-._/||          ,\'|'
echo $'    |  `-, / |         /  /                                                             '
echo $'    |     || |        /  /'
echo $'     `r-._||/   __   /  /'
echo $' __,-<_     )`-/  `./  /'
echo $'\'  \\   `---\'   \\   /  /
▒█░▄▀ ▀█▀ ▒█░░░ ▒█░░░ ▒█▀▄▀█ ▒█▀▀▀█ ▒█▄░▒█ ▒█▀▀█ ░█▀▀█ ▒█▀▀█ ▄█░ ▄▀▀▄ ▄▀▀▄ ▄▀▀▄ 
▒█▀▄░ ▒█░ ▒█░░░ ▒█░░░ ▒█▒█▒█ ▒█░░▒█ ▒█▒█▒█ ▒█░▄▄ ▒█▄▄█ ▒█▄▄▀ ░█░ ▀▄▄█ ▀▄▄█ █▄▄░ 
▒█░▒█ ▄█▄ ▒█▄▄█ ▒█▄▄█ ▒█░░▒█ ▒█▄▄▄█ ▒█░░▀█ ▒█▄▄█ ▒█░▒█ ▒█░▒█ ▄█▄ ░▄▄▀ ░▄▄▀ ▀▄▄▀'
echo $'    |           |./  /'
echo $'    /           //  /'
echo $'\\_/\' \\         |/  /'
echo $' |    |   _,^-\'/  /'
echo $' |    , ``  (\\/  /_'
echo $'  \\,.->._    \\X-=/^'
echo $'  (  /   `-._//^`'
echo $'   `Y-.____(__}'
echo $'    |     {__)'
echo $'          ()`'
  echo -e "\e[32m+--------------------------------------+"
  echo -e "\e[32m|   Code By: Santosh Kumar Sha         |"
  echo -e "\e[32m|   github: @Killmongar1996            |"
  echo -e "\e[32m+--------------------------------------+"
  echo -e "\e[31mBash script wrapper to find and verify time base sql injection"
  echo
  echo -e "\e[32m  	Syntax $BASH_SOURCE -l <urllist> -z <zerosecdelay> -f <fivesecdelay> -t <tensecdelay> -a <useragent>"   
  echo
  echo -e "\e[31moptions:"
  echo -e "\e[33m  	l List of urls file"
  echo -e "\e[33m  	z Time based sql injection payload with zero sec delay."
  echo -e "\e[33m  	f Time based sql injection payload with five sec delay."
  echo -e "\e[33m  	t Time based sql injection payload with ten sec delay."
  echo -e "\e[33m  	a Customer User Agent ."
  echo -e "\e[33m  	h For HELP"
  echo ""
  echo -e "\e[33m       Note: This only for educational suppose and for Pentester and bugbounty hunting"
}

while getopts l:z:f:t:a:h flag
do
    case "${flag}" in
        l) urllist=${OPTARG};;
        z) zerosecdelay=${OPTARG};;
        f) fivesecdelay=${OPTARG};;
        t) tensecdelay=${OPTARG};;
        a) useragent=${OPTARG};;
        h) echo ""; usage; exit;;
    esac
done


while IFS= read -r line
do
  # take action on $line #
  name1=$(curl -o /dev/null -s -w 'Total: %{time_total}s\n' "$line${zerosecdelay}" -H "User-Agent: ${useragent}" | sed "s/Total: //" | sed "s/s//" )
  name2=$(curl -o /dev/null -s -w 'Total: %{time_total}s\n' "$line${fivesecdelay}" -H "User-Agent: ${useragent}" | sed "s/Total: //" | sed "s/s//" )
  name3=$(curl -o /dev/null -s -w 'Total: %{time_total}s\n' "$line${tensecdelay}" -H "User-Agent: ${useragent}" | sed "s/Total: //" | sed "s/s//" )

  payload1=$(echo $name1 |sed "s/[.].*$//")
  payload2=$(echo $name2 |sed "s/[.].*$//")
  payload3=$(echo $name3 |sed "s/[.].*$//")

  if [ $payload2 -gt $payload1 ]
  then
       if [ $payload3 -gt $payload2 ]
       then
           echo "$(tput setaf 1) ${line}${tensecdelay}  $(tput setaf 4) is  $(tput setaf 3) vulnerable to time base sql injection using payload"
       fi 
  fi
done <<< $(cat $urllist)

if ((OPTIND == 1))
then
  echo "No options specified"
  usage
  exit
fi