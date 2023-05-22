rm lex.yy.c
rm scompiler.tab.*
flex lcompiler.l
bison -d scompiler.y
gcc lex.yy.c scompiler.tab.c -lfl -o aplicacion.exe
