; # assembler stack program two ways of printing
;Sergio's P.
;##############################################################################################
section .data                                   ;section for constant values
        message db "Your name?",0xa             ;constant value 
        len equ $-message                       ;langth of constant value
        messageuser db"Your name:",0x00         ;constant value
        lenuser equ $-messageuser               ;langth of constant value
section .bss                                    ;section for user input
        name resb 26                            ;name of value and langth
        num resb 26                             ;name of value and langth
section .text                                   ;main section
                extern printf                   ;external function from Operation system
        ping                                    ;extern can call all functions inside operation system 
        global main                             ;set function main as global
                main:                           ;main function
                push len                        ;push langth of message inside stack
                push message                    ;push message inside stack
                call printone                   ;call function wich print from the stack
                add esp, 0x08                   ;clear stack
                push 25                         ;push push in stack
                push num                        ;push in stack
                call scaf                       ;call function
                add esp, 0x08                   ;clear esp
                push lenuser                    ;push langth of value inside stack
                push messageuser                ;push message inside stack
                call printf                     ;call function print from the stack
                add esp, 0x08                   ;clear esp
                push 25                         ;push langth inside stack
                push num                        ;push message inside stack
                call printf                     ;call function wich print from the stack
                add esp, 0x08                   ;clear esp
        exit:                                   ;exit
                mov eax, 0x01                   ;sys call exit
                int 0x80                        ;sys call karnal
        scaf:                                   ;user input function
                push ebp                        ;save previous stackbase-pointer register
                mov ebp, esp                    ;ebp<<esp create new one stack-pointer
                mov eax, 0x03                   ;syscall read
                mov ebx, 0x00                   ;stdin
                mov ecx, [ebp+0x8]              ;return address of varible and move it to ecx
                mov edx, [ebp+0xc]              ;return address of varible and move it to edx
                int 0x80                        ;syscall
                mov esp, ebp                    ;set stack pointer to base frame address
                pop ebp                         ;release frame
                ret                             ;return address in the stack
        printone:                               ;print function
                push ebp                        ;frame pointer
                mov ebp, esp                    ;al stack content saved down the stack so function can be saved in stack 
                mov eax, 0x04                   ;sys write
                mov ebx, 0x01                   ;stdout
                mov ecx, [ebp+0x8]              ;return address of the value and move it to ecx
                mov edx, [ebp+0xc]              ;return address of the value and move it to edx
                int 0x80                        ;sys call karnal
                mov esp, ebp                    ;set stack pointer to base frame address
                pop ebp                         ;release frame
                ret                             ;return address in the stack
;########################################################################################################################

