%{

#include <stdio.h>
#include <string.h>

%}

%token FALSE TRUE BOOL CHAR ELSE FOR IF INT PRINTF
%token RETURN STRING VOID WHILE 
%token LESS LESSEQ GREATER GREATEREQ EQUAL NOTEQUAL ASSIGN
%token SEMICOLON COMMA LPAREN RPAREN LBRACE RBRACE ID
%token INTCONSTANT STRINGCONSTANT BOOLCONSTANT

%left ADD SUB MUL DIV MOD
%left LESS LESSEQ GREATER GREATEREW EQUAL NOTEQUAL
%right ASSIGN ELSE
%nonassoc NOELSE

%start Program

%%

Program : Declist {printf(" reduce[1]");};

Declist : Declist Decl {printf(" reduce[2]");}
	| Decl {printf(" reduce[3]");};

Decl : VariableDecl {printf(" reduce[4]");}
	| FunctionDecl {printf(" reduce[5]");} ;

VariableDecl : Variable SEMICOLON {printf(" reduce[6]");};

Variable : Type ID {printf(" reduce[7]");};

Type : INT { printf(" reduce[8]");}
    | BOOL { printf(" reduce[9]");}
    | STRING { printf(" reduce[10]");}
    | CHAR { printf(" reduce[11]");};

FunctionDecl : Type ID LPAREN OptFormals RPAREN StmtBlock {printf(" reduce[12]");}
	| VOID ID LPAREN OptFormals RPAREN StmtBlock {printf(" reduce[13]");};

OptFormals : Formals {printf(" reduce[14]");}
	| {printf(" reduce[15]");};

Formals : Variable {printf(" reduce[16]");}
	| Formals COMMA Variable {printf(" reduce[17]");};

StmtBlock : LBRACE VariableDeclList StmtList RBRACE{printf(" reduce[18]");}
	| LBRACE StmtList RBRACE { printf(" reduce[19]"); }
	| LBRACE VariableDeclList RBRACE { printf(" reduce[20]"); }
	| LBRACE RBRACE { printf(" reduce[21]"); };

VariableDeclList : VariableDeclList VariableDecl { printf(" reduce[22]"); }
	| VariableDecl { printf(" reduce[23]"); };

StmtList : StmtList Stmt { printf(" reduce[24]"); }
	| Stmt { printf(" reduce[25]");};

Stmt : PrintStmt { printf(" reduce[26]"); }
	| SEMICOLON { printf(" reduce[27]"); }
	| Expr SEMICOLON { printf(" reduce[28]"); }
	| IfStmt { printf(" reduce[29]");}
	| WhileStmt { printf(" reduce[30]");}
	| ForStmt { printf(" reduce[31]");}
	| ReturnStmt { printf(" reduce[32]");}
	| StmtBlock { printf(" reduce[33]");};

IfStmt : IF LPAREN Expr RPAREN Stmt ELSE Stmt { printf(" reduce[34]"); }
	   | IF LPAREN Expr RPAREN Stmt NOELSE { printf(" reduce[35]"); };

WhileStmt : WHILE LPAREN Expr RPAREN Stmt {printf(" reduce[36]");};

ForStmt : FOR LPAREN SEMICOLON Expr SEMICOLON RPAREN Stmt { printf(" reduce[37]"); }
	| FOR LPAREN Expr SEMICOLON Expr SEMICOLON RPAREN Stmt { printf(" reduce[38]"); }
	| FOR LPAREN SEMICOLON Expr SEMICOLON Expr RPAREN Stmt { printf(" reduce[39]"); }
	| FOR LPAREN Expr SEMICOLON Expr SEMICOLON Expr RPAREN Stmt { printf(" reduce[40]"); }
	| FOR LPAREN Expr SEMICOLON SEMICOLON RPAREN Stmt { printf(" reduce[41]"); }
	| FOR LPAREN SEMICOLON SEMICOLON Expr RPAREN Stmt { printf(" reduce[42]"); }
	| FOR LPAREN SEMICOLON SEMICOLON RPAREN Stmt { printf(" reduce[43]"); }
	| FOR LPAREN Expr SEMICOLON SEMICOLON Expr RPAREN Stmt { printf(" reduce[44]"); } ;

ReturnStmt : RETURN SEMICOLON { printf(" reduce[45]"); }
	| RETURN Expr SEMICOLON { printf(" reduce[46]");};


PrintStmt : PRINTF LPAREN ExprList RPAREN SEMICOLON { printf(" reduce[47]");};

ExprList : ExprList COMMA Expr { printf(" reduce[48]"); }
	| Expr { printf(" reduce[49]"); };

Expr : ID ASSIGN Expr { printf(" reduce[50]"); }
	| Constant { printf(" reduce[51]"); }
	| ID{ printf(" reduce[52]"); }
	| Call { printf(" reduce[53]"); }
	| LPAREN Expr RPAREN { printf(" reduce[54] "); }
	| Expr ADD Expr { printf(" reduce[55]"); }
	| Expr SUB Expr { printf(" reduce[56]"); }
	| Expr MUL Expr { printf(" reduce[57]"); }
	| Expr DIV Expr { printf(" reduce[58]"); }
	| Expr MOD Expr { printf(" reduce[59]"); }
	| SUB Expr { printf(" reduce[60]"); }
	| Expr LESS Expr { printf(" reduce[61]"); }
	| Expr LESSEQ Expr { printf(" reduce[62]"); }
	| Expr GREATER Expr { printf(" reduce[63]"); }
	| Expr GREATEREQ Expr { printf(" reduce[64]"); }
	| Expr EQUAL Expr { printf(" reduce[65]"); }
	| Expr NOTEQUAL Expr { printf(" reduce[66]"); };


Call : ID LPAREN Actual RPAREN {printf(" reduce[67]");}
	| ID LPAREN RPAREN { printf(" [reduce 68] "); };

Actual : Expr { printf(" reduce[70]"); }
	| Actual COMMA Expr { printf(" reduce[71]");};

Constant : STRINGCONSTANT { printf(" reduce[72]"); }
	| INTCONSTANT { printf(" reduce[73]");}
	| BOOLCONSTANT { printf(" reduce[74]");}; 


%%

yyerror(char *s)
{
	printf("\n[Reject]");
}

int main(int argc, char **argv){
	yyparse();
 
}

