default:
	bison -d bparser.y
	flex blexer.l
	gcc -o BParser lex.yy.c bparser.tab.c -lfl
	