section .data:
  badger: db "Badger",10
  badgerLen: equ $-badger
  mushroom: db "Mushroom",10
  mushroomLen: equ $-mushroom
  timeval:
    tv_sec: dd 0
    tv_usec: dd 0

section .text:
  global _start

_start:
  mov eax,0
  jmp badgerLoop

badgerLoop:
  cmp eax,6
  je clear
  push eax
  mov eax,4
  mov ebx,1
  mov ecx,badger
  mov edx,badgerLen
  int 80h
  mov dword [tv_sec],1
  mov dword [tv_usec],0
  mov eax,162
  mov ebx,timeval
  mov ecx, 0
  int 80h
  pop eax
  add eax,1
  jmp badgerLoop

clear:
  mov eax,0
  jmp mushroomLoop

mushroomLoop:
  cmp eax,2
  je finish
  push eax
  mov eax,4
  mov ebx,1
  mov ecx,mushroom
  mov edx,mushroomLen
  int 80h
  mov dword [tv_sec],2
  mov dword [tv_usec],0
  mov eax,162
  mov ebx,timeval
  mov ecx,0
  int 80h
  pop eax
  add eax,1
  jmp mushroomLoop

finish:
  mov eax,1
  mov ebx,0
  int 80h
