<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.actionForm.ShortInfoForm"%>
<%@ page import="java.util.*"%>

<html>
<%
List list=(List)request.getAttribute("selectShortInfo");
%>
<head>
<title>企业快信——短信+邮件</title>
<link href="CSS/style.css" rel="stylesheet">
<script language="javascript">
	function selectInfo(info){
		window.returnValue=info;
		window.close();
	}
</script>
</head>
<body>
<table width="514" height="404" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="26" colspan="3" background="Images/selectS_top.gif">&nbsp;</td>
  </tr>
  <tr>
    <td width="3" background="Images/selectS_left.gif"></td>
    <td valign="top" bgcolor="#FFFFFF">
<%
if(list==null || list.isEmpty()){
%>
          <table width="100%" height="115"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="36" align="center">暂无常用短语！</td>
            </tr>
      </table>
 <%
}else{
  //通过迭代方式显示数据
  Iterator it=list.iterator();
  %>
<table width="99%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#D2E3E6" bgcolor="#FFFFFF">
<%
  while(it.hasNext()){
    ShortInfoForm s=(ShortInfoForm)it.next();
	%> 
  <tr>
    <td style="padding:5px;"><a href="#" onClick="selectInfo('<%=s.getContent()%>')"><%=s.getContent()%></a></td>
  </tr>
<%
  }
}
%>  
</table>	
	</td>
    <td width="3" background="Images/selectS_right.gif"></td>
  </tr>
  <tr>
    <td height="5" colspan="3" background="Images/selectS_bottom.gif"></td>
  </tr>
</table>
</body>
</html>
