section .data
  msg: db "Hello!",10
  msgLen: equ $-msg


section .text
  global _start

_start:
  pop eax
  pop ebx
  pop ebx
  cmp byte [ebx],0
  je exit
  cmp byte [ebx],'w'
  je runHello
  jmp exit

runHello:
  mov eax,4
  mov ebx,1
  mov ecx,msg
  mov edx,msgLen
  int 80h
  jmp exit
exit:
  mov eax,1
  mov ebx,0
  int 80h
