;;;
;;; This is Suggested Project 7.9.2.7
;;; This is to find the sum of squares from 1 to N
;;; Pg. 138 for the problem
;;; Pg. 24 for Registers; Pg. 48 for Data Types
;;; Pg. 102 Multiple registers

SECTION .data
SUCCESS:        equ 0   ; Default success value
SYS_EXIT:       equ 60  ; Default system exit value
        ;; Variables used by the project
N:              equ 1000000 ; Sum of squares from 1 to N
SUM:            dq  0   ; Sum

SECTION .text           ; Code Section
global _start           ; Standard start
_start:
        ;; Sum of squares from 1 to N
        mov     rcx, N                  ; Puting N in rcx for loop command
        mov     rbx, 1                  ; Starting number is 1
sumOfSquares:
        mov     rax, rbx                ; i into rax
        mul     rax                     ; i * i
        add     qword [SUM], rax        ; sum += i^2
        inc     rbx                     ; i++
        loop    sumOfSquares            ; Loop until rcx is zero

; Done, terminate program
last:
        mov     rax, SYS_EXIT   ; Call code for exit
        mov     rdi, SUCCESS    ; Exit with success
        syscall
