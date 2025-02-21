// Q-> valid identifier for c language.

%{
    #include <stdio.h>
    #include <stdlib.h>
%}

%%

[a-zA-Z_][a-zA-Z0-9_]*    { printf("Identifier '%s' is valid\n", yytext); }

[0-9][a-zA-Z0-9_]*        { printf("Error: '%s' is NOT a valid identifier (Cannot start with a number)\n", yytext); }

[^a-zA-Z0-9_\n\t ]        { printf(" Error: '%s' contains invalid characters\n", yytext); }

[ \t\n]                   { /* Ignore spaces, tabs, and newlines */ }

%%

int yywrap() {
    return 1;  // End of input
}

int main() {
    printf("Enter identifiers to check (Ctrl+D to stop):\n");
    yylex();  // Calls the lexer to process input
    return 0;
}

// how to run this file?

//1. open terminal
//2. lex file_name.lex       -> it will create a c file
//3. gcc lex.yy.c            -> run that c file
//4. ./a.out                 -> to get output of c file
