# Automatic Variables and Wildcards

## Wildcards

#### Both * and % are called wildcards in Make, but they mean entirely different things.
### -* 
##### it can searches your filesystem for matching filenames.
Notice: it is better to wrap it(*) in the `wildcard` function.
Danger: * may not be directly used in a variable definitions
Danger: When * matches no files, it is left as it is (unless run in the `wildcard` function)
```makefile 
#print out file information about every .c file
print: $(wildcard *.c)
	ls -la $?
```
### -% 
##### the variety of situations it can be used in 
- When used in "matching" mode, it matches one or more characters in a string. This match is called the stem
- When used in "replacing" mode, it takes the stem that was matched and replaces that in a string.
- % is most used in rule definition and in some specific function.

## Automatic Variables
```makefile
hey: one two
    # outputs "hey", since this is the target name
    echo $@
    # outputs all prerequisites newer than the target
    echo $?
    # outputs all prerequisites
    echo $^
```

# Fancy Rules

## Implicit Rules
- ### Compiling a C program: `n.o` is made automatically from `n.c` with a command of the form `$(CC) -c $(CPPFLAGS) $(CFLAGS)`
- ### Compiling a C++ program: `n.o` is made automatically from `n.cc` or `n.cpp` with a command of the form `$(CC) -c $(CPPFLAGS) $(CXXFLAGS)`
- ### Linking a single object file: `n` is made automatically from `n.o` by running the command `$(CC) $(LDFLAGS) n.o $(LOADLIBES) $(LDLIBS)`

The important variables used by implicit rules are:

`CC`: Program for compiling C programs; default cc
`CXX`: Program for compiling C++ programs; default g++
`CFLAGS`: Extra flags to give to the C compiler
`CXXFLAGS`: Extra flags to give to the C++ compiler
`CPPFLAGS`: Extra flags to give to the C preprocessor
`LDFLAGS`: Extra flags to give to compilers when they are supposed to invoke the linker
### example
```makefile
CC = gcc
CFLAGS = -g # turn on debug info

blah: blah.o

clean:
	rm -f blah.o blah
```
output
```
gcc -g -c -o blah.o blah.c
gcc   blah.o   -o blah
```

## Static Pattern Rules

syntax:
```makefile
targets...: target-pattern: prereq-patterns ...
    commands
```
##### A manual way for compiling `.c` files into `.o` files
```makefile
objects = foo.o bar.o all.o
all: $(objects)

foo.o: foo.c
bar.o: bar.c
all.o: all.c

all.c:
	echo "int main(){return 0;}" > all.c

%.c:
	touch $@

clean:
	rm -f *.c *.o all
```
More efficient way
```makefile
objects = foo.o bar.o all.o
all: $(objects)

$(objects): %.o %.c

all.c:
	echo "int main(){return 0;}" > all.c

%.c:
	touch $@

clean:
	rm -f *.c *.o all
```
### The use of filter
Instead of using \$(objects), you can use \$(filter \%.o, \$(objects)) to match the correct files

## Pattern Rules

### example
```makefile
%.o: %.c
    $(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@ 
```
# Commands and Execution

## Double dollar sign
```makefile
make_var = I am a make variable
all:
	# Same as running "sh_var='I am a shell variable'; echo $sh_var" in the shell
	sh_var='I am a shell variable'; echo $$sh_var

	# Same as running "echo I am a amke variable" in the shell
	echo $(make_var)
```
# Functions
- subst not
```makefile
bar := ${subst not, totally, "I am not superman"}
```
output:
```
I am totally superman
```
- patsubst

- foreach
```makefile
foo := who are you
bar := $(foreach wrd,$(foo),$(wrd)!)
all:
    @echo $(bar)
```
output:
```
who! are! you!
```
- `if` checks if the first argument is nonempty.
if so runs the second argument, otherwise runs the third
```makefile
foo := $(if this-is-not-empty,then!,else!)
empty :=
bar := $(if $(empty),then!,else!)

all:
	@echo $(foo)
	@echo $(bar)
```
output:
```
then!
else!
```
- call
syntax: `$(call variable,param,param)`
and \$(0) is the variable, \$(1), \$(2) are the params.
```makefile
sweet_new_fn = Variable Name: $(0) First: $(1) Second: $(2) Empty Variable: $(3)

all:
	# Outputs "Variable Name: sweet_new_fn First: go Second: tigers Empty Variable:"
	@echo $(call sweet_new_fn, go, tigers)
```
- shell 
- patsubst
```makefile
foo := a.o b.o l.a c.o
one := $(patsubst %.o,%.c,$(foo))
# This is a shorthand for the above
two := $(foo:%.o=%.c)
# This is the suffix-only shorthand, and is also equivalent to the above.
three := $(foo:.o=.c)

all:
	echo $(one)
	echo $(two)
	echo $(three) 
```
#### it replaces newlines with spaces! 

- filter
- filter-out
```makefile
OBJECT=main.c func1.c func2.c func3.c
print:
	#echo $(filter-out main.c func2.c,$(OBJECT))
#	func1.c func3.c	
	@echo $(filter main.c func2.c,$(OBJECT))
#	main.c func2.c
```
