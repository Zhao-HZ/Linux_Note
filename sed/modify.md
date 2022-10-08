The most common use of SED command in UNIX is for substitution or for find and replace. 

## Syntax

```
sed OPTIONS... [SCRIPT] [INPUTFILE...]
```

### Example

Consider the below text file as an input.
`$car > file.txt`

```
unix is great os. unix is opensource. unix is free os.
learn operating system.
unix linux which one you choose.
unix is easy to learn.unix is a multiuser os.Learn unix .unix is a powerful.
```

## 1. Replacing or Substituting String
   The below simple sed command replaces the word <u>"unix"</u> with <u>"linux"</u> in the file.
   `$sed 's/unix/linux/' file.txt`
   
   ### Output
   
   ```
   linux is great os. unix is opensource. unix is free os.
   learn operating system.
   linux linux which one you choose.
   linux is easy to learn.unix is a multiuser os.Learn unix .unix is a powerful.
   ```
   
   **However by default, the sed command replaces the first occurence of the pattern in each line and it won't replace the second, third...occurence in the line**

   ### supplement
   `sed 1,$s/unix/(&)/g` file.txt
   ```
    (unix) is great os. (unix) is opensource. (unix) is free os.
    learn operating system.
    (unix) linux which one you choose.
    (unix) is easy to learn.(unix) is a multiuser os.Learn (unix) .(unix) is a powerful.
   ```

## 2. Replacing the n-th occurrence of a pattern in a line
   `sed 's/unix/linux/2' file.txt`
   
   ### Output
   
   ```
   unix is great os. linux is opensource. unix is free os.
   learn operating system.
   unix linux which one you choose.
   unix is easy to learn.linux is a multiuser os.Learn unix .unix is a powerful.
   ```

## 3. Replacing all the occurence of the pattern in a line
   `$sed 's/unix/linux/g' file.txt`

## 4. Replacing from n-th occurrence to all occurences in a line
   `$sed 's/unix/linux/3g' file.txt`
   
   ```
   unix is great os. unix is opensource. linux is free os.
   learn operating system.
   unix linux which one you choose.
   unix is easy to learn.unix is a multiuser os.Learn linux .linux is a powerful.
   ```

## 5. `$ echo "Welcome To The Geek Stuff" | sed 's/\(\b[A-Z]\)/\(\1\)/g'`
   
   ### Output
   
   `(W)elcome (T)o (T)he (G)eek (S)tuff`

## 6. Replacing string on the specific line number
   `$sed '3 s/unix/linux/' file.txt` 
   
   ### Output
   
   ```
   unix is great os. unix is opensource. unix is free os.
   learn operating system.
   linux linux which one you choose.
   unix is easy to learn.unix is a multiuser os.Learn unix .unix is a powerful.
   ```

## 7. Duplicating the replaced line with /p flag
   <u>The /p print flag prints the replaced line twice on the terminal.If a line does not have the search pattern and is not replaced, then the /p prints that line only once</u>
   `$sed 's/unix/linux/p' file.txt`

### Output

```
linux is great os. unix is opensource. unix is free os.
linux is great os. unix is opensource. unix is free os.
learn operating system.
linux linux which one you choose.
linux linux which one you choose.
linux is easy to learn.unix is a multiuser os.Learn unix .unix is a powerful.
linux is easy to learn.unix is a multiuser os.Learn unix .unix is a powerful.
```

## 8. Printing only the replaced lines
   `$sed -n 's/unix/linux/p' file.txt`
   
   ### Output
   
   ```
   linux is great os. unix is opensource. unix is free os.
   linux linux which one you choose.
   linux is easy to learn.unix is a multiuser os.Learn unix .unix is a powerful.
   ```
## 9. Replacing string on a range of lines
   `$sed '1,3 s/unix/linux/' file.txt`
   
   ### Output
   
   ```
   linux is great os. unix is opensource. unix is free os.
   learn operating system.
   linux linux which one you choose.
   unix is easy to learn.unix is a multiuser os.Learn unix .unix is a powerful.
   ```
   
   Here is the sed command replaces the lines with range from 1 to 3
   Another example is
   `$sed '2,$ s/unix/linux/' file.txt`
   
   ### Output
   
   ```
   unix is great os. unix is opensource. unix is free os.
   learn operating system.
   linux linux which one you choose.
   linux is easy to learn.unix is a multiuser os.Learn unix .unix is a powerful
   ```
## 10. Deleting lines from a particular file
    
## Example
    
    `sed 'nd' filename.txt`
    `sed 'x, yd' filename.txt`
    `sed 'x, $d' filename.txt` 
    To delete from n-th to last line
## 11. To Delete pattern matching line
    
    ```
    $ sed '/pattern/d' filename.txt
    ```
test.txt
```
11
22
33
44
55
```
## 12. `sed '/44/,+1d' test.txt`
```
11
22
33
```
## 13. Insert 
### 1. `sed '1ahello' test.txt`
```
11
hello
22
33
44
55
```
### 2. `sed '/22/achina' test.txt` 
```
11
22
china
33
44
55
```
### 3. `sed '$afuck' test.txt`
```
11
22
33
44
55
fuck
```
### 4. `sed '3igood' test.txt`
```
11
22
good
33
44
55
```
## 12. `y`
### Syntax
```
y/inchars/outchars/
```
`sed 'y/123/789/2,g' test.txt`
```
77
88
99
44
55
```
