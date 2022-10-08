## e.g. 计算一下8个数据的和
```
0123h, 0456h, 0789h, 0abch, 0defh, 0fedh, 0cbah, 0987h 
```

```
assume cs:code

code segment
    dw 0123h, 0456h, 0789h, 0abch, 0defh, 0fedh, 0cbah, 0987h 
    ; to store 8 data
    mov bx, 0
    mov ax, 0

    mov cx, 8
s:  add ax, cs:[bx]
    add bx, 2
    loop s

    mov ax, 4c00h
    int 21h

code ends

end
```
| Addr | Data |
|---   | ---   |
|CS:0 | 0123H |
|CS:2 | 0456H |
|CS:4 | 0789H |
|CS:6| 0ABCH  |
|CS:8 | 0DEFH |
|CS:A | 0FEDH |
|CS:C | 0CBAH |
|CS:E | 0987H |
|CS:10| mov bx, 0 |
|CS:12| mov ax, 0 |
更好的写法
```
assume cs:code

code segment
        dw 0123h, 0456h, 0789h, 0abch, 0defh, 0fedh, 0cbah, 0987h 
        ; to store 8 data
start:  mov bx, 0           ; 程序从这里开始执行           
        mov ax, 0

        mov cx, 8
s:      add ax, cs:[bx]
        add bx, 2
        loop s

        mov ax, 4c00h
        int 21h

code ends

end start                   ;指明程序的入口 
```
## 将数据 代码 栈放入不同的段
```
assume cs:code, ds:data, ss:stack

data segment
        dw 0123h, 0456h, 0789h, 0abch, 0defh, 0fedh, 0cbah, 0987h 
data ends

stack segment
        dw 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   
stack ends

code segment
start:  mov ax, stack
        mov ss, ax
        mov sp, 20h
        mov ax, data
        mov ds, ax
        mov bx, 0
        
        mov cx, 8
s:      push [bx]
        add bx, 2
        loop s

        mov bx, 0

        mov cx, 8
s0:     pop [bx]
        add bx, 2
        loop s0
        
        mov ax, 4c00h
        int 21h
code ends   
```
`data`段中的数据`0abch`的地址是data:6, 要将它送入bx中, 就要用如下的代码
```
mov ax, data
mov ds, ax
mov bx, ds:[6]
```
不能用下面的指令
```
mov ds, data    ;8086不允许将一个数据送入ds中
mov bx, ds:[6]
```
