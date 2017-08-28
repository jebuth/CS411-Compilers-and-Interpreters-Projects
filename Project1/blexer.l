%{
#include <stdio.h>
#include <string.h>
#include "bparser.tab.h"

%}


%%
"false" { printf("\n%s" , yytext); return FALSE;}
"true"  {printf("\n%s" , yytext); return TRUE;}
"bool"  {printf("\n%s" , yytext); return BOOL;}
"char"  {printf("\n%s" , yytext); return CHAR;}
"else"  {printf("\n%s" , yytext); return ELSE;}
"for"   {printf("\n%s" , yytext); return FOR;}
"if"  	{printf("\n%s" , yytext); return IF;}
"int"  	{printf("\n%s" , yytext); return INT;}
"printf" {printf("\n%s" , yytext); return PRINTF;}
"return" {printf("\n%s" , yytext); return RETURN;}
"string" {printf("\n%s" , yytext); return STRING;}
"void"  {printf("\n%s" , yytext); return VOID;}
"while" {printf("\n%s" , yytext); return WHILE;}
"+"  	{printf("\n%s" , yytext); return ADD;} 
"-"  	{printf("\n%s" , yytext);return SUB;} 
"*" 	{printf("\n%s" , yytext); return MUL;} 
"/"  	{printf("\n%s" , yytext); return DIV;} 
"%" 	{printf("\n%s" , yytext); return MOD;} 
"<" 	{printf("\n%s" , yytext); return LESS;} 
"<="    {printf("\n%s" , yytext); return LESSEQ;} 
">"     {printf("\n%s" , yytext); return GREATER;} 
">="    {printf("\n%s" , yytext); return GREATEREQ;} 
"=="    {printf("\n%s" , yytext); return EQUAL;} 
"!="    {printf("\n%s" , yytext); return NOTEQUAL;} 
"="  	{printf("\n%s" , yytext); return ASSIGN;} 
";"  	{printf("\n%s" , yytext); return SEMICOLON;} 
"," 	{printf("\n%s" , yytext); return COMMA;} 
"(" 	{printf("\n%s" , yytext); return LPAREN;} 
")" 	{printf("\n%s" , yytext); return RPAREN;} 
"{" 	{printf("\n%s" , yytext); return LBRACE;} 
"}"  	{printf("\n%s" , yytext); return RBRACE;} 

[\t ]    { }
0[xX][0-9a-fA-F]+      {printf("\n%s" , yytext); return INTCONSTANT;}
[a-zA-Z]+[_a-zA-Z0-9]* {printf("\n%s" , yytext); return ID;}
[0-9]+ 				 {printf("\n%s" , yytext); return INTCONSTANT;}
"//".*			{}
[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/] {}
\"([^\\\"]|\\.)*\"	 {printf("\n%s" , yytext); return STRINGCONSTANT;}


%%


