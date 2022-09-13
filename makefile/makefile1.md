# Makefile Syntax

## A makefile consists of a set of rules
```makefile
targets: prequisites
    command
    command
    command
```
## e.g
```makefile
hello: 
    echo "Hello, World"
    echo "Hello, Everyone"
```
hello is a target
there are two commands
there is not a prequisites

## More example 1(blah.c makefile)
```makefile
blah: 
    gcc blah.c -o blah
```
The first time you run it, ```blah``` will be created. The
second timem you'll see: 
```
make: 'blah' is up to date.
```
This is because the ```blah``` file alrady exists.
but if we modify ```blah.c``` and then run ```make```, nothing gets recompiled.

##### solution
```makefile
blah: blah.c 
    gcc blah.c -o blah
```
It will only run if ```blah``` doesn't exist, or ```blah.c``` is newer than ```blah```
This is the **essence of make**

if ```blah.c``` is modified, running ```make``` should recompile the file

## More example 2(blah.c blah.o makefile)

```makefile
blah: blah.o
	gcc blah.o -o blah

blah.o: blah.c
	gcc -c blah.c -o blah.o

blah.c:
	echo "int main() {return 0;}" > blah.c
```
When you run ```make``` in the terminal, it will build a program called ```blah``` in a series of steps.

## More example 3
```makefile
some_file: other_file
    echo "This will always run, and runs second"
    touch some_file

other_file:
    echo "This will always run, and runs, first"
```
It will always run both targets, because ```some_file``` depends on ```other_file```, which is never created.

# Variables

## Example1 for the Variables

```makefile
files := file1 file2

some_file: $(files)
	echo "Look at this variables: " $(files)
	touch some_file

file1:
	touch file1

file2:
	touch file2

clean:
	rm -f file1 file2 some_file
```
Notice: Single or double quotes have no meaning to Make. They are simply characters that are assigned to the variable.
### In this example, the two commands behave the same:
```makefile
a := one two
b := 'one two' # Not recommended
all:
    printf '$(a)'
    printf $(b)
```

# Targets
- ### one example
```makefile
all: one two three

one:
	touch one

two:
	touch two

three:
	touch three

clean:
	rm -f one two three	
```
Notice: Make an ```all``` target. Since this is the first rule listed. it will run by default if ```make``` is called without specifying a target
- ### Multiple targets
When there are multiple targets for a rule, the commands will be run for each targets. 
```makefile
all: f1.o f2.o

f1.o f2.o:
	@echo $@
# output:
# f1.o
# f2.o
```
it is equivalent to 
```makefile
all: f1.o f2.o

f1.o:
	@echo f1.o

f2.o:
	@echo f2.o
```
