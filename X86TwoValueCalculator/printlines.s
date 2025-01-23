## BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I STRICTLY ADHERED TO THE 
## TENURES OF THE OHIO STATE UNIVERSITY’S ACADEMIC INTEGRITY POLICY.
## Author: Noah Bennett

.file "printlines"
.section .rodata
.text
.globl printlines
.align 8

header: 
	.string "Results for entry %d:\n"

sumStr:
	.string "%d + %d = %ld\n"

subStr:
	.string "%d - %d = %d\n"

mulStr:
	.string "%d * %d = %ld\n"

divStr:
	.string "%d / %d = %d, R: %d\n\n"

printlines:
	## Reset stack pointer
	push %rbp
	movq %rsp, %rbp
	
	## Push callee saved registers onto stack
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15

	## Get count and numbers to use for calculations
	movq %rdi, %r12
	movq %rsi, %r13
	movl $1, %r15d
	
	loop:
		## Make sure there are still numbers to check
		cmpl $0, %r13d
		jle exit

		## Print header
  		movq $header, %rdi
  		movl %r15d, %esi
  		call printf
		
		## Get numbers for calculations
		movl 8(%r12), %ebx
		movl 16(%r12), %r14d	

		## Move sum string, values, and sum into correct registers for printf
		movq $sumStr, %rdi
		movl %ebx, %edx
		movl %r14d, %esi
		movq 24(%r12), %rcx
		
		## Clear rax and print	
		subq %rax, %rax
		call printf

		## Move difference string, values, and difference into correct registers for printf
		movq $subStr, %rdi
		movl %ebx, %edx
		movl %r14d, %esi
		movl (%r12), %ecx 

		## Clear rax and print		
		subq %rax, %rax		
		call printf

		## Move product string, values, and product into correct registers for printf
		movq $mulStr, %rdi
		movl %ebx, %edx
		movl %r14d, %esi
		movq 32(%r12), %rcx

		## Clear rax and print
		subq %rax, %rax
		call printf

		## Move quotient string, values, remainder, and quotient into correct registers for printf
		movq $divStr, %rdi
		movl %ebx, %edx
		movl %r14d, %esi
		movl 12(%r12), %ecx
		movl 20(%r12), %r8d
		
		## Clear rax and print
		subq %rax, %rax
		call printf	
		
		## Move pointer forward 40 bytes increment and decrement counts and restart loop
		addq $40, %r12
		decl %r13d
		incl %r15d
	
		jmp loop	
	
	
	exit:
		## Pop all callee saved registers, then leave and return
		popq %r15
		popq %r14
		popq %r13
		popq %r12

		leave
		ret

