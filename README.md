# search-in-bash
basic script written in bash, google search right from your terminal!

for Linux machines only!

just add it as an alias to your ```.bashrc```  file,  
for example, lets assume you've cloned this script to your ```/home``` directiory,  

before all, you might first need to 'activate' this script, followed with: 
```bash
$ sudo chmod +x search.sh
```
now, type the following command to edit ```.bashrc```
```
$ cd ~
$ vim .bashrc
```
scroll down and add somewhere:
```bash
search(){  
    ~/./search.sh $@  
}
```
