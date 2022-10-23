# How to execute commands with back ticks

var = `commands`

e.g.
```sh
var=`ls`

echo $var
```
It can show the current list of files and folders

# How to get arguments for script from the command line
Use `$@`

```sh
for x in $@
do
    echo " Entered arg is $x"
done
```
output:
```sh
> ./test.sh pink grey yellow
Entered arg is pink 
Entered arg is grey
Entered arg is yellow
```

