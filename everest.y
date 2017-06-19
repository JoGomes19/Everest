%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SIZE 1



int i;
int N = 0;
char** variaveis;
char *nome;  



void insereVar(char* newVar,char** variaveis);
int existe(char* var,char** variaveis);
char** criaArray();

%}

%union
{
  int vari;
  char *vars;
}

//Simbolos Terminais
%token ERRO
%token <vars> id string
%token <vari> num
%token IMPRIME LER
%token VARS INICIO FIM INT ATRIBUICAO
%token SENAO ENQUANTO SE FOR 
%token DIF MOD MAIOROUIGUAL MENOROUIGUAL IGUAL
%token E OU NOT

//Simbolo de Inicio 
%start Programa

%%

Programa        : declVariaveis atribuicao Corpo     
                ;

declVariaveis   : VARS Declaracao ';' //FIM{for(i=0; i < N; i++) {printf("Variavel \"%s\" declarada com sucesso\n",variaveis[i]);}}
                ;

Declaracao      : Declaracao ';' umaDeclaracao //{for(i=0; i < N; i++) {printf("Variavel \"%s\" declarada com sucesso\n",variaveis[i]);}}
                | umaDeclaracao //{for(i=0; i < N; i++) {printf("Variavel \"%s\" declarada com sucesso\n",variaveis[i]);}}
                ;

umaDeclaracao   : Type VarList 
                ;

Type            : INT
                ;

VarList         : VarList ',' Elem
                | Elem
                ;

Elem            : id  { if (!existe($1,variaveis)) insereVar($1,variaveis); }                           
                | id'['num']'          
                | id'['num']' '['num']'      
                ;

atribuicao      : ATRIBUICAO conjAtribuicoes ';'  // tem de ser obrigatoriamente a=1,b=2,c=qqcoisa ? nao pode ser a=1; enter b=1; ??
                ;

conjAtribuicoes : conjAtribuicoes ',' umaAtribuica 
                | umaAtribuica 
                ;

umaAtribuica    : id '=' num {if (existe($1,variaveis)==0) printf("variavel nao declarada\n");}
                ;

Corpo           : INICIO Instrucoes FIM    
                ;


Instrucoes      : Instrucoes Instrucao
                | Instrucao
                ;
   

Instrucao       : Ciclo 
                | Condicional
		| Assignment
                | IO';'
                ;


Ciclo          : ENQUANTO '('Logico')'  '{'Instrucoes'}'
               ;   


Logico          : Expressao DIF Expressao             
                | Expressao IGUAL Expressao           
                | Expressao MAIOROUIGUAL Expressao     //  o yacc entra em conflito com o >= por isso usamos  MAIOROUIGUAL  
                | Expressao MENOROUIGUAL Expressao     //  o yacc entra em conflito com o <= por isso usamos  MENOROUIGUAL 
                | Expressao '<' Expressao             
                | Expressao '>' Expressao             
                | Expressao
                ;

Condicional     : SE '(' Logico ')'  '{'Instrucoes'}'
                | OU '(' Logico ')'  '{'Instrucoes'}' // OU NAO DEVE SER USADO POR CAUSA DO OU DO LOGICO (?)
                | SENAO   '{'Instrucoes'}'
                ;

Assignment : id '=' Expressao    
           | id'['Expressao']' '=' Expressao
           | id'['Expressao']' '['Expressao']' '=' Expressao
           ;


IO : Output
   | Input
   ;

Output : IMPRIME Expressao      
       | IMPRIME string          
       ;

Input : LER id           
      | LER id'['Expressao']' 
      | LER id'['Expressao']' '['Expressao']' 
      ;

Expressao       : Expressao '+' Aritm      
                | Expressao '-' Aritm      
                | Expressao OU Aritm       
                | Aritm
                ;

Aritm            : Aritm '*' Simples                  
                | Aritm '/' Simples                  
                | Aritm MOD Simples                  
                | Aritm E Simples                  
                | Simples
                ;

Simples         : id {if (existe($1,variaveis)==0) printf("variavel nao declarada\n");}
                | id'['Expressao']'
                | id'['Expressao']' '['Expressao']'  
                | num                
                | '('Logico')'
                | NOT Logico          
                ;



%%

#include "lex.yy.c"


char** criaArray(){
  return malloc(SIZE * sizeof(char*));
}

int existe(char* var,char** variaveis){
  int i;
  for(i=0; i < N; i++)
    if (strcmp(variaveis[i],var)==0)
      return 1;
  return 0;
}

void insereVar(char* newVar,char** variaveis){
  if(N == SIZE)
    variaveis = (char**) realloc(variaveis,SIZE);
  variaveis[N] = (char*) malloc(sizeof(newVar));
  strcpy(variaveis[N], newVar);
  N++;
} 


int yyerror(char *s){
    printf("error %s\n",s);
}

int main(){
    variaveis = criaArray();
       printf("Start Everest:\n");
    yyparse();
       printf("End Everest\n");
    return 0;
}
