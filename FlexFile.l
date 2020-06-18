/*
fichero instrucciones.l
*/
%{
  #include <stdio.h>
  #include "y.tab.h" /* GENERADO AUTOMÁTICAMENTE POR BISON */
%}

separador ([ \t""])+
letra [a-zA-Z]
digito [0-9]
identificador {letra}({letra}|{digito})*
constEntera {digito}({digito})*

constDecimal {digito}({digito})*\.({digito})* 
imprimir 



%%
{separador} {/* omitir */};

{constEntera} {printf(" constante ");           return (CONSTENTERA);};
{constDecimal} {printf(" decimal ");           return (DECIMAL);};

":=" {printf(" asignacion ");                   return (ASIG);};
"+" {printf(" suma ");                          return (MAS);};

{identificador} {printf(" indentificador ");    return (IDENTIFICADOR);};

"(" {printf(" delim_a ");                       return (PAR_A);};
")" {printf(" delim_b ");                       return (PAR_B);};

\n {printf(" new_line\n");                      return (NL);};

.

%%

/*
[======[Nuevos requerimientos]======]
*agregar la opcion  printf.
*agregar la opcion  scanf
*agregar los numeros decimales. [check]

*agregar la opcion de imprimir cual es el error.
*comentarios / * * /

*/