section .data
msg    db      "XOR - find proper number or char to pass this level",0x0a
lenmsg equ $-msg
msg1    db      "XOR - without GDB just press ENTER 10 times and you would see incredable,.... your first xor symbol f___",0x0a,0x00
lenmsg1 equ $-msg1
msg2    db      "ADD - add Bitwise operator just add somthg to find next letter",0x0a,0x00
lenmsg2 equ $-msg2
msg3	db	"ADD - your next symbol f*__",0x0a
lenmsg3	equ $-msg3
msg4    db      "AND - just DO IT LIKE MY GRANDMOTHER ",0x0a
lenmsg4 equ $-msg4
msg5	db	"AND - Make your choice symbol f**_ ",0x0a
lenmsg5 equ $-msg5
msg6   db      "OR - Bitwise Operator is waiting for you!!!!",0x0a
lenmsg6 equ $-msg6
msg7   db      "GeT Out fROm mY ProGrAm, iNtRUdEr  xor add and or operations (f***)",0x0a
lenmsg7 equ $-msg7
section .bss     ;varibles of the user
num 	resb 4	
numadd  resb 4
numor	resb 4
numand	resb 4
section .text			;set section inside program
        global main		;sat function as global main 
        main:			;main function
        mov eax, 0x04		;sys_write
        mov ebx, 0x01		;stdout
        mov ecx, msg		;message
        mov edx, lenmsg		;length
        int 0x80		;syscalls
	
        mov eax, 0x03		;sys_read
        mov ebx, 0x00		;stdin
        mov ecx, num		;Enter varible 
        mov edx, 5		;varible length
        int 0x80		;syscalls

	mov ecx, [num]		;address of num inside ecx 
        xor cl, 0x57		;xor operation with 'W'(ASCII)
        cmp cl, 0x66		;compare chack it with varible
        je good			;if yes go to good
	int 0x80		;syscalls 
	jmp exit		;if no go to exit
addfun:				;next function add operation
        mov eax, 0x04		;sys_write
        mov ebx, 0x01		;stdout
        mov ecx, msg2		;message for user
        mov edx, lenmsg2	;message length
        int 0x80		;syscalls
        
        mov eax, 0x03		;sys_read
        mov ebx, 0x00		;stdin
        mov ecx, numadd		;Enter varible
        mov edx, 5		;varible length
        int 0x80		;syscalls


	mov ecx, [numadd]	;address of varible inside ecx
	add cl, 0x30		;add operation with '0'(ASCII)
	cmp cl, 0x61		;compare chack it with varible
	je good1		;jump to function good1 if its right num
	int 0x80		;syscalls
	jmp exit		;jump to exit
andfun:				;next function and operator
        mov eax, 0x04		;sys_write
        mov ebx, 0x01		;stdout
        mov ecx, msg4		;message for user
        mov edx, lenmsg4	;message length
        int 0x80		;syscalls

        mov eax, 0x03		;sys_read
        mov ebx, 0x00		;stdin
        mov ecx, numand		;Enter varible
        mov edx, 5		;length of the varible
        int 0x80		;syscalls

	mov ecx, [numand]	;address of the varible inside ecx
	and cl, 0x73		;and operation with 's'(ASCII)
	cmp cl, 0x63		;compare it with 0x63
	je good2		;jump to function good2
	int 0x80		;syscalls
	jmp exit		;exit if its fail
orfun:				;netx function or 
        mov eax, 0x04		;sys_write
        mov ebx, 0x01		;stdout
        mov ecx, msg6		;message for the user
        mov edx, lenmsg6	;message length
        int 0x80		;syscalls

        mov eax, 0x03		;sys_read
        mov ebx, 0x00		;stdin
        mov ecx, numor		;Enter varible
        mov edx, 5		;varible length
        int 0x80		;syscalls

	mov ecx, [numor]	;address of the varible inside ecx
	or cl, 	0x64		;or operator "d"(ASCII)
	cmp cl, 0x65		;compare with varible
	je good3		;jump to good3
	int 0x80		;syscalls
	jmp exit		;jump to exit
exit:				;next function exit
        mov eax, 0x01		;exit from aplication
        int 0x80		;syscalls
good:				;function good
        mov eax, 0x04		;sys_write
        mov ebx, 0x01		;stdout
        mov ecx, msg1		;message for user
        mov edx, lenmsg1	;message length
	int 0x80		;syscalls
        jmp addfun		;jump to function add
good1:				;next function goo1
        mov eax, 0x04		;sys_write
        mov ebx, 0x01		;stdout
        mov ecx, msg3		;message for user
        mov edx, lenmsg3	;message length
	int 0x80		;syscalls
        jmp andfun		;jumpto function and
good2:				;next function good2
        mov eax, 0x04		;sys_write
        mov ebx, 0x01		;stdout
        mov ecx, msg5		;message for user
        mov edx, lenmsg5	;message length
	int 0x80		;syscalls
        jmp orfun		;jump to function or
good3:				;next function good3
        mov eax, 0x04		;sys_write
        mov ebx, 0x01		;stdout
        mov ecx, msg7		;message for user
        mov edx, lenmsg7	;message length
	int 0x80		;syscalls
        jmp exit		;jump to exit


