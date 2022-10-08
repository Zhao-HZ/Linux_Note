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
## 大小写转换的问题

