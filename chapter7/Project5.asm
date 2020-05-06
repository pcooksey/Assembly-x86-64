;;;
;;; This is Suggested Project 7.9.2.5
;;; Basically do simple signed addition, subtraction, multiplication, modulo
;;; With unsigned double-word and quad-word sizes
;;; Pg. 137 for the problem
;;; Pg. 24 for Registers
;;; Pg. 48 for Data Types


SECTION .data
SUCCESS:        equ 0   ; Default success value
SYS_EXIT:       equ 60  ; Default system exit value
        ;; Variables used by the project
dNum1:          dd 900000
dNum2:          dd 350000
dNum3:          dd 450000
dNum4:          dd 750000
qNum1:          dq 700000000000000
        ;; Answers
dAns1:          dd 0    ; dAns1  = dNum1 + dNum2 1250000
dAns2:          dd 0    ; dAns2  = dNum1 + dNum3 1350000
dAns3:          dd 0    ; dAns3  = dNum3 + dNum4 1200000
dAns6:          dd 0    ; dAns6  = dNum1 - dNum2 550000
dAns7:          dd 0    ; dAns7  = dNum1 - dNum3 450000
dAns8:          dd 0    ; dAns8  = dNum2 - dNum4 -400000 => 4294567296
qAns11:         dq 0    ; qAns11 = dNum1 * dNum3 405000000000
qAns12:         dq 0    ; qAns12 = dNum2 * dNum2 122500000000
qAns13:         dq 0    ; qAns13 = dNum2 * dNum4 262500000000
dAns16:         dd 0    ; dAns16 = dNum1 / dNum2 2
dAns17:         dd 0    ; dAns17 = dNum3 / dNum4 0
dAns18:         dd 0    ; dAns18 = qNum1 / dNum4 933333333
dRem18:         dd 0    ; dRem18 = qNum1 % dNum4 250000

SECTION .text           ; Code Section
global _start           ; Standard start
_start:
        ;; dAns1 = dNum1 + dNum2
        mov     eax, dword [dNum1]
        add     eax, dword [dNum2]
        mov     dword [dAns1], eax
        ;; dAns2 = dNum1 + dNum3
        mov     eax, dword [dNum1]
        add     eax, dword [dNum3]
        mov     dword [dAns2], eax
        ;; dAns3 = dNum3 + dNum4
        mov     eax, dword [dNum3]
        add     eax, dword [dNum4]
        mov     dword [dAns3], eax
        ;; dAns6 = dNum1 - dNum2
        mov     eax, dword [dNum1]
        sub     eax, dword [dNum2]
        mov     dword [dAns6], eax
        ;; dAns7 = dNum1 - dNum3
        mov     eax, dword [dNum1]
        sub     eax, dword [dNum3]
        mov     dword [dAns7], eax
        ;; dAns8 = dNum2 - dNum4
        mov     eax, dword [dNum2]
        sub     eax, dword [dNum4]
        mov     dword [dAns8], eax
        ;; dAns11 = dNum1 * dNum3
        mov     eax, dword [dNum1]
        mul     dword [dNum3]           ; Pg. 102 multi tables
        mov     dword [qAns11], eax
        mov     dword [qAns11+4], edx
        ;; dAns12 = dNum2 * dNum2
        mov     eax, dword [dNum2]
        mul     eax
        mov     dword [qAns12], eax
        mov     dword [qAns12+4], edx
        ;; dAns13 = dNum2 * dNum4
        mov     eax, dword [dNum2]
        mul     dword [dNum4]
        mov     dword [qAns13], eax
        mov     dword [qAns13+4], edx
        ;; dAns16 = dNum1 / dNum2
        mov     eax, dword [dNum1]
        cdq
        div     dword [dNum2]           ; Pg. 110 Divide tables
        mov     dword [dAns16], eax
        ;; dAns17 = dNum3 / dNum4
        mov     eax, dword [dNum3]
        cdq
        div     dword [dNum4]
        mov     dword [dAns17], eax
        ;; dAns18 = qNum1 / dNum4
        mov     rax, qword [qNum1]
        cqo                             ; Pg. 91 Convert qword to qword rdx:rax
        mov     ecx, dword [dNum4]      ; Divisor has to be qword so convert
        div     rcx
        mov     dword [dAns18], eax
        mov     dword [dRem18], edx     ; Remember the remainder is stored in dx

; Done, terminate program
last:
        mov     rax, SYS_EXIT   ; Call code for exit
        mov     rdi, SUCCESS    ; Exit with success
        syscall
