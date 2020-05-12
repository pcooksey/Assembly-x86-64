;;;
;;; This is Suggested Project 8.4.2.1
;;; Sum a list of numbers
;;; Pg. 152 for the problem
;;; Pg. 24 for Registers; Pg. 48 for Data Types

SECTION .data
SUCCESS:        equ 0   ; Default success value
SYS_EXIT:       equ 60  ; Default system exit value
        ;; Variables used by the project
List:           dd  2, 4, 6, 8, 10      ; List of numbers
Len:            dd  5                   ; Length of list
Sum:            dd  0                   ; Sum of list of numbers

SECTION .text           ; Code Section
global _start           ; Standard start
_start:
        mov     ecx, dword [Len]        ; Set length
        mov     eax, 0
loop:
        add     eax, dword [List + ((ecx - 1) * 4)]   ; Add list element
        loop    loop
        mov     dword [Sum], eax

; Done, terminate program
last:
        mov     rax, SYS_EXIT   ; Call code for exit
        mov     rdi, SUCCESS    ; Exit with success
        syscall
