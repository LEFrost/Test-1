<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.actionForm.CustomerForm"%>
<%@ page import="java.util.*"%>

<html>
<%
List list=(List)request.getAttribute("customerQuery");
%>
<head>
<title>企业快信——短信+邮件</title>
<link href="CSS/style.css" rel="stylesheet">
</head>
<body>
<%@include file="navigation.jsp"%>
<table  width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="510" valign="top" style="padding:5px;"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="22" valign="top" class="word_orange">当前位置：名片夹管理 &gt; 客户管理 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><%
if(list==null || list.isEmpty()){
%>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="36" align="center">暂无客户信息！</td>
            </tr>
          </table>
          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="5%" align="right"><img src="Images/add.gif" width="19" height="18">&nbsp; </td>
    <td width="95%"><a href="customer_add.jsp">添加客户信息</a> </td>
    <td width="0%">
      <a href="#" onClick="window.open('manager_add.jsp','','width=292,height=175')"></a> </td>
  </tr>
</table>
 <%
}else{
  //通过迭代方式显示数据
  Iterator it=list.iterator();
  int id=0;
  String name="";
  String address="";
  String linkName="";
  String mobileTel="";
  String email="";
  %>
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="84%" align="right"><img src="Images/add.gif" width="19" height="18">&nbsp; </td>
<td width="16%">
      <a href="customer_add.jsp">添加客户信息</a> </td>	  
  </tr>
</table>  
  <table width="91%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#54ABEF">
  <tr align="center" bgcolor="#A8D8FC">
    <td width="27%">客户名称</td>
    <td width="16%">地址</td>
    <td width="8%">联系人</td>
    <td width="20%">手机</td>
    <td width="19%">邮箱</td>
    <td width="5%">修改</td>
    <td width="5%">删除</td>
  </tr>
<%
  while(it.hasNext()){
    CustomerForm c=(CustomerForm)it.next();
    id=c.getID();
	name=c.getName();
	address=c.getAddress();
	linkName=c.getLinkName();
	mobileTel=c.getMobileTel();
	email=c.getEmail();
	%> 
  <tr>
    <td style="padding:5px;"><%=name%></td>
    <td align="center"> <%=address%></td>
    <td align="center"><%=linkName%></td>
    <td align="center"><%=mobileTel%></td>
    <td align="center"><%=email%></td>
    <td align="center"><a href="customer.do?action=customerModifyQ&id=<%=id%>">修改</a></td>
    <td align="center"><a href="customer.do?action=customerDel&id=<%=id%>">删除</a></td>
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
