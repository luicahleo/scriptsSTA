<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML><BODY>
  
<H1>Laboratorio de software de comunicaciones</H1>
  <%! String cadena=" "; %>
  <% for( int i=1; i < 10; i++ ) {
       cadena = cadena +i;
     }
  %>
  <H3>Salida:</H3>
  <%= cadena %>
  <%= cadena="" %>
</BODY></HTML>
