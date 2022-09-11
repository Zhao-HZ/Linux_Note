CC = gcc 

obj_files = file1.o main.o 

mydemo1: $(obj_files)

$(obj_files): %.o: %.c 
main.o: main.c
# This is equivalent to
# file1.o: file1.c
# main.o: main.c

%.c:
	touch $@ 

clean:
	rm -f *.o mydemo1 