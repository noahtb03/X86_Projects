## BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I STRICTLY ADHERED TO THE 
## TENURES OF THE OHIO STATE UNIVERSITY'S ACADEMIC INTEGRITY POLICY WITH RESPECT 
## TO THIS ASSIGNMENT
##Author: Noah Bennett

.file "rotate_left"
.section .rodata
.text
.align 8
.globl rotate_left

rotate_left:
	##push callee saved register onto stack and point the stack to it
	pushq %rbp
	movq %rsp, %rbp
	
	##set cl to 128, and it with parameter, shift it right 7 bits
	movb $128, %cl
	andb %dil, %cl
	shrb $7, %cl
	
	##mov dil into return register, shift it left
	movb %dil, %al
	shlb $1, %al

	## or return register with cl to account for leftmost bit being 1
	orb %cl, %al

	##pop rbp from stack
	movq %rbp, %rsp
	popq %rbp
ret
