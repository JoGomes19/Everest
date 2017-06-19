%{	
	
%}

%%

[ \t]			;
[+-]?[0-9]+      { yylval.vari=atoi(yytext); return(num);}

"." 		{ return '.'; }
";" 		{ return ';'; }
","			{ return ','; }
"="			{ return '='; }
"/"			{ return '/'; }
"+"			{ return '+'; }
"-"			{ return '-'; }
"*"			{ return '*'; }
")"			{ return ')'; }
"("			{ return '('; }
"{"			{ return '{'; }
"}"			{ return '}'; }
"<"			{ return '<'; }
">"			{ return '>'; }
"["			{ return '['; }
"]"			{ return ']'; }



(?i:VARS)  			{ return VARS;       }
(?i:ATRIBUICAO)  	{ return ATRIBUICAO; }
(?i:INICIO)  		{ return INICIO;     }
(?i:FIM)  			{ return FIM;        }
(?i:SE)  			{ return SE;         }
(?:OU)				{ return OU;         }
(?i:SENAO)  		{ return SENAO;      }
(?i:ENQUANTO)  		{ return ENQUANTO;   }
(?i:IMPRIME)  		{ return IMPRIME;    }
(?i:LER)  			{ return LER;        }
(?i:INT)  			{ return INT;        }
(?i:NOT)  			{ return NOT;        }


"/="		{ return DIF;          }
"=="		{ return IGUAL;        }
"&&"		{ return E;            }
"||"		{ return OU;           }
"<="		{ return MENOROUIGUAL; }
">="		{ return MAIOROUIGUAL; }
"*/"		{ return MOD;          }


L?\"(\\.|[^\\"])*\"		{ 
			  			 yylval.vars = strdup(yytext);
			  			 return string;
						}

[a-zA-Z_][a-zA-Z0-9_]*		{
			  yylval.vars = strdup(yytext); 
			  return id;
			}			


.			{return ERRO;}

.|\n		{;}

%%

int yywrap() 
{
	return 1;
}
