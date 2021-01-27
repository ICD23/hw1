%{
/*
 * scanner.l
 *
 * lex input file for pascal scanner
 *
 */

#include <stdio.h>
#include <string.h>

#define PROGRAM      1
#define VAR          2
#define ARRAY        3
#define OF           4
#define INTEGER      5
#define REAL         6
#define STRING       7
#define FUNCTION     8
#define PROCEDURE    9
#define PBEGIN      10
#define END         11
#define IF          12
#define THEN        13
#define ELSE        14
#define WHILE       15
#define DO          16
#define NOT         17
#define AND         18
#define OR          19

#define LPAREN      20
#define RPAREN      21
#define SEMICOLON   22
#define DOT         23
#define COMMA       24
#define COLON       25
#define LBRACE      26
#define RBRACE      27
#define DOTDOT      28
#define ASSIGNMENT  29
#define ADDOP       20
#define SUBOP       21
#define MULOP       22
#define DIVOP       23
#define LTOP        24
#define GTOP        25
#define EQOP        26
#define GETOP       27
#define LETOP       28
#define NEQOP       29

#define IDENTIFIER  30
#define REALNUMBER  31
#define INTEGERNUM  32
#define SCIENTIFIC  33
#define LITERALSTR  34

#define YY_USER_ACTION     col_no += yyleng; // note this line

#define MAX_LINE_LENG      256
#define LIST       strcat(buffer, yytext)
#define LIST_FLUSH do{ if(opt_list) printf("%s", buffer); *buffer = 0; }while(0)
#define LOG(TYPE) do{ LIST; fprintf(stderr, "token(type:%-10s) on line %4d, %3d : %s\n", #TYPE, line_no, col_no - yyleng, yytext); } while(0)

int opt_list = 1;
int line_no = 1, col_no = 1;
char buffer[MAX_LINE_LENG];

%}

A [aA]
B [bB]
C [cC]
D [dD]
E [eE]
F [fF]
G [gG]
H [hH]
I [iI]
J [jJ]
K [kK]
L [lL]
M [mM]
N [nN]
O [oO]
P [pP]
Q [qQ]
R [rR]
S [sS]
T [tT]
U [uU]
V [vV]
W [wW]
X [xX]
Y [yY]
Z [zZ]

%%
                             /* v could do something */
{P}{R}{O}{G}{R}{A}{M}       {LOG(KEYWORD); return(PROGRAM);    }
{V}{A}{R}                   {LOG(KEYWORD); return(VAR);        }
{A}{R}{R}{A}{Y}             {LOG(KEYWORD); return(ARRAY);      }
{O}{F}                      {LOG(KEYWORD); return(OF);         }
{I}{N}{T}{E}{G}{E}{R}       {LOG(KEYWORD); return(INTEGER);    }
{R}{E}{A}{L}                {LOG(KEYWORD); return(REAL);       }
{S}{T}{R}{I}{N}{G}          {LOG(KEYWORD); return(STRING);     }
{F}{U}{N}{C}{T}{I}{O}{N}    {LOG(KEYWORD); return(FUNCTION);   }
{P}{R}{O}{C}{E}{D}{U}{R}{E} {LOG(KEYWORD); return(PROCEDURE);  }
{B}{E}{G}{I}{N}             {LOG(KEYWORD); return(PBEGIN);     }
{E}{N}{D}                   {LOG(KEYWORD); return(END);        }
{I}{F}                      {LOG(KEYWORD); return(IF);         }
{T}{H}{E}{N}                {LOG(KEYWORD); return(THEN);       }
{E}{L}{S}{E}                {LOG(KEYWORD); return(ELSE);       }
{W}{H}{I}{L}{E}             {LOG(KEYWORD); return(WHILE);      }
{D}{O}                      {LOG(KEYWORD); return(DO);         }
{N}{O}{T}                   {LOG(KEYWORD); return(NOT);        }
{A}{N}{D}                   {LOG(KEYWORD); return(AND);        }
{O}{R}                      {LOG(KEYWORD); return(OR);         }

"("                         {LOG(KEYWORD); return(LPAREN);     }
")"                         {LOG(KEYWORD); return(RPAREN);     }
";"                         {LOG(KEYWORD); return(SEMICOLON);  }
"."                         {LOG(KEYWORD); return(DOT);        }
","                         {LOG(KEYWORD); return(COMMA);      }
":"                         {LOG(KEYWORD); return(COLON);      }
"["                         {LOG(KEYWORD); return(LBRACE);     }
"]"                         {LOG(KEYWORD); return(RBRACE);     }
".."                        {LOG(KEYWORD); return(DOTDOT);     }
":="                        {LOG(KEYWORD); return(ASSIGNMENT); }
"+"                         {LOG(KEYWORD); return(ADDOP);      }
"-"                         {LOG(KEYWORD); return(SUBOP);      }
"*"                         {LOG(KEYWORD); return(MULOP);      }
"/"                         {LOG(KEYWORD); return(DIVOP);      }
">"                         {LOG(KEYWORD); return(GTOP);       }
"<"                         {LOG(KEYWORD); return(LTOP);       }
"="                         {LOG(KEYWORD); return(EQOP);       }
">="                        {LOG(KEYWORD); return(GETOP);      }
"<="                        {LOG(KEYWORD); return(LETOP);      }
"!="                        {LOG(KEYWORD); return(NEQOP);      }

  /* define identifier here */

  /* define INTEGERNUM, REALNUMBER, SCIENTIFIC here */

  /* define single/multiple line comment here */

  /* define string constant (LITERALSTR) here */

  /* define pragma here */

[ \t\f\r]    LIST;

\n {
  LIST;
  LIST_FLUSH;
  line_no++, col_no = 1;
}

.  { LIST; fprintf(stderr, "[ERROR] line %4d:%3d lexical analyzer error %s\n", line_no, col_no - yyleng, yytext); }

%%

int main(int argc, char** argv) {

  if (argc != 2)
    fprintf(stderr, "Usage: ./scanner [filename]\n"), exit(0);

  if(!(yyin = fopen(argv[1], "r")))
    fprintf(stderr, "Error: file \"%s\" open failed.\n", argv[1]), exit(1);

  int tok = 0;
  while(1) tok = yylex();
  // you can LOG(TYPE) in scanner rule directly, or handle tok here,
  // define some macros would be helpful, note the curly brackets in rule if needed.

  return 0;
}

int yywrap() { fclose(yyin), exit(0); }
