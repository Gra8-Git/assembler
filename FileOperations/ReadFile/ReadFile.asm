; File: ReadFile.asm                                Modified  
; Sergey.P 

section .data                                   ;section for constant values
filename        db       'HelloWorld.txt'       ;name of value with name of the File
section .bss                                    ;section for input/output operations
file_in         resb 10                         ;name of value in/out put, and allocate memor$
fromfile        resb 26                         ;value to print constant value from file
section .text                                   ;section for all operations inside programn
        global main                             ;main global function
        main:                                   ;beginning of global function
                mov eax, 5                      ;system call set to reading sys_read()
                mov ebx, filename               ;file name from whare to read
                mov ecx, 0                      ;read only action  
                mov edx, 0777o                  ;kernel rwx 777 (Linux) set file attributes
                int 0x80                        ;syscall
                                                ;............................................$
                mov [file_in], eax              ;set as in/out put, operations from value
                                                ;............................................$
                mov eax, 3                      ;system call read from file sys_read()
                mov ebx, [file_in]              ;indexing address from whare to read
                mov ecx, fromfile               ;value to save information from file
                mov edx, 26                     ;langth of information
                int 0x80                        ;sys_call
                                                ;.............................................
                mov eax, 4                      ;syscall sys_write
                mov ebx, 1                      ;std_out()
                mov ecx, fromfile               ;print value
                mov edx, 26                     ;langth of the value
                int 0x80                        ;syscall
                                                ;.............................................
                mov eax, 6                      ;syscall close_file()
                mov ebx, [file_in]              ;close file desctiptor
                                                ;.............................................
                mov eax, 1                      ;syscall_exit()
                int 0x80                        ;syscall


