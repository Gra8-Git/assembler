# assembly
Sergio's P.
program on assembly language 

" section .data "    This section for constant information like data text numblers and so on.
                     It could be used outside functions, in the begining on in the end of the program.

"value inside .data" -    To create value inside .data section you need write down name of value define data 
                              of the value " db " - define bytes, and write your message. 
                              example:
                              
                     message    db   "Hello World"   <name   define bytes  expression>
                              
                              DB (db)  Define Byte         declare 1 byte.
                              DW (dw)  Define Word         declare 2 bytes.
                              DD (dd)  Define Doubleword   declare 4 bytes.
                              DQ (dq)  Define Quadword     declare 8 bytes.
                              DT (dt)  Define Ten Bytes    declare 10 bytes.
                              
                   Second value is langth on message how long is your message.
                   Alsow here you need name of the varible, "equ" - equivalent this directive create
                   constant value with proper name. 
                   "$" - for denote address of the assembler minus the address of message and  it will be 
                   number of bytes of your message.
                   example:
                              
                   langth    equ    $ - message    <name of value  equvivalent   address pointer minus message>
                              
                              
" section .bss  "    This section for varibles wich should enter user inside command prompt. 
      
"value inside .bss" -     It's section for varibles wich could be changed by the user or 
                          functions, directives inside program.To create value inside .bss section you need 
                          write down name of value allocate, declare storage space for value and number of bytes.
                          example:
                              
                          value resb  1         <name of value byte declaration number of bytes >
                              
                              RESB 1 declare 1 byte.
                              RESW 1 declare 2 bytes.
                              RESD 1 declare 4 bytes.
                              RESQ 1 declare 8 bytes.
                              REST 1 declare 10 bytes.
                              
             
" section .text "    This section for basic, main funcion of the program, inside wich you making all operations
                     directives and all calculations.

"global main "  -    Global function its like a link fo compilator to find the begining of the program 
                     it could be main or start. with gcc compiler its  called "main" for "Id" its  _start
                     example:
                        
                                      global main
                                      global _start
                                main:
                              _start:
                        
                     Alsow tow of them can be writen inside program to compilate program with two abilities. 

" main or _start function " - directives, (commands for CPU) 
                              
         MOV(mov) - This directive making copy of one register to another, it using Rr, Rd registers 
                    (address of value) and if it writen "mov Rd, Rr" it's mean that Rr register going to Rd 
                    register.
                    example:
                                    
                    MOV ECX, MESSAGE  <move message to register ecx>
                                    
        INT(int)  - "Interrupt" assembly language directive wich takes interrupt number often  writen in hex
                    number of OS (Operation System). Its vector of commands inside OS. In linux its used 
                    sys_calls to transfare program flow to kernel. To interact with PC and User.
                                    
                                    0x0  - 0x13  Nonmaskable interrupts and exeptions
                                    0x14 - 0x1f  Intel reserved
                                    0x20 - 0x7f  External Interrupts (IRQs)
                                    0x80 -       System calls programed exeptions
                                    0x81 - 0xee  External interrupts (IRQs)
                                    
                                    example:
                                    int 0x80    <Linux system calls>
                                    
        JMP(jmp)   - "Jump to Function" its lable to transfare flow of the program.
                     Its mean flow of program could be transferet to another part of the code.
                     With proper conditions or without it. It the like operator if else on other languages.
                                    
                                    Arithmetics operations
                                    
                                    JE   jump equal
                                    JZ 	 jump zero 	
                                    JNE  jump not equal
                                    JNZ  jump not zero
                                    JG   jump greater
                                    JNLE jump not less or equal 
                                    JGE  jump greater equal
                                    JNL  jump not less 
                                    JL   jump less
                                    JNGE jump not greater or equal 	
                                    JLE  jump less equal
                                    JNG  jump not greater 	
                            
                            
                                    Logical operations
                            
                                    JE   jump equal
                                    JZ 	 jump zero 	
                                    JNE  jump not equal
                                    JNZ  jump not zero 	
                                    JA   jump above
                                    JNBE jump not equal 
                                    JAE  jump above or equal 
                                    JNB  jump not below 	
                                    JB	 jump below
                                    JNAE jump not above or equal 	
                                    JBE	 jump below or equal
                                    JNA  jump not above 	
                            
                                    Jamp instructions chack the value of flags
                                    
                                    JXCZ 	jump if CX is zero 
                                    JC 	  jump if carry 	
                                    JNC 	jump if no carry 	
                                    JO 	  jump if overflow 
                                    JNO 	jump if no overflow 	
                                    JP	  jump parity
                                    JPE   jump parity even 
                                    JNP   jump no parity
                                    JPO 	jump parity odd 	
                                    JS 	  jump sign (value is negative) 	
                                    JNS 	jump no sign (value is positive) 	
                          
                          
        CMP(cmp)- " compare " Compare directive wich compare two values is it equal or not. 
                  Its not jump to source od destination it only chack is value equal with other value.
                  cmp directive is working with directives jmp to make flow transaction.
                  examlpe:
                                    
                  cmp ecx, 0x00  <compare value from register ecx with value 0x00 zero>
                  jmp exit       <jump to function exit>
                      
"Logical Instructions Bitwise Operations" - It's mean bit operations with values. 
                          
         AND  - Maiking bit operation with values. Only if bit True in bouth values it put but True.
                If bit:    True and False = False   or    True and True  = True
                                         
                example:
                          
                and 0x43, 0x67  < and operation with ascii 0x63 ^ 0x43 = 0x43>
                        AND 	01100011  01000011 = 01000011
                                                       
                                                       
        OR   -	Maiking bit operations with value . If Bit True inside one of the values it put it
                True. If Bit: True and False =True False and True = True, True and True = True 
                False and False = False
                                  
                example:
                                  
                or 0x43, 0x67   <or operation with ascii 0x63 | 0x43 = 0x63 >
                      OR 01100011 01000011 = 01100011
                                                      
     ADD  -     Maiking bit operations with value. If Bit True and True = False, only in case if its first 
                or in case thare is not previous bit with saem condition. It's mean if bit True True we making
                plus and it two right! But we should put True or False thats whay with law ob math and bits 
                we keep it in mind as True and going to the next bit. If next bit is also True True we 
                using previous bit and put second bit as True, but we have at the second values True True 
                we using saem combination as with the first bit. If Bit False and False = False,
                True and False = True
                          
                example:
                                  
                add 0x43, 0x67   <add operation with ascii 0x63 | 0x43 = 0xA6 >
                     ADD 01100011 01000011 =  010100110
                                                      
     XOR  -	Maiking bit operation with value. If Bit bouth True or False values it return False 
                If bit: True and False = True, False and True = True, True and True = False, 
                False and False = False.
                                  
                example:
                                  
                xor 0x43, 0x67   <xor operation with ascii 0x63 ^ 0x43 = 0x20 >
                    XOR 01100011 01000011 = 001000000
                                                      
                                  
	                        	
