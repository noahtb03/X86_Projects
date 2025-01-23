## BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I STRICTLY ADHERED TO THE 
## TENURES OF THE OHIO STATE UNIVERSITY'S ACADEMIC INTEGRITY POLICY WITH RESPECT 
## TO THIS ASSIGNMENT
##Author: Noah Bennett

.file "rotate_right"
.section .rodata
.text
.align 8
.globl rotate_right

rotate_right:
	##push callee saved register onto stack and point the stack to it
	pushq %rbp
	movq %rsp, %rbp
	
	##and 1 with the parameter and shift it over 7 bits
	movb $1, %cl
	andb %dil, %cl
	shlb $7, %cl

	##move parameter into return register and shift it right one
	movb %dil, %al
	shrb $1, %al

	##or return register with whether or not rightmost bit was one
	orb %cl, %al

	##pop rbp from stack
	movq %rbp, %rsp
	popq %rbp
ret
	
