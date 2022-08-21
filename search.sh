#!/bin/bash

usage(){
	echo -e "                              Welcome to \033[1;94mS\033[1;91me\033[1;93ma\033[1;94mr\033[1;92mc\033[1;91mh\033[0m ! \n"
	echo "                This script runs by default with firefox browser"
	echo "                       and google as its search engine,"
	echo -e "                          Developed by \033[4mMatan Kichler\033[0m\n"
	echo "for a web search result type :"
	echo -e "         $ search -<opts> or --<long opts> \033[4mweb search query\033[0m"
	echo -e "example: $ search -dpw red panda\n"
	echo "search options :"
	echo "  -h  or  --help	Print Help and exit"
	echo "  -r  or  --regular	Regular ordinary search"
	echo -e "  -d  or  --direct	'I'm feeling Lucky' search option\n"
	echo "firefox options :"
	echo "  -p  or  --private	Opens a new intance in a private window"
	echo "search engine options :"
	echo "  -a  or  --amazon	Search in Amazon"
	echo "  -b  or  --bing	Search in Bing"
	echo "  -k  or  --duckduckgo	Search in DuckDuckGo"
	echo "  -y  or  --yandex	Search in Yandex"
	echo "  -w  or  --wikipedia	Search in Wikipedia"	
}


if [ $# -eq 0 ]; then
	firefox https://www.google.com
else
	regular=0
	direct=0
	private=0
	amazon=0
	bing=0
	duckduckgo=0
	yandex=0
	wikipedia=0
	query=""
	var=""
	
	for arg in $@
	do
		if [[ "${arg::1}" != "-" || "${arg}" == "-" ]]; then
			query+="${arg}+"
		fi
	done
	
	while getopts 'hrdp-:abkyw' opt
	do
		case $opt in
			h) usage; exit;;
			r) regular=1;;
			d) direct=1;;
			p) private=1;;
			a) amazon=1;;
			b) bing=1;;
			k) duckduckgo=1;;
			y) yandex=1;;
			w) wikipedia=1;;
			# double-dashed options
			-) 
				case ${OPTARG} in
					"help"*) usage; exit;;
					"regular"*) regular=1;;
					"direct"*) direct=1;;
					"private"*) private=1;;
					"amazon"*) amazon=1;;
					"bing"*) bing=1;;
					"duckduckgo"*) duckduckgo=1;;
					"yandex"*) yandex=1;;
					"wikipedia"*) wikipedia=1;;
				esac
			;;
			*) usage; exit;;
		esac
	done
	
	if [[ $direct == 1 && $regular == 1 ]]; then
		echo -e "\033[0;31mAn error encountered. Both direct and regular search were chosen"
		echo -e "Please type again or type --help\033[0m"
		exit
	fi
	
	# choosing search engine
	value=$((amazon+bing+duckduckgo+yandex+wikipedia))
	if [ "$value" -gt 1 ]; then
		echo -e "\033[0;31mAn error encountered. More than one search engine was chosen"
		echo -e "Please type again or type --help\033[0m"
		exit
	elif [ $value == 1 ]; then
		if [ $direct == 1 ]; then
			if [ $amazon == 1 ]; then var+="https://www.amazon.com/s?k="
			elif [ $bing == 1 ]; then var+="https://www.bing.com/search?q="
			elif [ $duckduckgo == 1 ]; then var+="https://duckduckgo.com/?q=\\"
			elif [ $yandex == 1 ]; then var+="https://yandex.com/search/?text="
			elif [ $wikipedia == 1 ]; then var+="https://en.wikipedia.org/wiki/Special:Search?search="
			fi
		else
			if [ $amazon == 1 ]; then var+="https://www.amazon.com/s?k="
			elif [ $bing == 1 ]; then var+="https://www.bing.com/search?q="
			elif [ $duckduckgo == 1 ]; then var+="https://duckduckgo.com/?q="
			elif [ $yandex == 1 ]; then var+="https://yandex.com/search/?text="
			elif [ $wikipedia == 1 ]; then var+="https://en.wikipedia.org/w/index.php?title=Special:Search&profile=advanced&fulltext=1&ns0=1&search="
			fi
		fi	
	elif [ $value == 0 ]; then # google search by default
		var+="https://www.google.com/search?"
		if [ $direct == 1 ]; then
			var+="btnI=&sourceid=navclient&gfns=1&q="	
		else
			var+="q="
		fi
	fi
	
	var+="${query}"
	
	if [ $private == 1 ]; then
		firefox --private-window "$var"
	else
		firefox "$var"
	fi
fi
