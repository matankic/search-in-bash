# search-in-bash
basic script written in bash, google search right from your terminal!

just add it as an alias to your .bashrc  
for example, let assume you've cloned this script to /home directiory,  
all you have to do add to the .bashrc file is:

search(){  
  ~/./search.sh $@  
}

you might need also 'activate' this script with:  
$ sudo chmod +x search.sh
