<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.actionForm.ShortInfoForm"%>
<%@ page import="java.util.*"%>

<html>
<%
List list=(List)request.getAttribute("shortInfoQuery");
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
        <td height="22" valign="top" class="word_orange">当前位置：信息库管理 &gt; 常用短语管理 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><%
if(list==null || list.isEmpty()){
%>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="36" align="center">暂无常用短语！</td>
            </tr>
          </table>
          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="5%" align="right"><img src="Images/add.gif" width="19" height="18">&nbsp;</td>
    <td width="95%"><a href="shortInfo.do?action=type">添加常用短语</a></td>
  </tr>
</table>
 <%
}else{
  //通过迭代方式显示数据
  Iterator it=list.iterator();
  int id=0;
  String type="";
  String content="";
  %>
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="84%" align="right">&nbsp;<img src="Images/add.gif" width="19" height="18">&nbsp; </td>
<td width="16%">
      <a href="shortInfo.do?action=type">添加常用短语</a> </td>	  
  </tr>
</table>  
  <table width="91%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#54ABEF">
  <tr align="center" bgcolor="#e3F4F7">
    <td width="19%" height="26" bgcolor="#A8D8FC">类别</td>
    <td width="71%" bgcolor="#A8D8FC">内容</td>
    <td width="5%" bgcolor="#A8D8FC">修改</td>
    <td width="5%" bgcolor="#A8D8FC">删除</td>
  </tr>
<%
  while(it.hasNext()){
    ShortInfoForm s=(ShortInfoForm)it.next();
    id=s.getID();
	type=s.getTypeName();
	content=s.getContent();
	%> 
  <tr>
    <td style="padding:5px;"><%=type%></td>
    <td style="padding:5px;"> <%=content%></td>
    <td align="center"><a href="shortInfo.do?action=shortInfoModifyQ&id=<%=id%>">修改</a></td>
    <td align="center"><a href="shortInfo.do?action=shortInfoDel&id=<%=id%>">删除</a></td>
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
