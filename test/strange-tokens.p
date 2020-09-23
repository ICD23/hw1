integers:
 
0
123
00
00123
0123
123456789012345678901234567890  too big for the compiler, but this is ok for the scanner.

floating point numbers:
0.
0.0  OK
000.
.000
0.000 OK
000.00
.123

scientific notations:
3.45E4
3.45E+4
3.45E-4
3.45E04
3.45E+04
3.45E-04

1.23e4
3.45e+4
3.45e-4
3.45e04
3.45e+04
3.45e-04

strings:
"abcde"
"abcd""efg" double quote in a string
"abc\ndef"  newline in a string.
"'" single quote in a string
"'" single quote in a string


comments:

// this is a comment
/* this is a comment */
/* this is wrong    //  hello hello    This is the same comment. */
// fdsfds */  fsdfds /* fdsfds */ fdsfdsfds

pragmas:  a pragma occupies a single line by itself, starting with "#pragma".

#pragmas profiling 27 59
