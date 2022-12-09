assume cs:codesg

codesg segment
start:  mov ax, 0
        call s        
        inc ax
s:      pop ax
        mov ax, 4c00h
        int 21
codesg ends

end start