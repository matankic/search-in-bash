# search-in-bash
basic script written in bash, web search right from the terminal!

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
type ```i``` or ```insert``` keys, scroll down and add somewhere:
```bash
search(){  
    ~/./search.sh $@  
}
```
for saving changes type ```Esc``` key, then ```:wq```  
type ```source .bashrc``` for making changes appeal

now, try writting something like
```
$ search -dpw red pandas
```
or if you want help, type ```search --help```
