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
<script language="javascript">
function checkform(myform){
	if(myform.name.value==""){
		alert("请输入员工姓名！");myform.name.focus();return false;
	}
	if(myform.birthday.value==""){
		alert("请输入出生日期！");myform.birthday.focus();return false;
	}
	if(CheckDate(myform.birthday.value)){
		alert("您输入的出生日期有误，请重新输入！");myform.birthday.focus();return false;
	}		
	if(myform.school.value==""){
		alert("请输入毕业学校！");myform.school.focus();return false;
	}
	if(myform.place.value==""){
		alert("请输入职位！");myform.place.focus();return false;
	}
	if(myform.mobileTel.value==""){
		alert("请输入手机号码！");myform.mobileTel.focus();return false;
	}
	if(!checkTel(myform.mobileTel.value)){
		alert("您输入的手机号码有误，请重新输入！");myform.mobileTel.focus();return false;
	}
	if(myform.email.value==""){
		alert("请输入邮箱！");myform.email.focus();return false;
	}
	if(!checkemail(myform.email.value)){
		alert("您输入的邮箱有误，请重新输入！");myform.email.focus();return false;
	}
	return true;		
}
</script>
</head>
<body>
<%@include file="navigation.jsp"%>
<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="510" valign="top" style="padding:5px;"><table width="98%" height="504"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="39" valign="top" class="word_orange">当前位置：名片夹管理 &gt; 员工管理 &gt; 修改员工信息 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><table width="68%"  border="0" cellpadding="0" cellspacing="0">
		<form name="form1" action="personnel.do?action=personnelModify" method="post" onSubmit="return checkform(form1)">
		<%if(list.size()==1){
		PersonnelForm p=(PersonnelForm)list.get(0);
		%>
            <tr>
              <td width="20%" height="27" align="center">员工姓名：</td>
              <td width="80%"><input name="name" type="text" id="name" value="<%=p.getName()%>" size="20">
                *
                  <input name="ID" type="hidden" id="ID" value="<%=p.getID()%>"></td>
            </tr>
            <tr>
              <td height="27" align="center">性&nbsp;&nbsp;&nbsp;别：</td>
              <td><input name="sex" type="radio" class="noborder" value="男" <%if(p.getSex().equals("男")){%> checked<%}%>>
                男
                <input name="sex" type="radio" class="noborder" value="女" <%if(p.getSex().equals("女")){%> checked<%}%>>
                女</td>
            </tr>
            <tr>
              <td height="27" align="center">出生日期：</td>
              <td><input name="birthday" type="text" id="birthday" value="<%=p.getBirthday()%>" size="20">
                （日期格式为：YYYY-MM-DD） </td>
            </tr>
            <tr>
              <td height="27" align="center">毕业学校：</td>
              <td><input name="school" type="text" id="school" value="<%=p.getSchool()%>" size="50">
                *</td>
            </tr>
            <tr>
              <td height="27" align="center">学&nbsp;&nbsp;&nbsp;&nbsp;历：</td>
              <td><input name="education" type="text" id="education" value="<%=p.getEducation()%>" size="20"></td>
            </tr>
            <tr>
              <td height="27" align="center">所学专业：</td>
              <td><input name="specialty" type="text" id="specialty" value="<%=p.getSpecialty()%>" size="30"></td>
            </tr>
            <tr>
              <td height="27" align="center">职&nbsp;&nbsp;&nbsp;&nbsp;位：</td>
              <td><input name="place" type="text" id="place" value="<%=p.getPlace()%>" size="50">
                *</td>
            </tr>
            <tr>
              <td height="27" align="center">手机号码：</td>
              <td><input name="mobileTel" type="text" id="mobileTel" value="<%=p.getMobileTel()%>" size="20">
                *</td>
            </tr>
            <tr>
              <td height="27" align="center">邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</td>
              <td><input name="email" type="text" id="email" value="<%=p.getEmail()%>" size="50">
                *</td>
            </tr>
			<%}else{%>
				<script language="javascript">
				window.location.href="personnel.do?action=personnelQuery";
				</script>
			<%}%>
            <tr>
              <td height="27" colspan="2" align="center"><input name="Submit" type="submit" class="btn_grey" value="提交">
                &nbsp;
                <input name="Submit2" type="reset" class="btn_grey" value="重置">
                &nbsp;
                <input name="Submit3" type="button" class="btn_grey" value="返回" onClick="window.location.href='personnel.do?action=personnelQuery';"></td>
              </tr>
			  </form>
          </table>
          </td>
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
