# search-in-bash
basic script written in bash, google search right from your terminal!

for Linux machines only!

just add it as an alias to your ```.bashrc```  file  
for example, let assume you've cloned this script to your ```/home``` directiory,  
all you have to do add to the ```.bashrc``` file is:

```bash
search(){  
    ~/./search.sh $@  
}
```

you might also need to 'activate' this script before, followed with: 
```bash
$ sudo chmod +x search.sh
```
