/*
fichero instrucciones.l
*/
%{
  #include <stdio.h>
  //#include "y.tab.h" /* GENERADO AUTOMÁTICAMENTE POR BISON */
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

{constEntera} {printf(" constante ");           };
{constDecimal} {printf(" decimal ");            };

":=" {printf(" asignacion ");                   };
"+" {printf(" suma ");                          };

"," {printf(" coma ");                          };
";" {printf(" punto y coma ");                  };
{imprimir} {printf(" printf ");                 };
{leer} {printf(" scanf ");                      };

{identificador} {printf(" indentificador ");    };

"(" {printf(" delim_a ");                       };
")" {printf(" delim_b ");                       };
"\"" {printf(" dob_comilla ");                  }; 
\n {printf(" [EOL]1\n");                      };




%%

/*
[======[Nuevos requerimientos]======]
*agregar la opcion  printf.
*agregar la opcion  scanf
*agregar los numeros decimales. [check]
*agregar la opcion de imprimir cual es el error.
*comentarios / * * /

Execution:
  flex FlexSingle.l && gcc lex.yy.c -lfl -o Lab5a && Lab5a.exe
*/