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
<script language="javascript">
function checkform(myform){
	if(myform.name.value==""){
		alert("请输入客户全称！");myform.name.focus();return false;
	}
	if(myform.address.value==""){
		alert("请输入地址！");myform.address.focus();return false;
	}
	if(myform.postcode.value==""){
		alert("请输入邮政编码！");myform.postcode.focus();return false;
	}
	if(myform.linkName.value==""){
		alert("请输入联系人！");myform.linkName.focus();return false;
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
<table  width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="510" valign="top" style="padding:5px;"><table width="98%" height="504"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="39" valign="top" class="word_orange">当前位置：名片夹管理 &gt; 客户管理 &gt; 修改客户信息 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><table width="68%"  border="0" cellpadding="0" cellspacing="0">
		<form name="form1" action="customer.do?action=customerModify" method="post" onSubmit="return checkform(form1)">
		<%if(list.size()==1){
		CustomerForm c=(CustomerForm)list.get(0);
		%>
            <tr>
              <td width="20%" height="27" align="center">客户全称：</td>
              <td width="80%"><input name="name" type="text" id="name" value="<%=c.getName()%>" size="50">
                *
                  <input name="ID" type="hidden" id="ID" value="<%=c.getID()%>"></td>
            </tr>
            <tr>
              <td height="27" align="center">所在区域：</td>
              <td><input name="area" type="text" id="area" size="30"  value="<%=c.getArea()%>"></td>
            </tr>
            <tr>
              <td height="27" align="center">地&nbsp;&nbsp;&nbsp;&nbsp;址：</td>
              <td><input name="address" type="text" id="address" size="60"  value="<%=c.getAddress()%>">
                *</td>
            </tr>
            <tr>
              <td height="27" align="center">邮箱编码：</td>
              <td><input name="postcode" type="text" id="postcode" size="6"  value="<%=c.getPostcode()%>">
                *</td>
            </tr>
            <tr>
              <td height="27" align="center">联 系 人：</td>
              <td><input name="linkName" type="text" id="linkName" size="20"  value="<%=c.getLinkName()%>">
                *</td>
            </tr>
            <tr>
              <td height="27" align="center">手&nbsp;&nbsp;&nbsp;&nbsp;机：</td>
              <td><input name="mobileTel" type="text" id="mobileTel" size="30"  value="<%=c.getMobileTel()%>">
                *</td>
            </tr>
            <tr>
              <td height="27" align="center">邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</td>
              <td><input name="email" type="text" id="email" size="50" value="<%=c.getEmail()%>">
                *</td>
            </tr>
            <tr>
              <td height="27" align="center">开户银行：</td>
              <td><input name="bankName" type="text" id="bankName" size="20" value="<%=c.getBankName()%>"></td>
            </tr>
            <tr>
              <td height="27" align="center">银行账号：</td>
              <td><input name="bankNo" type="text" id="bankNo" size="30" value="<%=c.getBankNo()%>"></td>
            </tr>
			<%}else{%>
				<script language="javascript">
				window.location.href="customer.do?action=customerQuery";
				</script>
			<%}%>
            <tr>
              <td height="27" colspan="2" align="center"><input name="Submit" type="submit" class="btn_grey" value="提交">
                &nbsp;
                <input name="Submit2" type="reset" class="btn_grey" value="重置">
&nbsp;
<input name="Submit3" type="button" class="btn_grey" value="返回" onClick="window.location.href='customer.do?action=customerQuery';"></td>
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
