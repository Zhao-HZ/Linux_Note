assume cs:codesg

code segment
start:  
        
        mov ax, 4c00h
        int 21h

do0:
        mov ax, 4c00h
        int 21h
code ends
end start