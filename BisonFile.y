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


imprimir:   PAR_A IDENTIFICADOR PAR_B
          | PAR_A IDENTIFICADOR PAR_B



;

%%

char *s;

void yyerror (s) /* Llamada por yyparse ante un error */
{
printf ("%s\n", s); /* Esta implementación por defecto nos valdrá */
/* Si no creamos esta función, habrá que enlazar con –ly en el
momento de compilar para usar una implementación por defecto */
}

int main(void){
  //Acciones a ejecutar antes del análisis
 yyparse();
  //Acciones a ejecutar después del análisis
  return 0;
}
