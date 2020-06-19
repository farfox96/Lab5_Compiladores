%{
/* fichero instrucciones.y */
#include <stdio.h>
  extern int yylex();
  extern int yyparse();
%}

%token IDENTIFICADOR ASIG MAS CONSTENTERA NL PAR_A PAR_B
%token DECIMAL PRINT SCAN D_COM COMM COMM_A COMM_B COMA PCOMA
%start instrucciones


%%
instrucciones: instrucciones instruccion 
              | instruccion
              | imprimir
;

instruccion: IDENTIFICADOR ASIG expresion NL
;

expresion: termino
          | expresion MAS termino
;

termino: IDENTIFICADOR
        | CONSTENTERA
        | DECIMAL
        | PAR_A expresion PAR_B

;


imprimir:   PAR_A D_COM IDENTIFICADOR D_COM PAR_B
          | 



;

%%

char *s;

void yyerror (s) /* Llamada por yyparse ante un error */
{
printf ("%s\n", s); /* Esta implementación por defecto nos valdrá */
/* Si no creamos esta función, habrá que enlazar con –ly en el
momento de compilar para usar una implementación por defecto */
}

int main()
{
printf (" -- Bienvenidos al Laboratorio 5 de Diseno de Compiladores -- \n");
printf (" - Ejemplo de analizador lexico-sintactico con Flex/Bison - \n");
printf (" - Realizado por Jesus De Gracia y Daniel Gonzalez -\n");
printf ("Cadena admitida por el analizador para usarla de ejemplo valido: a1:=5+a2\n\n");
  //Acciones a ejecutar antes del analisis
  printf ("\n\nIngrese valores para analizar >>\n ");
  yyparse();
 
  //Acciones a ejecutar después del analisis

 }
