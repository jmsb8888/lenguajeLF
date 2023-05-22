
%{
#include <stdio.h>
extern int yylex(void);
extern char *yytext;
void yyerror(char *s);
extern FILE *yyin;
%}

%token FLN ENT TXT DEC CON COM ND PR APC CPC ASI PYC DEV ACO CCO MEN MEI MAY MAI IGU NIG Y O INC MT SIK NOK SUM MUL RES DIV IT AT VTX
%%

lineas		:  
			| lineas dvariable
			| lineas ciclo FLN
			| lineas condicional FLN
			| lineas metodo FLN
			| lineas llamadometodo FLN
			| lineas excepcion FLN
			| lineas operacion FLN

ciclo 		: PR APC pbucle PYC condicion PYC incremento CPC ACO lineas CCO
			| MT APC condicion CPC ACO lineas CCO

condicional : SIK APC condicion CPC ACO lineas CCO 
			| SIK APC condicion CPC ACO lineas CCO NOK ACO lineas CCO

metodo 		: tdato VTX APC parametros CPC ACO lineas DEV VTX CCO
			| ND VTX APC parametros CPC ACO lineas CCO
			| tdato VTX APC CPC ACO lineas DEV VTX CCO
			| ND VTX APC CPC ACO lineas CCO
		
llamadometodo : VTX APC iparametros CPC
	        | VTX APC CPC	

parametros	: parametro 
			| parametros COM parametro

parametro 	: tdato VTX

iparametros : iparametro
	     	| iparametros COM iparametro

iparametro  : VTX

dvariable	: tdato VTX FLN 
			| tdato VTX ASI VTX FLN 

pbucle 		: tdato VTX ASI VTX 

excepcion	: IT ACO lineas CCO AT ACO lineas CCO 

operacion 	: VTX operadora VTX 

incremento	: VTX INC

condicion	: VTX operador VTX
			| VTX operador VTX conector VTX operador VTX

operadora 	: SUM	
			| RES
			| MUL
			| DIV

tdato		: ENT 
			| TXT
			| DEC
			| CON


operador    : MEN
			| MEI
			| MAY
			| MAI
			| IGU
			| NIG

conector	: Y 
			| O
%%

void yyerror(char *s){
	printf("Error Sintáctico: %s\n", s);
}

int main(int argc, char **argv){
	printf("Inicio del programa: \n");
	if(argc>1)
		yyin=fopen(argv[1],"rt");
	else
		yyin=stdin;
	yyparse();
return 0;
}
