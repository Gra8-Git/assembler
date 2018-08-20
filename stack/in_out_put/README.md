# assembly (program wich prints and take input from user) 
# Sergio's P.

	STACK			-	It's array of memory in wich data stored or can be removed
					push store data inside memory, pop take data from memory.
					Two most usefull operators for stack operations is
					PUSH and POP.  
		PUSH (push)	-	PUSH operand it's means writing inside stack, store 
		PUSHW			register or constant into stack memory. Onle words or
		PUSHD			doublewords could be stored into stack. 
					also is two operand wich working with ather data but with
					saem means PUSHW (word declare 2 bytes),
					PUSHD(doubleword declare 4 bytes) could be transfared 
					inside one instruction. 
					example:

					push message	<push inside stack value>


		POP  (pop)	-	POP popping it's means load information (memory or data
		POPW			constant) from the stack. POP operator work only with
		POPD			address	or register.POPW(2 bytes),POPD(4 bytes)saem
					as PUSHW, PUSHD.
					example:
						
					pop message	<take from stack value>

		CALL (call)	-	CALL operand most simple declamation ))) of this operand
					calling function inside linux or windows OS terminal
					you can use echo command to make saem effect, but here is 
					a difference. call operand first send address of the 
					function (place inside program) inside stack and after
					jump to code inside function. After compliting all
					operands inside function returned to address whare 
					it was start and from this address compliting run 
					application. As I wrote before address was saved inside 
					stack with operat call to this address function returning.
					example:

					push message	<before print we store message inside stack>
					call printf	<calling function to print data from stack>

		ESP (esp)	-	It's operand wich return first address of allocated memory
					ESP register always point on the top of the stack
					If PUSHW (2 bytes) operand is then esp increased by 2
					if PUSHD(4 bytes) operand is then esp increased by 4. stack grow memory
					from hight to low. Simple esp can be called as stack pointer to begining.
					example:

					add esp, 0x08	<remove the top 8 bytes from the stack> 
							<adding to top of the stack 8 bytes this operation>	
							<pushing inside stack 8 bytes of nothing>
							<and nothing saved inside stack on plase of information>

		EBP (ebp)	-	ebp (base pointer) it's used to store local values (arguments)
					it's operand wich point to the base of the frame.This operand have 
					couple functions and it working with espto create new stack pointer, frame.

					example:

					push ebp		<save previous stackbase - point register>

					It's mean ebp save wich was before to not use base poiner of other program.
					
					example:
					
					mov ebp, esp		<creating new stack pointer top of the stack esp>

					It's mean it create new stack pointer esp for program  inside main stack.
 
					example:

					mov ecx, [ebp+0x8]	<return address of the frame and mov it to ecx>

					example:
					
					mov esp, ebp		<return esp stack pointer to previous state>

					It's means set stack pointer to base frame address, remove our stack and
					frame.

					example:

					pop ebp			<release frame>

					example:

					ret			<its end of the function return address in the stack>

					It's means ret returnning address of the function exiting from function and
					compliting operations after function inside global function or inside 
					other function.

	scanf and printf	-	This functions(operations) wich working with the stack. You can call tham 
					external wich means from operation system or you can write them by your self
					external example:

					section .text  
						extern printf	<---
						extern scanf	<---
					global main
						main:
						push langth	<---
						push message	<---
						call printf	<---
						add esp, 0x08	<---
						...
					Or you can create your own function with your own name wich making 
					the saem operations.
					
					example:

					printitnow:
						push ebp		<save previous stackbase>
						mov ebp, esp		<create new stack pointer>
						mov eax, 0x04 or 0x03	<syswrite or sysread>
						mov ebx, 0x01 or 0x00	<stdout or stdin>
						mov ecx, [ebp+0x8]	<return message from stack frame>
						mov edx, [ebp+0xc]	<return langth from stack frame>
						int 0x80		<syscall>
						mov esp, ebp		<return esp stack to previous state>
						pop ebp			<release frame>
						ret			<return address in the stack>
