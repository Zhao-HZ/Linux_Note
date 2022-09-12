## File Spacing
1. Insert one blank line after each line
`$sed G advance.txt`
2. Insert two blank lines
`sed 'G;G'advance.txt `
3. Delete blank lines and insert one blank line after each line
`sed '/^$/d;G' advance.txt`

Delete <u>all of the</u> blank lines
4. N Insert a black line above every line which matches "love" 
`sed '/love/{x;p;x;}' advance.txt`

5. Insert a blank line below every line which matches "love"

6. Insert 5 spaces to the left of every lines
`sed 's/^/     /' advance.txt`
## Numbering Lines

7. Number each line of a file(left alignment)
notice = is used to number the line and \t is used for tab between number and sentence 
`sed '/love/G' advance.txt`
## Delete the pattern matching line
`sed '/life/d' advance.txt`

8. Delete lines starting from n-th line and every 2-nd line from there
`sed '3~2d' advance.txt`


9. Delete the lines which matches the pattern and 2 lines after to that
`sed '/easy/,+2d' advance.txt`
### Output
```
Don't hesitate to ask for love & don't hesitate to show love too.
Life is too short to be shy.
In life, experience will help you differentiating right from wrong.
```

10. Delete blank lines
`sed '/^$/d' advance.txt`

11. Delete empty lines or those begins with "#"
`sed '/^#/d;/^$/d' a.txt`
## View/Print the files

12. `sed '2,3p' advance.txt` 
### Output
```
life isn't meant to be easy, life is meant to be lived.
Try to learn & understand something new everyday in life.
Try to learn & understand something new everyday in life.
Respect everyone & most important love everyone.
Respect everyone & most important love everyone.
Don't hesitate to ask for love & don't hesitate to show love too.
Life is too short to be shy.
In life, experience will help you differentiating right from wrong.
```
`sed -n '2,3p' advance.txt` 
### Output
```
Try to learn & understand something new everyday in life.
Respect everyone & most important love everyone.
```

13. Print n-th line of the file 
`sed -n '4'p advance.txt`

14. Print lines from x-th line to y-th line
`sed -n '4,6p' advance.txt`

15. Print only the last line 
### Syntax
`sed -n '$p' advance.txt`

16. Pattern Printing
`sed -n /everyone/p advance.txt`
Print from the line matching 'every' to the 5-th line
`sed -n /everyone/,5p advance.txt`
### Output
```
Respect everyone & most important love everyone.
Don't hesitate to ask for love & don't hesitate to show love too.
Life is too short to be shy.
```
17. Print the lines which matches the pattern up-to the next x-th lines
`sed -n '/everyone/,+5p' filename`
```
Respect everyone & most important love everyone.
Don't hesitate to ask for love & don't hesitate to show love too.
Life is too short to be shy.
In life, experience will help you differentiating right from wrong.
```