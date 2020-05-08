;;;
;;; This is Suggested Project 7.9.2.9
;;; Iteratively find the nth Fibonacci number
;;; Pg. 138 for the problem
;;; Pg. 24 for Registers; Pg. 48 for Data Types

SECTION .data
SUCCESS:        equ 0   ; Default success value
SYS_EXIT:       equ 60  ; Default system exit value
        ;; Variables used by the project
N:              equ 50      ; Nth number
Fib:            dq  0       ; Fibonacci number

SECTION .text           ; Code Section
global _start           ; Standard start
_start:
        mov     rcx, N - 1              ; Puting N in rcx for loop command
        mov     rax, 0                  ; Initialize to 0
        mov     rbx, 0                  ; Initialize to 0
        mov     rdx, 1                  ; Initialize to 1
        cmp     rdx, N                  ; Compare with N
        jb      loop                    ; If 1 < N then jump
        mov     rdx, N                  ; Set rdx to N (0 or 1)
        jmp     end                     ; Jump to end
loop:
        mov     rax, rbx
        mov     rbx, rdx
        add     rdx, rax
        loop    loop                    ; Loop until rcx is zero
end:
        mov     qword [Fib], rdx

; Done, terminate program
last:
        mov     rax, SYS_EXIT   ; Call code for exit
        mov     rdi, SUCCESS    ; Exit with success
        syscall
