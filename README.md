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

### Simple colors table

| color name  |  value  |
| ----------- | ------- |
| Color_Off | '\033[0m' |
| Black | '\033[0;30m'  |
| Red | '\033[0;31m'    |
| Green | '\033[0;32m'  |
| Yellow | '\033[0;33m' |
| Blue | '\033[0;34m'   |
| Purple | '\033[0;35m' |
| Cyan | '\033[0;36m'   |
| White | '\033[0;37m'  |
| BBlack | '\033[1;30m' |
| BRed | '\033[1;31m'   |
| BGreen | '\033[1;32m' |
| BYellow | '\033[1;33m'|
| BBlue | '\033[1;34m'  |
| BPurple | '\033[1;35m'|
| BCyan | '\033[1;36m'  |
| BWhite | '\033[1;37m' |
| UBlack | '\033[4;30m' |
| URed | '\033[4;31m'   |
| UGreen | '\033[4;32m' |
| UYellow | '\033[4;33m'|
| UBlue | '\033[4;34m'  |
| UPurple | '\033[4;35m'|
| UCyan | '\033[4;36m'  |
| UWhite | '\033[4;37m' |
| On_Black | '\033[40m' |
| On_Red | '\033[41m'   |
| On_Green | '\033[42m' |
| On_Yellow | '\033[43m'|
| On_Blue | '\033[44m'  |
| On_Purple | '\033[45m'|
| On_Cyan | '\033[46m'  |
| On_White | '\033[47m' |
| IBlack | '\033[0;90m' |
| IRed | '\033[0;91m'   |
| IGreen | '\033[0;92m' |
| IYellow | '\033[0;93m'|
| IBlue | '\033[0;94m'  |
| IPurple | '\033[0;95m'|
| ICyan | '\033[0;96m'  |
| IWhite | '\033[0;97m' |
| BIBlack | '\033[1;90m'|
| BIRed | '\033[1;91m'  |
| BIGreen | '\033[1;92m'|
| BIYellow | '\033[1;93m|
| BIBlue | '\033[1;94m' |
| BIPurple | '\033[1;95m|
| BICyan | '\033[1;96m' |
| BIWhite | '\033[1;97m'|
| On_IBlack | '\033[0;10|
| On_IRed | '\033[0;101m|
| On_IGreen | '\033[0;10|
| On_IYellow | '\033[0;1|
| On_IBlue | '\033[0;104|
| On_IPurple | '\033[0;1|
| On_ICyan | '\033[0;106|
| On_IWhite | '\033[0;10|

---------------------------------------------------------------------------------------

### Two types of operators

#### Control operators
| name  |  value  |
| ----------- | ------- |
| newline | (semicolon\|newline) command delimiter operator |
| \| | shell data processing - Pipe (command to command redirection) |
| & | Bash - ampresand (&) - (Asynchronous\|Parallel) control operator |
| && | Shell - && - AND boolean operator |
| \|\| | Shell - \|\| - OR boolean operator |
| ; | Shell - (semicolon\|newline) command delimiter operator |
| ( | Block definition |
| ) | Block definition |
