%{
// $Id: zu_parser.y,v 1.33 2016/05/17 19:52:36 ist177983 Exp $
//-- don't change *any* of these: if you do, you'll break the compiler.
#include <cdk/compiler.h>
#include "ast/all.h"
#define LINE       compiler->scanner()->lineno()
#define yylex()    compiler->scanner()->scan()
#define yyerror(s) compiler->scanner()->error(s)
#define YYPARSE_PARAM_TYPE std::shared_ptr<cdk::compiler>
#define YYPARSE_PARAM      compiler
//-- don't change *any* of these --- END!
%}

%union {
  int                   i;	/* integer value */
  std::string           *s;	/* symbol name or string literal */
  double                d;  
  cdk::basic_node       *node;	/* node pointer */
  cdk::sequence_node    *sequence;
  cdk::expression_node  *expression; /* expression nodes */
  zu::lvalue_node       *lvalue;
  zu::block_node        *b;
  zu::declaration_node  *dc;
  basic_type            *t;
  zu::function_impl_node *f;
  zu::function_dec_node *fd;
  zu::function_call_node *fc;
};

%token <i> tINTEGER 
%token <s> tIDENTIFIER tSTRING
%token <d> tDOUBLE
%token tPRINTLN tREAD tBREAK tCONTINUE tRETURN tIF

%right '=' 
%left '|'
%left '&'
%nonassoc '~' 
%left tEQ tNE
%left tGE tLE '>' '<'   
%left '+' '-' 
%left '*' '/' '%' 
%nonassoc tUNARY tIF
%nonassoc '(' ':'



%type <node> stmt function 
%type <sequence> list exprs declBlock instrBlock vars startDecl startBlock  mexprs  args margs switch
%type <expression> expr 
%type <t> type void
%type <b> block
%type <dc> varDecl arg
%type <f> func
%type <lvalue> lval
%type <fd> functionDec
%type <fc> functionCall
%type <s> str

%{
//-- The rules below will be included in yyparse, the main parsing function.
%}
%%

function : startBlock                                     { compiler->ast(new cdk::sequence_node(LINE, $1)); }
	    ;
        

type :  '#'                                         { $$ = new basic_type(4, basic_type::TYPE_INT); }
        |'%'                                        { $$ = new basic_type(8, basic_type::TYPE_DOUBLE); }
        |'$'                                        { $$ = new basic_type(4, basic_type::TYPE_STRING); }
        |'<' type '>'                               { $$ = new basic_type(4, basic_type::TYPE_POINTER); ($$)->_subtype = $2;  }
        ;

block : '{' declBlock instrBlock '}'                   { $$ = new zu::block_node(LINE, $2, $3);}
        | '{' instrBlock '}'                           { $$ = new zu::block_node(LINE, $2, nullptr);}
        | '{' declBlock '}'                            { $$ = new zu::block_node(LINE, nullptr, $2);}
        | '{' '}'                                      { $$ = new zu::block_node(LINE, nullptr, nullptr);}
        ;

instrBlock : list                                      { $$ = $1; }
        ;

startBlock : startDecl                                       { $$ = $1; }   
           | startBlock startDecl                            { $$ = new cdk::sequence_node(LINE, $2, $1); } 
           ;

declBlock : varDecl ';'                                       { $$ = new cdk::sequence_node(LINE, $1); }
           | declBlock varDecl ';'                             { $$ = new cdk::sequence_node(LINE, $2, $1); } 
           ;              

startDecl : varDecl ';'                                { $$ = new cdk::sequence_node(LINE, $1); }
        | functionDec                                  { $$ = new cdk::sequence_node(LINE, $1); }
        | func                                         { $$ = new cdk::sequence_node(LINE, $1); } 
        ;

varDecl : type tIDENTIFIER '!' '=' expr                  { $$ = new zu::declaration_node(LINE, $1, new zu::identifier_node(LINE, $2), $5, false, true); }
        | type tIDENTIFIER '?' '=' expr                  { $$ = new zu::declaration_node(LINE, $1, new zu::identifier_node(LINE, $2), $5, true, false); }
        | type tIDENTIFIER '=' expr                      { $$ = new zu::declaration_node(LINE, $1, new zu::identifier_node(LINE, $2), $4, false, false); }
        | arg                                            { $$ = $1; }
        ;

args : margs                                          { $$ = $1; }
    |                                                   { $$ = new cdk::sequence_node(LINE, nullptr);}

margs: arg                                            { $$ = new cdk::sequence_node(LINE, $1); }
    | margs ',' arg                                  { $$ = new cdk::sequence_node(LINE, $3, $1); }              

arg : type tIDENTIFIER '!'                           { $$ = new zu::declaration_node(LINE, $1, new zu::identifier_node(LINE, $2), nullptr, false, true); }
    | type tIDENTIFIER '?'                           { $$ = new zu::declaration_node(LINE, $1, new zu::identifier_node(LINE, $2), nullptr, true, false); }
    | type tIDENTIFIER                               { $$ = new zu::declaration_node(LINE, $1, new zu::identifier_node(LINE, $2), nullptr, false, false); }
    ;



vars : varDecl                                     { $$ = new cdk::sequence_node(LINE, $1); }
       | vars ',' varDecl                          { $$ = new cdk::sequence_node(LINE, $3, $1); }              
       ;

list : stmt                                         { $$ = new cdk::sequence_node(LINE, $1); }
       | list stmt                                  { $$ = new cdk::sequence_node(LINE, $2, $1); }
       ;

stmt : expr ';'                                     { $$ = new zu::evaluation_node(LINE, $1); }
     | '[' switch ';' exprs ';' exprs ']' stmt       { $$ = new zu::for_node(LINE, $2, $4,$6, $8); }
     | '[' expr ']' '#' stmt                        { $$ = new zu::if_node(LINE, $2, $5); }
     | '[' expr ']' '?' stmt  %prec tIF             { $$ = new zu::if_else_node(LINE, $2, $5, new cdk::nil_node(LINE)); }
     | '[' expr ']' '?' stmt ':' stmt               { $$ = new zu::if_else_node(LINE, $2, $5, $7); }
     | tBREAK                                       { $$ = new zu::break_node(LINE); }
     | tCONTINUE                                    { $$ = new zu::cont_node(LINE); }
     | tRETURN                                      { $$ = new zu::ret_node(LINE); }
     | expr '!'                                     { $$ = new zu::print_node(LINE, $1, false); }
     | expr tPRINTLN                                { $$ = new zu::print_node(LINE, $1, true);}
     | '{' list '}'                                 { $$ = $2; } 
     ;
     
switch : mexprs                                      { $$ = $1; } 
        | vars                                       { $$ = $1; } 
        |                                            { $$ = new cdk::sequence_node(LINE, new cdk::nil_node(LINE));}
        ;   

exprs : mexprs                                      { $$ = $1; }
      |                                            { $$ = new cdk::sequence_node(LINE, new cdk::nil_node(LINE));}
      ;

mexprs : expr                                       { $$ = new cdk::sequence_node(LINE, $1);}
      | mexprs ',' expr                              { $$ = new cdk::sequence_node(LINE, $3, $1); }
      ;

func : type tIDENTIFIER '!' '(' args ')'  block                      { $$ = new zu::function_impl_node(LINE, $1, $2, $5, $7, true, false, nullptr); } 
     | type tIDENTIFIER '!' '(' args ')' '=' expr block              { $$ = new zu::function_impl_node(LINE, $1, $2, $5, $9, true, false, $8); } 
     | type tIDENTIFIER '(' args ')' block                           { $$ = new zu::function_impl_node(LINE, $1, $2, $4, $6, false, false, nullptr); }
     | type tIDENTIFIER '(' args ')' '=' expr block                  { $$ = new zu::function_impl_node(LINE, $1, $2, $4, $8, false, false, $7); } 
     | void tIDENTIFIER '!' '(' args ')'  block                      { $$ = new zu::function_impl_node(LINE, $1 ,$2, $5, $7, true, false, nullptr); } 
     | void tIDENTIFIER '!' '(' args ')' '=' expr block              { $$ = new zu::function_impl_node(LINE, $1, $2, $5, $9, true, false, $8); } 
     | void tIDENTIFIER '(' args ')' block                           { $$ = new zu::function_impl_node(LINE, $1, $2, $4, $6, false, false, nullptr); } 
     | void tIDENTIFIER '(' args ')' '=' expr block                  { $$ = new zu::function_impl_node(LINE, $1, $2, $4, $8, false, false, $7); } 
     ;

functionDec : type tIDENTIFIER '!' '(' args ')'                           { $$ = new zu::function_dec_node (LINE, $1, $2, $5, true, false);}
            | void tIDENTIFIER '!' '(' args ')'                           { $$ = new zu::function_dec_node (LINE, $1, $2, $5, true, false);}
            | type tIDENTIFIER '?' '(' args ')'                           { $$ = new zu::function_dec_node (LINE, $1, $2, $5, false, true);}
            | void tIDENTIFIER '?' '(' args ')'                           { $$ = new zu::function_dec_node (LINE, $1, $2, $5, false, true);}
            | type tIDENTIFIER '(' args ')'                               { $$ = new zu::function_dec_node (LINE, $1, $2, $4, false, false);}
            | void tIDENTIFIER '(' args ')'                               { $$ = new zu::function_dec_node (LINE, $1, $2, $4, false, false);}
            ;

functionCall: tIDENTIFIER '(' exprs ')'                          { $$ = new zu::function_call_node(LINE, $1, $3);}
            ;

void : '!'                                          { $$ = new basic_type(0, basic_type::TYPE_VOID); }
     ;


expr : tINTEGER                                     { $$ = new cdk::integer_node(LINE, $1); }
     | tDOUBLE                                      { $$ = new cdk::double_node(LINE, $1); }
     | str                                         { $$ = new cdk::string_node(LINE, $1); }
     | '-' expr %prec tUNARY                      { $$ = new cdk::neg_node(LINE, $2); }
     | '+' expr %prec tUNARY                      { $$ = new zu::identity_node(LINE, $2); }
     | expr '+' expr	                            { $$ = new cdk::add_node(LINE, $1, $3); }
     | expr '-' expr	                            { $$ = new cdk::sub_node(LINE, $1, $3); }
     | expr '*' expr	                            { $$ = new cdk::mul_node(LINE, $1, $3); }
     | expr '/' expr	                            { $$ = new cdk::div_node(LINE, $1, $3); }
     | expr '<' expr	                            { $$ = new cdk::lt_node(LINE, $1, $3); }
     | expr '>' expr	                            { $$ = new cdk::gt_node(LINE, $1, $3); }
     | expr tGE expr                              { $$ = new cdk::ge_node(LINE, $1, $3); }
     | expr '%' expr	                            { $$ = new cdk::mod_node(LINE, $1, $3); }
     | expr tLE expr                              { $$ = new cdk::le_node(LINE, $1, $3); }
     | expr tNE expr	                            { $$ = new cdk::ne_node(LINE, $1, $3); }
     | expr tEQ expr	                            { $$ = new cdk::eq_node(LINE, $1, $3); }
     | '(' expr ')'                             	{ $$ = $2; }
     | lval                                       { $$ = new zu::rvalue_node(LINE, $1); }  
     | lval '=' expr                              { $$ = new zu::assignment_node(LINE, $1, $3); }
     | expr '&' expr            	                { $$ = new zu::and_node(LINE, $1, $3); }
     | expr '|' expr                              { $$ = new zu::or_node(LINE, $1, $3); }
     | '~' expr                                   { $$ = new zu::not_node(LINE, $2); }
     | '@'                                        { $$ = new zu::read_node(LINE); }
     | functionCall                               { $$ = $1; }
     | '[' expr ']'                               { $$ = new zu::malloc_node(LINE, $2);}
     | lval '?'                                   { $$ = new zu::address_node(LINE, $1);}
     ;

str : tSTRING                                     { $$ = $1; }
    | str tSTRING                                 { $$ = new std::string(*$1+*$2); delete $1; delete $2; }
    ;

lval : tIDENTIFIER                                { $$ = new zu::identifier_node(LINE, $1); }
     | '(' expr ')'  '[' expr ']'                 { $$ = new zu::index_node(LINE, $2, $5); }
     | functionCall '[' expr ']'                  { $$ = new zu::index_node(LINE, $1, $3); }
     | lval '[' expr ']'                          { $$ = new zu::index_node(LINE, $1, $3); }
     | '[' expr ']' '[' expr ']'                  { $$ = new zu::index_node(LINE, $2, $5); }
     ;
%%