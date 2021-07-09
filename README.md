<h2 align="center">
  :penguin: Shell Script :penguin:
</h2>

## About Project

Its project has the objective of expanding my arcane powers in the shell script art :scroll:.

---------------------------------------------------------------------------------------
### String

| Comparison of strings  |  Description  |
| ------------------- | ------------------- |
|  string1 = string2 |  return true if strings are equals |
|  string1 != string2 |  return true if strings not is equals |
|  -n string1 |  return true if string not null |
|  -z string1 |  return true if string is null |
---------------------------------------------------------------------------------------

### Number

| Comparison of number  |  Description  |
| ------------------- | ------------------- |
|  expr1 -eq expr2 |  return true if values is equals |
|  expr1 -ne expr2 |  return true if values not is equals |
|  expr1 -gt expr2 |  return true if expr1 is greater of expr2 |
|  expr1 -ge expr2 |  return true if expr1 is greater or equals of expr2 |
|  expr1 -lt expr2 |  return true if expr1 is less of expr2 |
|  expr1 -le expr2 |  return true if expr1 is less or equals of expr2 |
|  ! expr1 |  negate result of expression (if result is true turn false) |
---------------------------------------------------------------------------------------

### Files

| Comparison of files  |  Description  |
| ------------------- | ------------------- |
|  -d file |  return if it is a directory |
|  -e file |  return true if it is file exist |
|  -f file |  return true if it is file exist (more used because it is more portable) |
|  -g file |  return true GID is enabled in file |
|  -r file |  return true if it is file have read permission |
|  -s file |  return true if it is file have bigger size different of zero |
|  -u | return true if UID is enabled file |
|  -w | return true if file have write permission |
|  -x | return true if file have execution permission |
