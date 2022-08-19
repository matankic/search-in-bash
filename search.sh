#!/bin/bash

usage(){
	echo -e "\n\n                              Welcome to \033[1;94mS\033[1;91me\033[1;93ma\033[1;94mr\033[1;92mc\033[1;91mh\033[0m ! \n"
	echo "                This script runs by default with firefox browser"
	echo "                        and google as a search engine,"
	echo -e "                          Developed by \033[4mMatan Kichler\033[0m\n"
	echo "for a web search result type :"
	echo -e "	$ search -<opts> or --<long opts> \033[4mweb search query\033[0m \n"
	echo "search options (getopt) :"
	echo "  -h  or  --help	Print Help and exit"
	echo "  -r  or  --regular	Regular google search"
	echo -e "  -d  or  --direct	Google's \"I'm feeling Lucky\" search option\n"
	echo "firefox options (getopts) :"
	echo "  -p  or  --private	Opens a new intance in a private window"
}


if [ $# -eq 0 ]; then
	firefox https://www.google.com
else
	regular=0
	direct=0
	private=0
	query=""
	var="https://www.google.com/search?"
	
	for arg in $@
	do
		if [[ "${arg::1}" != "-h" && "${arg::2}" != "-r" &&
		 "${arg::2}" != "-d" && "${arg::2}" != "-p"  && 
		 "${arg}" != "--help" && "${arg}" != "--regular" && 
		 "${arg}" != "--direct" && "${arg}" != "--private" ]]; then
			query+="${arg}+"
		fi
	done
	
	while getopts 'hrdp-:' opt
	do
		case $opt in
			h) usage; exit;;
			r) regular=1;;
			d) direct=1;;
			p) private=1;;
			# double-dashed options
			-) 
				case ${OPTARG} in
					"help"*) usage; exit;;
					"regular"*) regular=1;;
					"direct"*) direct=1;;
					"private"*) private=1;;
				esac
			;;
			*) usage; exit;;
		esac
	done
	
	if [[ $direct == 1 && $regular == 1 ]]; then
		echo -e "\033[0;31mAn error encountered. Both direct and regular search were chosen"
		echo -e "Please type again or type --help\033[0m"
		exit
	elif [ $direct == 1 ]; then
		var+="btnI=&sourceid=navclient&gfns=1&q="	
	else
		var+="q="
	fi
	
	var+="${query}"
	
	if [ $private == 1 ]; then
		firefox --private-window "$var"
	else
		firefox "$var"
	fi
fi
