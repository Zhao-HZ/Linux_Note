# 栈机制
## 入栈和出栈的指令
```
POP(入栈)        
PUSH(出栈)
```

<img src="stack.png"></img>
```
mov ax, 0123H
push ax
mov bx, 2266H
push bx
mov cx, 1122H
push cx
pop ax
pop bx
pop cx
```
在8086中, SS:SP指向栈顶元素