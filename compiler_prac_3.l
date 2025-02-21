// Q-> Check the input is interger , decimal or non
%{
    #include <stdio.h>
    #include <stdlib.h>
%}

%%

-?[0-9]+                   { printf("'%s' is an INTEGER\n", yytext); }

-?[0-9]*\.[0-9]+([eE][-+]?[0-9]+)?  { printf("'%s' is a DOUBLE\n", yytext); }

[^0-9.\n\t-]+              { printf("'%s' is INVALID (Not a number)\n", yytext); }

[ \t\n]                    { /* Ignore spaces and newlines */ }

%%

int yywrap() {
    return 1;  // End of input
}

int main() {
    printf("Enter values to check (Ctrl+D to stop):\n");
    yylex();  // Start processing input
    return 0;
}

// how to run this file?

//1. open terminal
//2. lex file_name.lex       -> it will create a c file
//3. gcc lex.yy.c            -> run that c file
//4. ./a.out                 -> to get output of c file