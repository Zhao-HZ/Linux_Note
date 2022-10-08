file.txt
```
1. unix is great os. unix is opensource. unix is free os.
2. learn operating system.
3. unix linux which one you choose.
4. unix is easy to learn.unix is a multiuser os.Learn unix .unix is a powerful.
```
= represents for line number.
1. Line Number and Print
`sed -n "/unix/=" file.txt`
Outputs
```
1
3
4
```
`sed -n "/unix/{=;p}"`
it prints the line numbers and the corresponding contents
2. 