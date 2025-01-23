## BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I STRICTLY ADHERED TO THE 
## TENURES OF THE OHIO STATE UNIVERSITY’S ACADEMIC INTEGRITY POLICY.
## Author: Noah Bennett

.file "readlines"
.section .rodata
.text
.globl readlines
.align 8

format:
	.string "%d %d"

readlines:
	## Reset stack pointer
	pushq %rbp
	movq %rsp, %rbp	

	## Push callee saved registers onto the stack
	pushq %r12	
	pushq %r13
	pushq %r14
	pushq %r15

	## Get count, and array and file pointers and store them into registers
	movq %rdi, %r12
	movq %rdx, %r13
	movq %rsi, %r14
		
	loop:
		## Check how many lines are left to read
		cmpq $0, %r13
  		je exit

  		## Move arguments into correct parameter registers
  		movq %r12, %rdi
		movq $format, %rsi
		leaq 8(%r14), %rcx
		leaq 16(%r14), %rdx

		## Clear rax and get new values
		subq %rax, %rax
		call fscanf
 
  		## Move r14 40 bytes over and decrement the line counter
  		addq $40, %r14
  		decq %r13

  		jmp loop

exit:

  	## Remove callee registers from stack
  	popq %r15
  	popq %r14
  	popq %r13
  	popq %r12

  	leave
  	ret

