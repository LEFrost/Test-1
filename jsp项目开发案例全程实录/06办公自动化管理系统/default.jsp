<%@ page language="java" pageEncoding="gb2312"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html locale="true">
  <head>
    <html:base />
    
<title>ÍøÒ³Ö÷´°¿Ú</title>
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
    </head>
     <%@ include file="top.jsp"%>
<body>
 <table width="1003" border="0"  cellpadding="0" cellspacing="0" height="590">
  <tr>
    <td width="202" valign="bottom">
    <iframe src="left.jsp" width="100%" height="100%" frameborder="0" scrolling="auto" name="leftiframe">
    </iframe>
    </td>
    <td width="801" valign="top">
    <iframe src="main.jsp" width="100%" height="100%" frameborder="0"  scrolling="auto" name="mainFrame">
    </iframe>
    </td>
  </tr>
  <tr>
    <td height="17" valign="bottom" background="Images/left_bg_bottom.jpg"></td>
	<td height="17" valign="bottom" background="Images/main_bottom.jpg"></td>
  </tr>
</table>
</body>
</html:html>
