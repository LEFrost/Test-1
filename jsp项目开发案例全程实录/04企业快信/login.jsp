<%@ page contentType="text/html; charset=gb2312" language="java"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<head>
<title>企业快信——短信+邮件</title>
<link href="CSS/style.css" rel="stylesheet">
<script language="javascript">
function check(form){
	if (form.name.value==""){
		alert("请输入管理员名称!");form.name.focus();return false;
	}
	if (form.pwd.value==""){
		alert("请输入密码!");form.pwd.focus();return false;
	}	
}
</script>
</head>
<body>
<table width="778" height="217" border="0" align="center" cellpadding="0" cellspacing="0" background="Images/login_top.gif">
  <tr>
    <td height="189" colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td width="660" align="right" style="padding-right:10px;">欢迎登录企业快信V1.0！</td>
    <td width="118" align="right" style="padding-right:10px;">&nbsp;</td>
  </tr>
</table>
<table width="778" height="189"  border="0" align="center" cellpadding="0" cellspacing="0" background="Images/login_mid.gif">
          <tr>
            <td height="65">&nbsp;</td>
  </tr>
          <tr>
            <td height="72" valign="top"><table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="2%">&nbsp;</td>
                  <td width="97%" align="center" valign="top">
                    <form name="form1" method="post" action="manager.do?action=login">
                      <table width="100%"  border="0" cellpadding="0" cellspacing="0" bordercolorlight="#FFFFFF" bordercolordark="#D2E3E6">
                        <tr>
                          <td width="48%" height="36">&nbsp;</td>
                      <td width="11%">管理员名称：</td>
                      <td width="32%">
                        <input name="name" type="text" class="logininput" id="name" size="25">                        </td>
                      <td width="9%">&nbsp;</td>
                    </tr>
                        <tr>
                          <td height="38">&nbsp;</td>
                      <td>管理员密码：</td>
                      <td><input name="pwd" type="password" class="logininput" id="pwd" size="25"></td>
                      <td>&nbsp;</td>
                    </tr>
                        <tr>
                          <td height="31">&nbsp;</td>
                      <td height="31" colspan="2" align="center"><input name="Submit" type="submit" class="btn_grey" value="确定" onClick="return check(form1)">
                        &nbsp;
                        <input name="Submit3" type="reset" class="btn_grey" value="重置">&nbsp;
                        <input name="Submit2" type="button" class="btn_grey" value="关闭" onClick="window.close();"></td>
                      <td>&nbsp;</td>
                    </tr>
                      </table> 
			  </form>				   </td>
                  <td width="1%">&nbsp;</td>
              </tr>
              </table></td>
  </tr>
</table>
<table width="778" height="296" border="0" align="center" cellpadding="0" cellspacing="0" background="Images/login_top.gif">
  <tr>
    <td height="182" background="Images/login_bottom.gif">&nbsp;</td>
  </tr>
</table>
<%@ include file="copyright.jsp"%>
</body>
</html>
