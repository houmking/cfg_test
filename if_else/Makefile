if_else: flex2.l bison.y
	flex flex2.l
	bison -d bison.y
	cc -o $@ bison.tab.c lex.yy.c -lfl

.PHONY: clean
clean:
	rm bison.tab.*
	rm lex.yy.c
	rm if_else
