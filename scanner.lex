%{
	#include "parser.tab.hpp"
    #include "output.hpp"
	#include <iostream>
    #include <sstream>
    void invalidCharError();
%}

%option yylineno
%option noyywrap
digit            ([0-9])
letter           ([a-zA-Z])
whitespace		([\t\n\r ])
letterdigit      ([a-zA-Z0-9]) 

%%
void                                                                                return VOID;
int                                                                                 return INT;
byte                                                                                return BYTE;
b                                                                                   return B;
bool                                                                                return BOOL;
override                                                                            return OVERRIDE;    
and                                                                                 return AND;
or                                                                                  return OR;
not                                                                                 return NOT;
true                                                                                return TRUE;
false                                                                               return FALSE;
return                                                                              return RETURN;
if                                                                                  return IF;
else                                                                                return ELSE;
while                                                                               return WHILE;
break                                                                               return BREAK;
continue                                                                            return CONTINUE;
;                                                                                   return SC;
,                                                                                   return COMMA;
\(                                                                                  return LPAREN;
\)                                                                                  return RPAREN;
\{                                                                                  return LBRACE;
\}                                                                                  return RBRACE;
=                                                                                   return ASSIGN;
==|!=|<|>|<=|>=                                                                     return RELOP;
\+|\-                                                                               return SUBADD;
\*|\/                                                                               return DIVMULT;
{letter}{letterdigit}*                                                              return ID;
([1-9]+{digit}*)|0                                                                  return NUM;
\"([^\n\r\"\\]|\\[rnt"\\])+\"                                                       return STRING;
{whitespace}                                                                        ;
\/\/[^\r\n]*[\r|\n|\r\n]?                                                           ;
.                                                                                   {invalidCharError();}
%%

void invalidCharError(){
    output::errorLex(yylineno);
    exit(0);
}
