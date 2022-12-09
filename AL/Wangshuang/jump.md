# offset
取得标号的偏移地址
```
start:  mov ax, offset start ; mov ax, 0
    s:  mov ax, offset s     ; mov ax, 3
```
start和s是代码的标号, 偏移地址分别为0和3

# jmp
可以修改IP或者同时修改CS和IP

1. 依据位移进行转移的jmp指令
```
jmp short 标号
```
对IP修改的范围为-128-127, 该转移为短转移
, 最多跨越128bytes

e.g.
```
start:  mov ax, 0
        jmp short s
        add ax, 1
s:      inc ax
```
2. 转移的目的地址在指令中的jmp指令
`jmp far ptr 标号` 段间转移(远转移)
`(CS)=标号所在段的地址`
`(IP)=标号在段中的偏移地址`
位移为-128~127

`jmp near` 段内近转移
位移为-32768~32767

3. 转移地址在寄存器中的jmp指令
```
jmp 16-bit reg
```
`(IP) = (16-bit reg)`

4. 转移地址在内存中的jmp指令

(1) `jmp word ptr` 内存单元地址(段内转移)
e.g.
```
mov ax, 0123H
mov [bx], ax
jmp word ptr [bx]
```
执行后, (IP) = 0123H
(2) `jmp dword ptr` 内存单元地址(段间转移)
```
mov ax, 0123H
mov ds:[0], ax
mov word ptr ds:[2], 0
jmp dword ptr ds:[0]
```
执行后, (CS)=0, (IP)=0123H, CS:IP指向0000:0123

5. jcxz条件转移
jxxz都是短转移

