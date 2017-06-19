everest: lex.yy.c y.tab.c 
	gcc y.tab.c -o everest 

y.tab.c: everest.y 	
	yacc -d -v everest.y

lex.yy.c: everest.l
	flex everest.l
