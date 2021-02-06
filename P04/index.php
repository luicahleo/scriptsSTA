<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head><title>Pagina de prueba</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head><body bgcolor="#CCCCCC"><p><strong><font size="5">
Servicios Telematicos</font></strong></p>
<p>&nbsp;</p>
<p align="justify">A continuaci&oacute;n se recogen algunos datos proporcionados 
  mediante variables PHP sobre la conexi&oacute;n realizada a esta p&aacute;gina:</p>
<div align="center"> 
  <table width="51%" border="1">
    <tr bgcolor="#999999"> 
      <td width="38%"> <div align="center"><strong>Variable</strong></div></td>
      <td width="62%"> <div align="center"><strong>Valor</strong></div></td>
    </tr>
    <tr> 
      <td><div align="center">SERVER_PROTOCOL</div></td>
      <td><div align="center"><?php echo getenv("SERVER_PROTOCOL"); ?></div></td>
    </tr>
    <tr> 
      <td><div align="center">HTTP_HOST</div></td>
      <td><div align="center"><?php echo getenv("HTTP_HOST"); ?> </div></td>
    </tr>
    <tr> 
      <td><div align="center">SERVER_ADDR</div></td>
      <td><div align="center"><?php echo getenv("SERVER_ADDR"); ?> </div></td>
    </tr>
    <tr> 
      <td><div align="center">SERVER_NAME</div></td>
      <td><div align="center"><?php echo getenv("SERVER_NAME"); ?> </div></td>
    </tr>
    <tr> 
      <td><div align="center">SERVER_PORT</div></td>
      <td><div align="center"><?php echo getenv("SERVER_PORT"); ?> </div></td>
    </tr>
    <tr> 
      <td><div align="center">HTTP_USER_AGENT</div></td>
      <td><div align="center"><?php echo getenv("HTTP_USER_AGENT"); ?> </div></td>
    </tr>
    <tr> 
      <td><div align="center"><strong><font color="#CC0000">REMOTE_ADDR</font></strong> (<font color="#009900">direcci&oacute;n IP origen de los paquetes</font> de solicitud HTTP <font color="#009900">recibidos en este servidor Web</font>) </div></td>
      <td><div align="center"><?php echo getenv("REMOTE_ADDR"); ?> </div></td>
    </tr>
    <tr> 
      <td><div align="center">REMOTE_PORT</div></td>
      <td><div align="center"><?php echo getenv("REMOTE_PORT"); ?> </div></td>
    </tr>
  </table>
  <p align="center">&nbsp;</p>
  <p align="justify">&nbsp;</p>
  <p align="justify"><font size="1">(C) Laboratorio de Telem&aacute;tica (LT)</font></p>
</div>
</table></body></html>
