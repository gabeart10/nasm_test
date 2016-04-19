section .data
  msg: db "What is your name? ",10
  msgLen: equ $-msg
  hi: db "Hi ",10
  hiLen: equ $-hi
  
section .bss
  inp_buffer resb 256

section .text
  global _start

_start:
  mov eax,4
  mov ebx,1
  mov ecx,msg
  mov edx,msgLen
  int 80h

  mov eax,3
  mov ebx,0
  mov ecx, inp_buffer
  mov edx, 256
  int 80h
 
  push eax

  mov eax,4
  mov ebx,1
  mov ecx,hi
  add ecx,inp_buffer
  mov edx,hiLen
  int 80h

  mov eax,4
  mov ebx,1
  mov ecx, inp_buffer
  pop edx
  int 80h
  mov eax,1
  mov ebx,0
  int 80h
