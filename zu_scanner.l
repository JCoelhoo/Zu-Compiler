%option c++ yyclass="zu_scanner" outfile="zu_scanner.cpp"
%option stack noyywrap yylineno 8bit c++
%{ 
/* $Id: zu_scanner.l,v 1.22 2016/05/19 19:34:05 ist177983 Exp $ */
// make relevant includes before including the parser's tab file
#include <string>
#include <cdk/ast/sequence_node.h>
#include <cdk/ast/expression_node.h>
#include "zu_scanner.h"
#include "zu_parser.tab.h"

// don't change this
#define yyerror LexerError
%}

SPACE   [ \t]
HEX		([0-9]|[a-fA-F])

%x X_STRING X_COMMENT X_IDENTIFIER X_POINTER_IDENTIFIER X_VOID  
%%
        { set_debug(1);} 
 
\"                     				yy_push_state(X_STRING); yylval.s = new std::string("");
<X_STRING>\\\"         				*yylval.s += yytext + 1;
<X_STRING>\\n         				*yylval.s += '\n';
<X_STRING>\\\\         				*yylval.s += '\\';
<X_STRING>\\t         				*yylval.s += '\t';
<X_STRING>\\r         				*yylval.s += '\r';
<X_STRING>\\{HEX}{HEX}      		*yylval.s += strtol(yytext+1, nullptr, 16);
<X_STRING>\\0						yy_push_state(X_VOID);
<X_STRING>\\{HEX}         			*yylval.s += strtol(yytext+1, nullptr, 16);
<X_STRING>\"           				yy_pop_state(); return tSTRING;
<X_STRING>.            				*yylval.s += yytext;
<X_STRING>\n           				yyerror("newline in string");

<X_VOID>\"         				 	yy_pop_state(); yy_pop_state(); return tSTRING;
<X_VOID>\\\"         				;
<X_VOID>.	         				;
<X_VOID>\n           				yyerror("newline in string");

"/*"								yy_push_state(X_COMMENT);
<X_COMMENT>"/*"						yy_push_state(X_COMMENT);
<X_COMMENT>"*/"						yy_pop_state();
<X_COMMENT>.|\n 					;

"//".*$                 ; /* ignore comments */

">="                    return tGE; 
"<="                    return tLE; 
"=="                    return tEQ; 
"!="                    return tNE; 
"!!"					return tPRINTLN;
"><"		       		return tBREAK;
"<>"		       		return tCONTINUE;
"!!!"		      		return tRETURN;




[A-Za-z_][A-Za-z0-9_]*  yylval.s = new std::string(yytext); return tIDENTIFIER;

"0x"([0-9]|[a-fA-F])+			yylval.i = strtol(yytext, nullptr, 16); return tINTEGER;

[1-9]+[0-9]*|"0"                	yylval.i = strtol(yytext, nullptr, 10); return tINTEGER;

([0-9]|([1-9][0-9]*))?\.([0-9]+([eE](-)?[0-9]+)?)			yylval.d = std::stod(yytext, nullptr); return tDOUBLE;
([0-9]|([1-9][0-9]*))+\.([0-9]+([eE](-)?[0-9]+)?)?			yylval.d = std::stod(yytext, nullptr); return tDOUBLE;



	


[-()<>=+*/%;{}#?$@|&~!\[\],:]       			return *yytext;

[ \t\n]+               				; /* ignore whitespace */

.                      				yyerror("Unknown character");

%%
// Very, very dirty hack: flex is a mess generating C++ scanners.
int zu_scanner::yywrap() { return 1; }