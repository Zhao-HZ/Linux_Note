# and or
```
mov al, 01100011B
add al, 00111011B
```
执行后: al = 00100011B 
# 以字符形式给出数据
```
db 'unIX'
```
等价于
```
db 75H, 6EH, 49H, 58H
```
这些都是对应的ASCII编码
```
mov al, 'a'
```
相当于mov al, 61H
```
mov bl, 'b'
```
相当于mov al, 62H

字符大小写的转换
```
add al, 11011111b
;变成大写
or al, 00100000b
;变成小写
```
# SI和DI
si和di功能相近, <u>但是不能分成两个8位寄存器</u>
下面3组实现了相同的功能
1. 
```
mov bx, 0
mov ax, [bx] 
```
2. 
```
mov si, 0
mov ax, [si]
```
3. 
```
mov di, 0
mov ax, [di]
```
e.g.
用si和di实现将字符串'welcome to masm'复制到它后面的数据区中
```
assume cs:codesg, ds:datasg

datasg segment
        db 'welcome to masm'
        ; 15 characters 
        db '...............'
datasg ends

codesg segment
start:  mov ax, datasg
        mov ds, ax
        mov si, 0   ; si pointers to 'w' firstly
        mov di, 16  ; di pointers to the first '.' firstly
        mov cx, 8
s:      mov ax, [si]
        mov [di], ax 
        loop s

        mov ax, 4c00h
        int 21h
codesg ends
code start
```
可以用更少的代码吗?
```
assume cs:codesg, ds:datasg

datasg segment
        db 'welcome to masm'
        ; 15 characters 
        db '...............'
datasg ends

codesg segment
start:  mov ax, datasg
        mov ds, ax
        mov si, 0
        mov cs, 8
s:      mov ax, [si]
        mov 16[si], ax
        add si, 2
        loop s

        mov ax, 4c00h
        int 21h
codesg ends
```
[+]表示内存单元的总结
```
[bx+idata]
[bx+si] or [bx+di]
[bx+si+idata] or [bx+di+idata]
```
e.g. 将每一行的第四个字符改成大写
```
assume cs:codesg, ds:datasg

datasg segment
        ; each line contains 16 characters, it has 16 bytes.
        db '1. file         '
        db '2. edit         '
        db '3. search       '
        db '4. view         '
        db '5. options      '
        db '6. help         '
datasg ends

codesg segment
start:  mov ax, datasg
        mov ds, ax
        mov bx, 0
        mov cx, 6
s:      mov al, [bx+3]
        and al, 11011111b
        mov [bx+3], al
        add bx, 16
        loop s
codesg ends

end start
```
将datasg段中每个单词的前4个字母改为大写字母
```

```