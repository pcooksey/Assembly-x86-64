;;;
;;; This is Suggested Project 7.9.2.4
;;; Basically do simple signed addition, subtraction, multiplication, modulo
;;; With signed word and double-word sizes
;;; Pg. 137 for the problem
;;; Pg. 24 for Registers
;;; Pg. 48 for Data Types


SECTION .data
SUCCESS:        equ 0   ; Default success value
SYS_EXIT:       equ 60  ; Default system exit value
        ;; Variables used by the project
wNum1:          dw -350
wNum2:          dw -300
wNum3:          dw -325
wNum4:          dw -500
dNum1:          dd -100000
        ;; Answers
wAns1:          dw 0    ; wAns1  = wNum1 + wNum2 -650
wAns2:          dw 0    ; wAns2  = wNum1 + wNum3 -675
wAns3:          dw 0    ; wAns3  = wNum3 + wNum4 -825
wAns6:          dw 0    ; wAns6  = wNum1 - wNum2 -50
wAns7:          dw 0    ; wAns7  = wNum1 - wNum3 -25
wAns8:          dw 0    ; wAns8  = wNum2 - wNum4 200
dAns11:         dd 0    ; dAns11 = wNum1 * wNum3 113750
dAns12:         dd 0    ; dAns12 = wNum2 * wNum2 90000
dAns13:         dd 0    ; dAns13 = wNum2 * wNum4 150000
wAns16:         dw 0    ; wAns16 = wNum1 / wNum2 1
wAns17:         dw 0    ; wAns17 = wNum3 / wNum4 0
wAns18:         dw 0    ; wAns18 = dNum1 / wNum4 200
wRem18:         dw 0    ; wRem18 = dNum1 % wNum4 0

SECTION .text           ; Code Section
global _start           ; Standard start
_start:
        ;; wAns1 = wNum1 + wNum2
        mov     ax, word [wNum1]
        add     ax, word [wNum2]
        mov     word [wAns1], ax
        ;; wAns2 = wNum1 + wNum3
        mov     ax, word [wNum1]
        add     ax, word [wNum3]
        mov     word [wAns2], ax
        ;; wAns3 = wNum3 + wNum4
        mov     ax, word [wNum3]
        add     ax, word [wNum4]
        mov     word [wAns3], ax
        ;; wAns6 = wNum1 - wNum2
        mov     ax, word [wNum1]
        sub     ax, word [wNum2]
        mov     word [wAns6], ax
        ;; wAns7 = wNum1 - wNum3
        mov     ax, word [wNum1]
        sub     ax, word [wNum3]
        mov     word [wAns7], ax
        ;; wAns8 = wNum2 - wNum4
        mov     ax, word [wNum2]
        sub     ax, word [wNum4]
        mov     word [wAns8], ax
        ;; wAns11 = wNum1 * wNum3
        mov     ax, word [wNum1]
        imul    word [wNum3]
        mov     word [dAns11], ax
        mov     word [dAns11+2], dx
        ;; wAns12 = wNum2 * wNum2
        mov     ax, word [wNum2]
        imul    ax
        mov     word [dAns12], ax
        mov     word [dAns12+2], dx
        ;; wAns13 = wNum2 * wNum4
        mov     ax, word [wNum2]
        imul    word [wNum4]
        mov     word [dAns13], ax
        mov     word [dAns13+2], dx
        ;; wAns16 = wNum1 / wNum2
        mov     ax, word [wNum1]
        cwd                             ; Pg. 91 Convert to dx:ax
        idiv    word [wNum2]
        mov     word [wAns16], ax
        ;; wAns17 = wNum3 / wNum4
        mov     ax, word [wNum3]
        cwd                             ; Pg. 91 Convert to dx:ax
        idiv    word [wNum4]
        mov     word [wAns17], ax
        ;; wAns18 = dNum1 / wNum4
        mov     eax, dword [dNum1]
        cdq                             ; Pg. 91 Convert dword to qword edx:eax
        movsx   ecx, word [wNum4]       ; Divisor has to be dword so convert
        idiv    ecx
        mov     word [wAns18], ax
        mov     word [wRem18], dx       ; Remember the remainder is stored in dx

; Done, terminate program
last:
        mov     rax, SYS_EXIT   ; Call code for exit
        mov     rdi, SUCCESS    ; Exit with success
        syscall
