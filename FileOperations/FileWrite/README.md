# assembly
# Sergio's P.
Program on assembly language (Open and Read from File)

"section .data "	- This section for constant information like data text numblers and so on. It could be used 
			  outside functions, in the begining on in the end of the program.

"value inside .data"	- To create value inside .data section you need write down name of value define data 
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
                          
                          length    equ    $ - message    <name of value  equvivalent   address pointer minus message>

"section .bss"		 -This section for varibles wich should enter user inside command prompt.

"value inside .bss"	 -It's section for varibles wich could be changed by the user or 
                          functions, directives inside program.To create value inside .bss section you need 
                          write down name of value allocate, declare storage space for value and number of bytes.
                          example:
                          
                          value resb  1         <name of value byte declaration number of bytes >
                          
                          RESB 1 declare 1 byte.
                          RESW 1 declare 2 bytes.
                          RESD 1 declare 4 bytes.
                          RESQ 1 declare 8 bytes.
                          REST 1 declare 10 bytes.

"section .text"		 -This section for basic, main funcion of the program, inside wich you making all operations
			  directives and all calculations.

"global main"	          Global function its like a link for compilator to find the begining of the program 
                          it could be main or start. with gcc compiler its  called "main" for "Id" its  _start
                          example:
                    
                                  global main
                                  global _start
                          main:
                          _start:
                    
                          Alsow tow of them can be writen inside program to compilate program with two abilities. 


"main or _start function"  directives, (commands for CPU) 
                          
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
			
			EAX(eax) 32bit - "primary accumulator register" It's used for in/out put operations, 
				and calculate operations. EAX return value of function
					1	SYS_EXIT	
					2	SYS_FORK		
					3	SYS_READ	
					4	SYS_WRITE
					5	SYS_OPEN
					6	SYS_CLOSE

				example:
				
				mov eax, 4	set register on sys_write mode

			
			EBX(ebx) 32bit - "Base register" It's reguster wich used in index addressing
			        It is like a base pointer for memmory access, also with same interrupts. 

			ECX(ecx) 32bit - "Counter register" Base purpose of register is loop counter, function parameter.
			        Loop counter - ecx with decimal value auto decrementing it till it not reaches zero.
			        Parameter - ecx could take different kind parameters of the function and return it.
				example:

				mov eax, 0x04			;syscall write
				mov ebx, 0x01			;stdout
				mov ecx, message		;return message parameter
				mov edx, messagelangth 		;return langth of the message
				int 0x80			;sys call

			EDX(edx) 32bit - "Data register" it is user for in/out put operations ,arithmetic and same
				interrupt calls (system calls).



"Operations with Files"	- (Linux OS) 

			Create File - To create file inside Linux OS we need Name of the file and parameters
				      like: read, write, execute for groups and users.


                                        2       sys_fork        creating a new process
                                        3       sys_read        read to file
                                        4       sys_write       write to file
                                        5       sys_open        open file
                                        6       sys_close       close file
                                        8       sys_creat       create file
                                        19      sys_lseek       update file


				      example:

					mov  eax, 8
					mov  ebx, filename
					mov  ecx, 0777o
					int  0x80

					eax, 8 or 0x08 - It's mean sys_creat, system call of the file handler
							 start of the function to create file .
					ebx, filename  - Creating file with specific name wich user set for this file
					ecx, 0777o     - ecx geting parameters for file write read execute for all.
					int 0x80       - system calls

        Update, Read, Write from File - To update, read and write in File we need proper parameters (system calls)
					update operation is saem as read and write semple it update file wich already 
					have information or was created.

					example  open reading:
						
                                        mov  eax, 5
                                        mov  ebx, filename
                                        mov  ecx, 0
					mov  edx, 0777o
                                        int  0x80

                                        eax, 5 or 0x05 - It's mean sys_open, system call of the file handler
                                                         start of the function to open file .
                                        ebx, filename  - Open file with specific name.
                                        edx, 0777o     - edx geting parameters for file write read execute for all.
                                        ecx, 0	       - zero means we shoudn't set parameters only default zero 0 
					int 0x80       - system calls

          				mov [file_in], eax

                                        mov eax, 3  
			                mov ebx, [file_in]     
			                mov ecx, fromfile              
			                mov edx, 255    
					
					eax, 5 or 0x05 - It's mean sys_open, system call of the file handler
                                                         start of the function to open file .
                                        ebx, filename  - Open file with specific name.
                                        ebx, 0777o     - ecx geting parameters for file write read execute for all.
                                        ecx, 0         - zero means we shoudn't set parameters only default zero 0
                                        int 0x80       - system calls

			                int 0x80           


					mov [file_in], eax - [file_in] it's like port or thread value to take bytes
							     from file and save it inside message memmory as before 
							     file wath opened eax have address from whare to read 
							     bytes.	

                                        eax, 3 or 0x03 - It's mean sys_read, system call. 
                                                         start of the function to read from file .
                                        ebx, filename  - Read from file with specific name.
                                        edx, 255       - edx geting langth of value message how many bit to read from file.
                                        ecx, message   - name of value whare all bytes from file whould be saved
                                        int 0x80       - system calls

					
			Close File   -  Simply closing file and all threads (processes)  wich working with file
					example:
					
					mov eax, 6 or 0x06	System call to close file ending reading writing operations 	
					mov ebx, [file_in]      file_ in send last address pointer to ebx.
 
