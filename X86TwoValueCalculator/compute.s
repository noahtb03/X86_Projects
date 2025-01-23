## BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I STRICTLY ADHERED TO THE 
## TENURES OF THE OHIO STATE UNIVERSITY’S ACADEMIC INTEGRITY POLICY.
## Author: Noah Bennett

.file "compute"
.section .rodata
.text
.globl compute
.align 8

compute:
	## Reset stack pointer
	pushq %rbp
	movq %rsp, %rbp

	## Push callee saved registers onto stack
	pushq %r12
	pushq %r13
	pushq %r14

	## Get count and array pointer
	movq %rdi, %r12
	movq %rsi, %r13
		
	loop:

  		## Put first value into r14d
		movl 8(%r12), %r14d

  		## Calculate the sum and store it in the correct register space
  		movslq 8(%r12), %r8
  		movslq 16(%r12), %r9
  		addq %r8, %r9
  		movq %r9, 24(%r12)

  		## Calculate the difference and store it in the correct register space
  		movl 8(%r12), %r8d
  		movl 16(%r12), %r9d
  		subl %r9d, %r8d
  		movslq %r8d, %r8 
		imulq $-1, %r8   
  		movq %r8, (%r12)  

		## Calculate the quotient and remainder and store them in the correct register space
		movl 16(%r12), %eax
		cdq
		idivl %r14d
		movl %eax, 12(%r12)
		movl %edx, 20(%r12)
  		
  		## Calculate the product and store it in the correct register space
  		movl 16(%r12), %eax
  		imull %r14d
  		shlq $32, %rdx
  		orq %rdx, %rax
  		movq %rax, 32(%r12)

  		## Move r12 40 bytes over and decrement the line counter
  		addq $40, %r12
  		decq %r13

		## Check how many lines are left to read
		cmpq $0, %r13
  		je exit

		jmp loop
		
exit:
	## Pop callee saved registers from the stack
	popq %r14
	popq %r13
	popq %r12

	leave
	ret

