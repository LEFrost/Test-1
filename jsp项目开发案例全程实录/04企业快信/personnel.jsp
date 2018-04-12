<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.actionForm.PersonnelForm"%>
<%@ page import="java.util.*"%>

<html>
<%
List list=(List)request.getAttribute("personnelQuery");
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
        <td height="22" valign="top" class="word_orange">当前位置：名片夹管理 &gt; 员工管理 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><%
if(list==null || list.isEmpty()){
%>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="36" align="center">暂无员工信息！</td>
            </tr>
          </table>
          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="5%" align="right"><img src="Images/add.gif" width="19" height="18">&nbsp;</td>
    <td width="95%"><a href="#" onClick="window.open('manager_add.jsp','','width=292,height=175')">添加员工信息</a></td>
  </tr>
</table>
 <%
}else{
  //通过迭代方式显示数据
  Iterator it=list.iterator();
  int id=0;
  String name="";
  String sex="";
  String school="";
  String place="";
  String mobileTel="";
  String email="";
  %>
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="84%" align="right"><img src="Images/add.gif" width="19" height="18">&nbsp;</td>
<td width="16%">
      <a href="personnel_add.jsp">添加员工信息</a> </td>	  
  </tr>
</table>  
  <table width="91%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#54ABEF">
  <tr align="center" bgcolor="#e3F4F7">
    <td width="18%" height="26" bgcolor="#A8D8FC">员工姓名</td>
    <td width="5%" bgcolor="#A8D8FC">性别</td>
    <td width="18%" bgcolor="#A8D8FC">毕业学校</td>
    <td width="10%" bgcolor="#A8D8FC">职位</td>
    <td width="20%" bgcolor="#A8D8FC">手机</td>
    <td width="19%" bgcolor="#A8D8FC">邮箱</td>
    <td width="5%" bgcolor="#A8D8FC">修改</td>
    <td width="5%" bgcolor="#A8D8FC">删除</td>
  </tr>
<%
  while(it.hasNext()){
    PersonnelForm p=(PersonnelForm)it.next();
    id=p.getID();
	name=p.getName();
	sex=p.getSex();
	school=p.getSchool();
	place=p.getPlace();
	mobileTel=p.getMobileTel();
	email=p.getEmail();
	%> 
  <tr>
    <td style="padding:5px;"><%=name%></td>
    <td align="center"> <%=sex%></td>
    <td align="center"><%=school%></td>
    <td align="center"><%=place%></td>
    <td align="center"><%=mobileTel%></td>
    <td align="center"><%=email%></td>
    <td align="center"><a href="personnel.do?action=personnelModifyQ&id=<%=id%>">修改</a></td>
    <td align="center"><a href="personnel.do?action=personnelDel&id=<%=id%>">删除</a></td>
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
