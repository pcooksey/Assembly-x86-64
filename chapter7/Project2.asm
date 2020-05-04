;;;
;;; This is Suggested Project 7.9.2.2
;;; Basically do simple signed addition, subtraction, multiplication, modulo
;;; Pg. 136 for the problem
;;; Pg. 24 for Registers
;;; Pg. 48 for Data Types


SECTION .data
SUCCESS:        equ 0   ; Default success value
SYS_EXIT:       equ 60  ; Default system exit value
        ;; Variables used by the project
bNum1:          db -10
bNum2:          db -2
bNum3:          db -3
bNum4:          db -4
wNum1:          dw -305
        ;; Answers
bAns1:          db 0    ; bAns1 = bNum1 + bNum2  -12
bAns2:          db 0    ; bAns2 = bNum1 + bNum3  -13
bAns3:          db 0    ; bAns3 = bNum3 + bNum4  -7
bAns6:          db 0    ; bAns6 = bNum1 - bNum2  -8
bAns7:          db 0    ; bAns7 = bNum1 - bNum3  -7
bAns8:          db 0    ; bAns8 = bNum2 - bNum4  2
wAns11:         dw 0    ; wAns11 = bNum1 * bNum3 30
wAns12:         dw 0    ; wAns12 = bNum2 * bNum2 4
wAns13:         dw 0    ; wAns13 = bNum2 * bNum4 8
bAns16:         db 0    ; bAns16 = bNum1 / bNum2 5
bAns17:         db 0    ; bAns17 = bNum3 / bNum4 0
bAns18:         db 0    ; bAns18 = wNum1 / bNum4 76
bRem18:         db 0    ; bRem18 = wNum1 % bNum4 -1

SECTION .text           ; Code Section
global _start           ; Standard start
_start:
        ;; bAns1 = bNum1 + bNum2
        mov     al, byte [bNum1]
        add     al, byte [bNum2]
        mov     byte [bAns1], al
        ;; bAns2 = bNum1 + bNum3
        mov     al, byte [bNum1]
        add     al, byte [bNum3]
        mov     byte [bAns2], al
        ;; bAns3 = bNum3 + bNum4
        mov     al, byte [bNum3]
        add     al, byte [bNum4]
        mov     byte [bAns3], al
        ;; bAns6 = bNum1 - bNum2
        mov     al, byte [bNum1]
        sub     al, byte [bNum2]
        mov     byte [bAns6], al
        ;; bAns7 = bNum1 - bNum3
        mov     al, byte [bNum1]
        sub     al, byte [bNum3]
        mov     byte [bAns7], al
        ;; bAns8 = bNum2 - bNum4
        mov     al, byte [bNum2]
        sub     al, byte [bNum4]
        mov     byte [bAns8], al
        ;; wAns11 = bNum1 * bNum3
        mov     al, byte [bNum1]
        imul    byte [bNum3]
        mov     word [wAns11], ax
        ;; wAns12 = bNum2 * bNum2
        mov     al, byte [bNum2]
        imul    al
        mov     word [wAns12], ax
        ;; wAns13 = bNum2 * bNum4
        mov     al, byte [bNum2]
        imul    byte [bNum4]
        mov     word [wAns13], ax
        ;; bAns16 = bNum1 / bNum2       ; Pg 108 idiv
        movsx   ax, byte [bNum1]        ; Dividend/divisor (divident must be larger)
        idiv    byte [bNum2]
        mov     byte [bAns16], al
        ;; bAns17 = bNum3 / bNum4
        movsx   ax, byte [bNum3]
        idiv    byte [bNum4]
        mov     byte [bAns17], al
        ;; bAns18 = wNum1 / bNum4
        mov     ax, word [wNum1]
        idiv    byte [bNum4]
        mov     byte [bAns18], al
        ;; bRem18 = wNum1 % bNum4
        mov     ax, word [wNum1]
        idiv    byte [bNum4]
        mov     byte [bRem18], ah       ; Remember the remainder is stored in ah

; Done, terminate program
last:
        mov     rax, SYS_EXIT   ; Call code for exit
        mov     rdi, SUCCESS    ; Exit with success
        syscall
