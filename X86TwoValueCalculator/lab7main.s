## BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I STRICTLY ADHERED TO THE 
## TENURES OF THE OHIO STATE UNIVERSITY’S ACADEMIC INTEGRITY POLICY.
## Author: Noah Bennett

.file "lab7main"
.section .rodata
.text
.globl main
.align 8

mode:
	.string "r"

exit_str:
	.string "Usage: %s filename count\n"
	
main:
	## Reset stack pointer
	pushq %rbp
	movq %rsp, %rbp 
	
	## Send error message and exit the program if argc is not 3
	cmpl $3, %edi
	jne error_exit
	
	## Store count and file name in rdi and r12 respectively and get an integer value of count
	movq 8(%rsi), %r12
	movq 16(%rsi), %rdi
	subq %rax, %rax
	call atoi
	movl %eax, %r13d

	## Allocate 40 times the number of lines to be read in space
	movl $40, %eax
	imulq %r13, %rax
	subq %rax, %rsp
	andq $-16, %rsp

  	## Clear rax and move file name and fscanf mode into correct registers for fopen
  	movq %r12, %rdi          
  	movq $mode, %rsi
  	subq %rax, %rax
  	call fopen  

	## Move parameters into parameter registers and push rsi and rax onto stack to preserve them, call readlines
	movq %rax, %rdi
  	movq %rsp, %rsi
 	movq %r13, %rdx
  	pushq %rsi
 	pushq %rax
  	call readlines

  	## Pop rax, move it into rdi, call fclose, then pop rsi
  	popq %rax
  	movq %rax, %rdi
  	call fclose
	popq %rsi

  	## Move line count into rsi and push rdi to preserve it for compute call
  	movq %rsi, %rdi
  	movq %r13, %rsi
  	pushq %rdi
  	call compute
	popq %rdi

  	## Move number of lines into rsi for printlines call
  	movq %r13, %rsi
  	call printlines

	jmp exit
	
error_exit:

	## Print error message, clear rax, and put argv[0] into rsi for printf
	movq $exit_str, %rdi
	subq %rax, %rax
	movq (%rsi), %rsi
	call printf
	
	leave
	ret

exit:
	leave
	ret

