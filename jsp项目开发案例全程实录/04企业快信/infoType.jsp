<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.actionForm.InfoTypeForm"%>
<%@ page import="java.util.*"%>

<html>
<%
List list=(List)request.getAttribute("infoTypeQuery");
%>
<head>
<title>企业快信——短信+邮件</title>
<link href="CSS/style.css" rel="stylesheet">
</head>
<body>
<%@include file="navigation.jsp"%>
<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="510" valign="top" style="padding:5px;"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="22" valign="top" class="word_orange">当前位置：信息库管理 &gt; 信息类别管理 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><%
if(list==null || list.isEmpty()){
%>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="36" align="center">暂无类别信息！</td>
            </tr>
          </table>
          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="5%" align="right"><img src="Images/add.gif" width="19" height="18">&nbsp;</td>
    <td width="95%"><a href="#" onClick="window.open('infoType_add.jsp','','width=292,height=175')">添加信息类别</a></td>
  </tr>
</table>
 <%
}else{
  //通过迭代方式显示数据
  Iterator it=list.iterator();
  int id=0;
  String name="";
  %>
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="84%" align="right"><img src="Images/add.gif" width="19" height="18">&nbsp; </td>
<td width="16%">
      <a href="#" onClick="window.open('infoType_add.jsp','','width=292,height=175')">添加信息类别</a> </td>	  
  </tr>
</table>  
  <table width="91%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#54ABEF">
  <tr align="center" bgcolor="#e3F4F7">
    <td width="26%" height="26" bgcolor="#A8D8FC">类别名称</td>
    <td width="8%" bgcolor="#A8D8FC">删除</td>
  </tr>
<%
  while(it.hasNext()){
    InfoTypeForm infoTypeForm=(InfoTypeForm)it.next();
    id=infoTypeForm.getID();
	name=infoTypeForm.getName();
	%> 
  <tr>
    <td style="padding:5px;"><%=name%></td>
    <td align="center"><a href="infoType.do?action=infoTypeDel&id=<%=id%>">删除</a></td>
  </tr>
<%
  }
}
%>  
</table></td>
      </tr>
    </table>
</td>
  </tr>
</table></td>
  </tr>
</table>
<%@ include file="copyright.jsp"%>
</body>
</html>
