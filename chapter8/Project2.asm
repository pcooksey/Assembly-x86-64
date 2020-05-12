;;;
;;; This is Suggested Project 8.4.2.2
;;; Find the maximum, minimum, and average of list of numbers
;;; Pg. 153 for the problem
;;; Pg. 24 for Registers; Pg. 48 for Data Types

SECTION .data
SUCCESS:        equ 0   ; Default success value
SYS_EXIT:       equ 60  ; Default system exit value
        ;; Variables used by the project
List:           dd  2, 4, 6, 8, 10      ; List of numbers
Len:            equ 5                   ; Length of list
Avg:            dd  0                   ; Average
Min:            dd  -1                  ; Minimum
Max:            dd  0                   ; Maximum


SECTION .text           ; Code Section
global _start           ; Standard start
_start:
        mov     ecx, Len                              ; Set length
        mov     eax, 0
loop:
        mov     edx, dword [List + ((ecx - 1) * 4)]
        add     eax, edx   ; Add list element
        cmp     edx, dword [Min]
        ja      findmax                  ; edx > min; skip
        mov     dword [Min], edx
findmax:
        cmp     edx, dword [Max]
        jb      endLoop                  ; edx < max; skip
        mov     dword [Max], edx
endLoop:
        loop    loop
        mov     ecx, Len
        cdq                             ; Change to edx:eax to zero out edx
        div     ecx
        mov     dword [Avg], eax

; Done, terminate program
last:
        mov     rax, SYS_EXIT   ; Call code for exit
        mov     rdi, SUCCESS    ; Exit with success
        syscall
