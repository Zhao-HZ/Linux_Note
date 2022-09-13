# Variables
## Flavors and Modification
- Recursive(`=`) only looks for the variables <u>when the command is used, not when it is defined</u>
- Simply expanded(`:=`) like normal imperative programming --<u>only those defined so far get expanded</u>
## Example1
```makefile
one = one ${later_variable}

two := two ${later_variable}

later_variable = later

all:
	@echo $(one)
	@echo $(two)
```
### Output
```
one later
two
```
## Example2
``` makefile
one = hello
one := ${one} there # Do not use '='

all:
    @echo $(one) 
```
### Output
```
hello there
```
`?=` only sets variables if they have not yet been set

```makefile
one = hello
one ?= will not be set
two ?= will be set
all:
    echo $(one)
    echo $(two)
```
### Output
```
hello
will be set
```
```makefile
with_spaces = hello
after = $(with_spaces)there

nullstring =
space = $(nullstring) 

all:
	@echo "$(after)"
	@echo start"$(space)"end
```
### Output
```
hellothere
start end
```
Use `+=` to append
```makefile
foo := start
foo += more

all:
	@echo $(foo) # start more
```
## Command Line Arguments and Override
```makefile
option_one = hi
override option_one = did_override
option_two = not_override

all:
	@echo $(option_one)
	@echo $(option_two)
```
### Output
```
did_override
not_override
```
## List of Commands and Define
`define/endif` simply creates a variable that is assigned to a list of commands
```makefile
one = export blah="I was set!"; echo $$blah

define two
export blah="I was set!"
echo $$blah
endef

all: 
	@echo "This prints 'I was set'"
	@$(one)
	@echo "This does not print 'I was set' because each command runs in a separate shell"
	@$(two)
# Outputs
# This prints 'I was set'
# I was set!
# This does not print 'I was set' because each command runs in a separate shell
```