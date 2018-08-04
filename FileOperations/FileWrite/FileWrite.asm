;              File: OpenFile.asm                                          

section .data                                   ;section for constant values
texttofile      db       'Hello World',0xa      ;message and name on value
lentext equ $-texttofile                        ;length of value
filename        db       'HelloWorld.txt'       ;name of value inside wich name of file
section .bss                                    ;section for user input and system in/out put
file_out        resb 1                          ;value name and allocated memmory
section .text                                   ;section for main function of the program
        global main                             ;set main function as a global 
        main:                                   ;beginning of main function
                mov eax, 8                      ;system call sys_create()
                mov ebx, filename               ;base register,(file desct.,)inside name of f$
                mov ecx, 0777o                  ;kernel set file atribute rwx or 777 (Linux)
                int 0x80                        ;syscall
                                                ;......................................
                mov [file_out], eax             ;input/output opertations inside file
                                                ;......................................
                mov eax, 4                      ;set systemcall writing inside file
                mov ebx, [file_out]             ;set address for input
                mov ecx, texttofile             ;text for input
                mov edx, lentext                ;length of the text
                int 0x80                        ;syscall
                                                ;......................................
                mov eax, 6                      ;sys call close file
                mov ebx, [file_out]             ;close input operation
                                                ;.....................................
                mov eax, 1                      ;syscall system exit
                int 0x80                        ;syscall kernel
