%{
/* fichero instrucciones.y */
#include <stdio.h>
  extern int yylex();
  extern int yyparse();
  extern FILE *yyin;
 
  //void yyerror(const char *s);


%}

%token IDENTIFICADOR ASIG MAS CONSTENTERA NL PAR_A PAR_B
%token DECIMAL PRINT SCAN D_COM COMA PCOMA PORC LET COMM
%start instrucciones



%%
instrucciones : instrucciones instruccion 
              | instruccion
			  
			  
;

instruccion : IDENTIFICADOR ASIG expresion NL
			| PRINT PAR_A expresion PAR_B PCOMA NL
			| SCAN PAR_A expresion PAR_B PCOMA NL
			
			
		
;

expresion : termino
          | expresion MAS termino
		  | D_COM termino D_COM
		  | D_COM PORC termino D_COM COMA termino 

termino : IDENTIFICADOR termino
		| IDENTIFICADOR
        |  CONSTENTERA 
		|  DECIMAL 
		| LET
		
;

%%

yyerror (s) /* Llamada por yyparse ante un error */
  char *s;
{
printf ("%s\n", s); /* Esta implementación por defecto nos valdrá */
/* Si no creamos esta función, habrá que enlazar con –ly en el
momento de compilar para usar una implementación por defecto */
 printf ("\nIngrese Enter para salir: ");
getchar();
}

int main()
{
printf (" -- Bienvenidos al Laboratorio 4 de Diseno de Compiladores -- \n");
printf (" - Ejemplo de analizador lexico-sintactico con Flex/Bison - \n");
printf (" - Realizado por Jesus De Gracia y Daniel Gonzalez -\n");
printf ("Cadena admitida por el analizador para usarla de ejemplo valido: a1:=5+a2\n\n");
  //Acciones a ejecutar antes del análisis
  printf ("\n\nIngrese valores para analizar >>\n ");
  yyparse();
 
  //Acciones a ejecutar después del análisis

 }
