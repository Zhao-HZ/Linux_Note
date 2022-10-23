# How to define variables?
```sh
#!/bin/bash

greeting=Hello
name=Tux
echo $greeting $name
```
output:
```sh
Hello Tux
```
Use `$` to get the value of the variables

Arithmetic Expressions
```sh
+ - * / **(exponentiation) %
```
e.g.
```sh
> expr 16 / 4
4
```
Notes the spaces, these are part of the syntax

Numerical expressions can also be calculated and stored in a variable using the syntax below:
```sh
var=$((expression))
```
e.g.

```sh
var=$((3+9))
echo &var
```
output:
```sh
12
```
For **decimal calculations**, we can use bc command to get the output to a particular number of decimal places. `bc` (Bash Calculator) is a command line calculator that supports calculation up to a certain number of decimal points.
```sh
echo "scale=2;22/7" | bc
```
output:
```sh
3.14
```
# How to read user input?
Use `read` command
```sh
read variable_name
```
To prompt the user with a custom message, use the `-p` flag.
```sh
read -p "Enter your age" variable_name
```
e.g.
```bash
#!/bin/bash

echo "Enter a numner"
read a

echo "Enter a numner"
read b

var=$((a+b))
echo $var
```
output:
```bash
Enter a number
9
Enter a number
9
18
```
# Numeric Comparison logical operators
- -eq ==
- -ge >= 
- -gt > 
- -le <=
- -lt <
- -ne !=

syntax:

```bash
if [ condition ]
    then
        commands
fi

```
e.g.
```sh
read x
read y

if [ $x -gt $y ]
then

echo X is greater than Y

elif [ $x -lt $y ]
then

echo X is less than Y

elif [ $x -eq $y ]
then

echo X is equal to Y

fi
```
The output is obvious

The construction of conditional statements is as follows:
- `if...then...`
- `if...then...else...fi`
- `if...elif...else...fi`
- `if...then...else...if...then..fi...fi...`

To create meaningful comparisons, 
we can use AND `-a` and OR `-o` as well.
e.g.

```
if [ $a -gt 40 -a $b -lt 6 ]
```

# Looping with number
```sh
#!/bin/bash

for i in {1..5}
do
    echo $i
done
```
output:
```sh
1
2
3
4
5
```
# Looping with strings
```sh
#!/bin/bash

for x in fuck you everyday
do
    echo $x
done
```
output:
```sh
fuck
you
everyday
```
# While loops
```sh
#!/bin/bash
i=1
while [[ $i -le 10 ]] ; do
    echo "$i"
    (( i+=1 ))
done
```
outputs:
```sh
1
2
3
...
9
10
```
Read line by line and print the output on the screen.
```sh
#!/bin/bash

LINE=1

while read -r CURRENT_LINE
	do
		echo "$LINE: $CURRENT_LINE"
    ((LINE++))
done < "sample_file.txt"
```
