<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.actionForm.ManagerForm"%>
<%@ page import="java.util.*"%>

<html>
<%
List list=(List)request.getAttribute("managerQuery");
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
        <td height="22" valign="top" class="word_orange">当前位置：系统设置 &gt; 管理员设置 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><%
if(list==null || list.isEmpty()){
%>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="36" align="center">暂无管理员信息！</td>
            </tr>
          </table>
          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="4%" align="right"><img src="Images/add.gif" width="19" height="18">&nbsp;</td>
    <td width="96%"><a href="#" onClick="window.open('manager_add.jsp','','width=292,height=175')">添加管理员信息</a> </td>
  </tr>
</table>
          <%
}else{
  //通过迭代方式显示数据
  Iterator it=list.iterator();
  int id=0;
  String name="";
  String pwd="";
  String state="";
  %>
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="84%" align="right">&nbsp;<img src="Images/add.gif" width="19" height="18">&nbsp; </td>
<td width="16%">
      <a href="#" onClick="window.open('manager_add.jsp','','width=292,height=175')">添加管理员信息</a> </td>	  
  </tr>
</table>  
  <table width="91%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#54ABEF">
  <tr align="center" bgcolor="#A8D8FC">
    <td width="26%" height="26" bgcolor="#A8D8FC">管理员名称</td>
    <td width="12%" bgcolor="#A8D8FC">状态</td>
    <td width="8%" bgcolor="#A8D8FC">删除</td>
  </tr>
<%
  while(it.hasNext()){
    ManagerForm managerForm=(ManagerForm)it.next();
    id=managerForm.getID();
	name=managerForm.getName();
	pwd=managerForm.getPwd();
	state=managerForm.getState()==1?"超级管理员":"普通管理员";
	%> 
  <tr>
    <td style="padding:5px;"><%=name%></td>
    <td align="center"> <%=state%></td>
    <td align="center"><a href="manager.do?action=managerDel&id=<%=id%>">删除</a></td>
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
