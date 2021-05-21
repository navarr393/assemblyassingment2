;****************************************************************************************************************************
;Program name: "Quadratic Formula".  This program demonstrates the input of three float numbers, a, b and c and calculates  *
;the roots of the quadratic equation formed using the quadratic formula.                                                    *                                                                                                             *
;Copyright (C) 2021 David Navarro.                                                                                          *
;                                                                                                                           *
;This file is part of the software program "Quadratic formula".                                                             *
;Quadratic Formula is free software: you can redistribute it and/or modify it under the terms of the GNU General            *
;Public License                                                                                                             *
;version 3 as published by the Free Software Foundation.                                                                    *
;Quadratic Formula is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied    *
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
;A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                            *
;****************************************************************************************************************************


;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
;
;Author information
;  Author name: David Navarro
;  Author email: navarrod253@csu.fullerton.edu
;
;Program information
;  Program name: Quadratic Formula
;  Programming languages: One module in C, two modules in c++, and one module in X86
;  Date program began: Feb-20-2021
;  Date of last update: Feb-28-2021
;  Date of reorganization of comments: Feb-28-2021
;  Files in this program: second_degree.c, quadratic.asm, isfloat.cpp, quadlibrary.cpp, run.sh
;  Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.
;
;This file
;   File name: quadratic.asm
;   Language: X86 with Intel syntax.
;   Max page width: 293 columns
;   Assemble: nasm -f elf64 -l Quadratic.lis -o Quadratic.o Quadratic.asm


;===== Begin code area ================================================================================================
global Quadratic
extern printf
extern scanf
extern isfloat
extern atof
extern show_no_root
extern show_one_root
extern show_two_root

section .data
    
    welcome db "This program will find the roots of any quadratic equation.",10,0
    input_floats db "Please enter the three floating point coefficients of a quadratic equation in the order a, b, c separated by white spaces. Then press enter:",0
    output_formula db "Thank you. The equation is  %0.12lfx^2  +  %0.12lfx  +  %0.12lf  =  0.0",10,0
    invalid_input db "Invalid input data detected.  You may run this program again.",10,0
    three_floats db "%s",0
    three_floats2 db "%s",0
    three_floats3 db "%s",0


section .bss  

section .text
Quadratic:

    ; Back up all registers and set stack pointer to base pointer
    push rbp
    mov rbp, rsp
    push rdi
    push rsi
    push rdx
    push rcx
    push r8
    push r9
    push r10
    push r11
    push r12
    push r13
    push r14
    push r15
    push rbx
    pushf

   ; push qword -1                   ; Extra push to create even number of pushes

; ----------------------------------------------------------------------
;display welcome message
mov rax, 1
mov rdi, welcome 
call printf

; ----------------------------------------------------------------------
;Display message to input the floats
push qword 0
mov rax, 0
mov rdi, input_floats         
call printf
pop rax

;----------------------------------------------------------------------
;Block to input the string
sub rsp, 1024
mov rax, 0
mov rdi, three_floats
mov rsi, rsp
call scanf

; ------------------------------------------------------------------------  
;Block to validate the recent input                                                                                   
mov rdi, rsp                                                                                                         
call isfloat ;call isfloat 

cmp rax, 0   ;if rax == 0 then 
je invalid   ;jump to invalid  
;convert to float
mov rax, 0                                                                                                            
mov rdi,rsp                                                                                                           
call atof
movsd xmm15, xmm0 ;xmm15 now holds string 1
;-----------------------------------------------------------------------
;input the second string float 
sub rsp, 1024
mov rax, 0
mov rdi, three_floats2
mov rsi, rsp
call scanf
; ------------------------------------------------------------------------  
;Block to validate the second string input                                                                                   
mov rdi, rsp                                                                                                         
call isfloat ;call isfloat 

cmp rax, 0 ;if rax == 0 then 
je invalid2 ;jump to invalid  
;convert to float
mov rax, 0                                                                                                            
mov rdi,rsp                                                                                                           
call atof
movsd xmm14, xmm0 ;xmm14 now holds string number 2
;-----------------------------------------------------------------------
;input the third string float 
sub rsp, 1024
mov rax, 0
mov rdi, three_floats3
mov rsi, rsp
call scanf
; ------------------------------------------------------------------------  
;Block to validate the third string input                                                                                   
mov rdi, rsp                                                                                                         
call isfloat ;call isfloat 

cmp rax, 0 ;if rax == 0 then 
je invalid3 ;jump to invalid  
;convert to float
mov rax, 0                                                                                                            
mov rdi,rsp                                                                                                           
call atof
movsd xmm13, xmm0 ;xmm13 now holds string number 3

jmp valid ;jumps to valid 


valid:
;print the formula               
mov rax, 3                     
mov rdi, output_formula      
movsd xmm0, xmm15 ;first string converted to float
movsd xmm1, xmm14 ;second string converted to float
movsd xmm2, xmm13 ;third string converted to float            
call printf

;convert -b
movsd xmm8, xmm15  ;this makes a copy of a
movsd xmm12, xmm14 ;this makes a copy of b 
mov r9, -1 
cvtsi2sd xmm11, r9 ;xmm11 now is -1
mulsd xmm11,xmm12  ;xmm11 = xmm11 * xmm12 (-b)
movsd xmm5, xmm11  ;copy of -b

;convert 2a
mov r11, 2  
cvtsi2sd xmm4, r11
mulsd xmm4, xmm8   ;2a

;do b^2-4ac 
mulsd xmm14, xmm14 ;b^2
mov r8, 4 
cvtsi2sd xmm10, r8 ;converts 4 to float and stores it in xmm10
mulsd xmm10, xmm15 ;4a
mulsd xmm10, xmm13 ;4ac
subsd xmm14, xmm10 ;b^2-4ac 
;movsd xmm9, xmm14  ;makes a copy of b^2-4ac

sqrtsd xmm9, xmm14 ;square root of b^2-4ac and stores it in xmm6
subsd xmm11, xmm9  ;-b - sqrt of b^2-4ac
divsd xmm11, xmm4  ;-b - sqrt of b^2-4ac / 2a

addsd xmm5, xmm9   ;-b + sqrt of b^2-4ac
divsd xmm5, xmm4   ;-b + sqrt of b^2-4ac / 2

;if xmm14 < 0 then call show no root
mov r10, 0
cvtsi2sd xmm7, r10
ucomisd xmm14, xmm7 ;comapares if b^2-4ac is negative if it is jumps to show_no_root
ja two_roots

je one_root

jmp no_root

one_root:
mov rax, 1
movsd xmm0, xmm11
call show_one_root
add rsp, 1024
add rsp, 1024
add rsp, 1024
jmp conclusion


no_root:
call show_no_root
add rsp, 1024
add rsp, 1024
add rsp, 1024
jmp conclusion

two_roots:                
mov rax, 2
movsd xmm0, xmm11
movsd xmm1, xmm5 
call show_two_root
add rsp, 1024
add rsp, 1024
add rsp, 1024

jmp conclusion

invalid:
;display invalid message
mov rax, 1 
mov rdi, invalid_input
call printf
add rsp, 1024

jmp conclusion

invalid2:
mov rax, 1
mov rdi, invalid_input
call printf
add rsp, 1024
add rsp, 1024

jmp conclusion

invalid3:
mov rax, 1
mov rdi, invalid_input
call printf
add rsp, 1024
add rsp, 1024
add rsp, 1024

jmp conclusion


; ------------------------------------------------------------------------
conclusion:
movsd xmm0, xmm11

;pop rax                         ; Remove extra push of -1 from stack.    

; Restores all registers to their original state.
popf                                                 
pop rbx                                                     
pop r15                                                     
pop r14                                                      
pop r13                                                      
pop r12                                                      
pop r11                                                     
pop r10                                                     
pop r9                                                      
pop r8                                                      
pop rcx                                                     
pop rdx                                                     
pop rsi                                                     
pop rdi                                                     
pop rbp

ret
