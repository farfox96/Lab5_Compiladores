/*
fichero instrucciones.l
*/
%{
  #include <stdio.h>
  #include "y.tab.h" /* GENERADO AUTOMÁTICAMENTE POR BISON */
%}

separador ([ \t])+
letra [a-zA-Z]
digito [0-9]
identificador {letra}({letra}|{digito})*
constEntera {digito}({digito})*

constDecimal {digito}({digito})*\.({digito})* 
imprimir "printf"
leer "scanf"


%%
{separador} {/* omitir */};

{constEntera} {printf(" constante ");           return (CONSTENTERA);};
{constDecimal} {printf(" decimal ");            return (DECIMAL);};

":=" {printf(" asignacion ");                   return (ASIG);};
"+" {printf(" suma ");                          return (MAS);};

"," {printf(" coma ");                          return (COMA);};
";" {printf(" punto y coma ");                  return (PCOMA);};
{imprimir} {printf(" printf ");                 return (PRINT);};
{leer} {printf(" scanf ");                      return (SCAN);};

{identificador} {printf(" indentificador ");    return (IDENTIFICADOR);};

"(" {printf(" delim_a ");                       return (PAR_A);};
")" {printf(" delim_b ");                       return (PAR_B);};
"\"" {printf(" dob_comilla ");                  return (D_COM);}; 
\n {printf(" [EOL]]\n");                      return (NL);};


%%

/*
[======[Nuevos requerimientos]======]
*agregar la opcion  printf.
*agregar la opcion  scanf
*agregar los numeros decimales. [check]

*agregar la opcion de imprimir cual es el error.
*comentarios / * * /

*/