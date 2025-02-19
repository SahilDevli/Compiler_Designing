%{
    #include <stdio.h>
    int line = 0, space = 0, tabs = 0, chars = 0;
%}

%%

\n      { line++; chars++; }
\t      { tabs++; chars++; }
[ ]     { space++; chars++; }
.       { chars++; }

%%

int main() {
    printf("Enter text (Ctrl+D to end input):\n");
    yylex();  // Call lexer
    printf("\nLines: %d\nSpaces: %d\nTabs: %d\nCharacters: %d\n", line, space, tabs, chars);
    return 0;
}

int yywrap() { return 1; }


// how to run this file?

//1. open terminal
//2. lex file_name.lex       -> it will create a c file
//3. gcc file_name.c         -> run that c file
//4. ./a.out                 -> to get output of c file