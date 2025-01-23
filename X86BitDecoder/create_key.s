## BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I STRICTLY ADHERED TO THE 
## TENURES OF THE OHIO STATE UNIVERSITY'S ACADEMIC INTEGRITY POLICY WITH RESPECT 
## TO THIS ASSIGNMENT
##Author: Noah Bennett

.file "create_key"
.section .rodata
.text
.globl create_key
.align 8

User_Prompt:
.string "enter 4 bit key: "

create_key:
	##push callee saved register onto stack and point the stack to it
	pushq %rbp
	movq %rsp, %rbp

	##prompt user
	movq $User_Prompt, %rdi
	movl $0, %eax
	call printf

	##set r8d to the first digit
	movl $0, %eax
	call getchar
	movl $0, %r8d	
	subl $48, %eax
	sall $3, %eax
	orl %eax, %r8d

	##set r9d to the second digit
	call getchar
	movl $0, %r9d
	subl $48, %eax
	sall $2, %eax
	orl %eax, %r9d

	##set r10d to the third digit
	call getchar
	movl $0, %r10d
	subl $48, %eax
	sall $1, %eax
	orl %eax, %r10d

	##set r11d to the last digit
	call getchar
	movl $0, %r11d
	subl $48, %eax
	orl %eax, %r11d
	
	## make r8d have the 4 bit code, copy it to eax, shift it 4 bits left 		##and or it with eax to get an 8 bit code
	orl %r9d, %r8d
	orl %r10d, %r8d
	orl %r11d, %r8d
	orl %r8d, %eax
	shll $4, %r8d
	orl %r8d, %eax
	orl %eax, %r8d

	##pop rbp from stack
	movq %rbp, %rsp
	popq %rbp
ret
