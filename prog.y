%{ 
    #include <stdio.h> 
    #include <stdlib.h>
    #include <string.h>
    #include "lex.yy.c" 
    
    int line_count = 0;
    int count = 0;

    void yyerror(char *str);
    void generate_new_var();
    int line_labler();
    
    char var[10];
    int else_ref = 0;
    int if_true_ref = 10;  
    int while_ref = 0;
    int while_false_ref = 0;
    FILE *outfile ; 
%} 

%token AND ASSIGN COLON DIV ELSE END EQ  GE GLOBAL GT IF LEFT_PAREN LE LT MINUS MOD MULT NE NOT OR PLUS PRINT READ RIGHT_PAREN SEMICOLON WHILE COMMA DEF DOT EXITLOOP FLOAT FORMAT FORM FUN INT LEFT_SQ_BKT NUL PRODUCT RETURN RETURNS RIGHT_SQ_BKT SKIP STEP STRING TO

%left PLUS MINUS
%left MULT DIV MOD
%left AND OR
%nonassoc NOT
%left LEFT_PAREN RIGHT_PAREN
%nonassoc IF
%nonassoc ELSE

%start S

%union
{ 	
	char val[100];
}
   
%type<val> exp relOP bExp
%token<val> ID INT_CONST


/* Rule Section */
%% 
S:          prog {}; 

prog :      GLOBAL stmtListO END { fprintf(outfile, " exit\n"); };

stmtListO:  stmtList {} 
            | {};
            
stmtList:   stmtList SEMICOLON stmt {}  
            | stmt {};
            
stmt:       assignmentStmt {}
            | readStmt {}
            | printStmt {}
            | ifStmt {}
            | whileStmt {};

assignmentStmt: ID ASSIGN exp { fprintf(outfile, " %s = %s\n", $1, $3); };

readStmt:   READ ID { 
                generate_new_var();
                fprintf(outfile, " %s = Read %s\n", var, $2); 
            };

printStmt:  PRINT ID { fprintf(outfile, " print %s\n", $2); };

ifStmt:     IF bExp {
  
              generate_new_var();
              else_ref = line_labler();
              fprintf(outfile, " %s = %s\n", var, $2);
              fprintf(outfile, " If ! (%s) goto L%d\n", var, else_ref);
              
            } 
            COLON stmtList elsePart END;

elsePart:   ELSE { 
  
              if_true_ref = line_labler();
              fprintf(outfile, " goto L%d\n", if_true_ref);
              fprintf(outfile, " L%d : ", else_ref);
              else_ref--;
               
            } stmtList { fprintf(outfile, " L%d : ", if_true_ref); }
            | { 
                fprintf(outfile, " L%d : ", else_ref); 
                else_ref--;
            };

whileStmt:  WHILE {
              
              while_ref = line_labler();
              fprintf(outfile, " L%d : ", while_ref);
  
            } bExp {
              
              while_false_ref = line_labler();
              fprintf(outfile, " If ! (%s) goto L%d\n", $3, while_false_ref); 
              
            } COLON stmtList {
              
              fprintf(outfile, " goto L%d\n", while_ref); 
              fprintf(outfile, " L%d : ", while_false_ref);
              while_false_ref-=2;
              while_ref-=2;
              
            }
            
            END;

bExp:       bExp OR bExp {
                generate_new_var();
                fprintf(outfile, " %s = %s or %s\n", var, $1, $3);
                strcpy($$, var);
            }
            | bExp AND bExp {
                generate_new_var();
                fprintf(outfile, " %s = %s and %s\n", var, $1, $3);
                strcpy($$, var);
            }
            | NOT bExp {
                generate_new_var();
                fprintf(outfile, " %s = !%s\n", var, $2);
                strcpy($$, var);
            }
            | LEFT_PAREN bExp RIGHT_PAREN {
                generate_new_var();
                fprintf(outfile, " %s = %s\n", var, $2);
                strcpy($$, var);
            }
            | exp relOP exp {
                generate_new_var();
                fprintf(outfile, " %s = %s %s %s\n", var, $1, $2, $3);
                strcpy($$, var);
            };

relOP:      EQ { strcpy($$, "=="); }
            | LE { strcpy($$, "<="); }
            | LT { strcpy($$, "<"); }
            | GE { strcpy($$, ">="); }
            | GT { strcpy($$, ">"); }
            | NE { strcpy($$, "!="); };

exp:        exp PLUS exp {
                generate_new_var();
                fprintf(outfile, " %s = %s + %s\n", var, $1, $3);
                strcpy($$, var);
            }
            | exp MINUS exp {
                generate_new_var();
                fprintf(outfile, " %s = %s - %s\n", var, $1, $3);
                strcpy($$, var);
            }
            | exp MULT exp {
                generate_new_var();
                fprintf(outfile, " %s = %s * %s\n", var, $1, $3);
                strcpy($$, var);
            }
            | exp DIV exp {
                generate_new_var();
                fprintf(outfile, " %s = %s / %s\n", var, $1, $3);
                strcpy($$, var);
            }
            | exp MOD exp {
                generate_new_var();
                fprintf(outfile, " %s = %s %% %s\n", var, $1, $3);
                strcpy($$, var);
            }
            | MINUS exp {
                generate_new_var();
                fprintf(outfile, " %s = -%s\n", var, $2);
                strcpy($$, var);
            }
            | PLUS exp {
                generate_new_var();
                fprintf(outfile, " %s = +%s\n", var, $2);
                strcpy($$, var);
            }
            | LEFT_PAREN exp RIGHT_PAREN {
                generate_new_var();
                fprintf(outfile, " %s = %s\n", var, $2);
                strcpy($$, var);
            }
            | ID {}
            | INT_CONST {};
%%


int main()
{
    extern FILE *yyin;
    yyin = fopen("input.txt", "r");
    if (yyin == NULL)
    {
        printf("error opening the file\n");
        return -1;
    }
    outfile = fopen("output.txt", "w");
    yyparse();
}

void yyerror(char *str)
{
    printf("error occured\n");
}

int line_labler()
{
    int res = line_count++;
    return res;
}
void generate_new_var()
{
    char res[10];
    sprintf(res, "t%d", count++);
    strcpy(var, res);
}

