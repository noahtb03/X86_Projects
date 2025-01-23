#BY SUBMITTING THIS FILE TO CARMEN,I CERTIFY THAT I HAVE STRICTLY
#ADHERED TO THE TENURES OF THE OHIO STATE UNIVERSITY'S ACADEMIC
#INTEGRITY POLICY WITH REGARDS TO THIS ASSIGNMENT.
#Author: Noah Bennett

gcc_opt = -lc -m64 -c -g

all: lab7.zip readrec

lab7.zip:
	zip lab7.zip Makefile lab7main.s readlines.s compute.s printlines.s lab7Readme

readrec: lab7main.o readlines.o compute.o printlines.o
	gcc lab7main.o readlines.o compute.o printlines.o -o readrec

lab7main.o: lab7main.s
	gcc $(gcc_opt) lab7main.s

readlines.o: readlines.s
	gcc $(gcc_opt) readlines.s

compute.o: compute.s
	gcc $(gcc_opt) compute.s

printlines.o: printlines.s
	gcc $(gcc_opt) printlines.s

clean:
	rm -rf *.o readrec lab7.zip
