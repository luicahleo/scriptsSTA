#include <stdio.h>
#include <stdlib.h>
int main(void)
{
 char *datos;
 long m,n;

 printf("Content-Type:text/html\n\n");
 printf("<html>\n<head>\n");
 printf("<title>Resultado de la multiplicacion</title>\n");
 printf("</head>\n<h1>Resultado de la multiplicacion:</h1>\n");
 
 printf("<body>\n");

 datos = getenv("QUERY_STRING");
 
 if(datos == NULL)
   printf("<p>Error pasando datos desde el formulario al prog. CGI</p>");
 
 else if(sscanf(datos, "m=%ld&n=%ld", &m, &n)!=2)
   printf("<p>Error: los datos deben ser numericos.</p>");
 
 else
   printf("<h3>El producto de %ld y %ld es %ld.</h3>", m, n, m*n);

 printf("</body>\n");
 printf("</html>\n");

 return 0;
}

