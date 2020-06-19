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

%%
{separador} {/* omitir */};
{letra} {printf(" letra ");		   				return (LET);};
{constEntera} {printf(" constante ");		    return (CONSTENTERA);};
{constDecimal} {printf(" decimal "); 		    return (DECIMAL);};
":=" {printf(" asignacion "); 				    return (ASIG);};
"+" {printf(" suma ");							return (MAS);};
"," {printf(" coma ");                          return (COMA);};
";" {printf(" punto y coma ");                  return (PCOMA);};
"printf" {printf(" impresion ");                return (PRINT);};
"scanf" {printf(" lectura ");                   return (SCAN);};
{identificador} {printf(" indentificador ");    return (IDENTIFICADOR);};
"(" {printf(" delim_a "); 						return (PAR_A);};
")" {printf(" delim_b "); 						return (PAR_B);};
"%" {printf(" porciento "); 					return (PORC);};
"\"" {printf(" dob_comilla ");                  return (D_COM);}; 
\n {printf(" new_line\n"); 						return (NL);};
. ECHO;

%%