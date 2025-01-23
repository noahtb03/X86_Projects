
gcc_opt = -ansi -pedantic -g -Wimplicit-function-declaration -Wreturn-type -c

gcc_opt2 = -lc -m64 -c -g

all: lab6.zip bit_decode 

lab6.zip: *.c *.s Makefile lab6Readme
	zip lab6.zip *.c *.s Makefile lab6Readme

bit_decode: bit_decode.o rotate_right.o rotate_left.o create_key.o
	gcc bit_decode.o rotate_right.o rotate_left.o create_key.o -o bit_decode

bit_decode.o: bit_decode.c
	gcc $(gcc_opt) -o bit_decode.o bit_decode.c

rotate_right.o: rotate_right.s
	gcc $(gcc_opt2) rotate_right.s

rotate_left.o: rotate_left.s
	gcc $(gcc_opt2) rotate_left.s


create_key.o: create_key.s
	gcc $(gcc_opt2) create_key.s

clean:
	rm -rf *.o lab6

