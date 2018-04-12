<%@ page contentType="text/html; charset=gb2312" language="java" import="java.util.*" %>
<%@ page import="com.wgh.actionForm.PersonnelForm"%>
<%@ page import="com.wgh.actionForm.CustomerForm"%>
<%
List list_p=(List)request.getAttribute("personnelQuery");
List list_c=(List)request.getAttribute("customerQuery");
%>
<html>
<head>
<title>企业快信——短信+邮件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
<script language="javascript">
function checkform(myform){
	for(i=0;i<myform.length;i++){
		if(myform.elements[i].value=="" && myform.elements[i]!=myform.adjunct){
			alert(myform.elements[i].title+"不能为空！");
			myform.elements[i].focus();
			return false;
		}
	}
	if(!checkemail(myform.addressee.value)){
		alert("您输入的收件人地址不正确！");myform.addressee.focus();return false;
	}
	if(!checkemail(myform.addresser.value)){
		alert("您输入的发件人地址不正确！");myform.addresser.focus();return false;
	}	
}
function add(email){
	if(checkemail(email)){
		s=form1.addressee.value;
		if(checkemail(s)){
			arrS=s.split(",");
			flag=false;		//标记是否已经添加
			for(i=0;i<arrS.length;i++){
				if(arrS[i]==email){	//判断该Email地址是否已经添加
					flag=true;
					break;
				}
			}
			if(!flag){
				form1.addressee.value=s+","+email;
			}
		}else{
			form1.addressee.value=email;
		}
	}
}
</script>
</head>
<body>
<%@include file="navigation.jsp"%>
<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="510" valign="top" style="padding:5px;"><table width="100%" height="504"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="26" valign="top" class="word_orange">当前位置：邮件群发 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top">
<form action="sendMail.do?action=sendMail" method="post" name="form1" onSubmit="return checkform(form1)">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="177" height="469" align="right" valign="top" background="Images/left_bg.gif" class="tableBorder"><img src="Images/left_title.gif" width="210" height="33">
      <table width="92%" border="0" cellpadding="0" cellspacing="0">
	<%if(list_c.size()>0){%>
      <tr>
        <td height="27"><a href="#" onClick="javascript:ShowTR(img_1,OpenRep1)"><img src="Images/jia.gif" alt="展开" name="img_1" width="10" height="10" border="0"> 客户列表</a></td>
      </tr>
      <tr id="OpenRep1" style="display:none">
        <td height="27">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <%  for(int i=0;i<list_c.size();i++){
    			CustomerForm c=(CustomerForm)list_c.get(i);%>
            <tr>
              <td>&nbsp;<a href="#" onClick="add('<%=c.getEmail()%>')"><%=c.getName()%></a></td>
            </tr>
			<%}%>
          </table>		  </td>
      </tr>
	<%}
	if(list_p.size()>0){%>  
      <tr>
        <td height="27"><a href="#" onClick="javascript:ShowTR(img_2,OpenRep2)"><img src="Images/jia.gif" alt="展开" name="img_2" width="10" height="10" border="0"> 员工列表</a></td>
      </tr>
      <tr id="OpenRep2" style="display:none">
        <td height="27">
		 <table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <%  for(int i=0;i<list_p.size();i++){
    			PersonnelForm p=(PersonnelForm)list_p.get(i);%>
            <tr>
              <td>&nbsp;<a href="#" onClick="add('<%=p.getEmail()%>')"><%=p.getName()%></a></td>
            </tr>
			<%}%>
          </table>		</td>
      </tr>
	 <%}%>
    </table></td>
	<td background="images/title.jpg">&nbsp;</td>
    <td valign="top" background="images/title.jpg" class="tableBorder">
      <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
	    <tr>
          <td height="23" align="center">&nbsp;</td>
          <td height="23" align="center">&nbsp;</td>
          <td align="left">&nbsp;</td>
        </tr>
        <tr>
          <td width="16%" height="55" align="center">收件人：</td>
          <td width="84%" colspan="2" align="left">
            <textarea name="addressee" cols="58" rows="3" class="wenbenkuang" id="addressee" title="收件人"></textarea>          </td>
        </tr>
        <tr>
          <td height="28" align="center">发件人：</td>
          <td colspan="2" align="left"><input name="addresser" type="text" id="addresser" title="发件人" size="60"></td>
        </tr>
        <tr>
          <td height="28" align="center">密&nbsp;&nbsp;码：</td>
          <td colspan="2" align="left"><input name="pwd" type="password" id="pwd" title="发件人信箱密码" size="60"></td>
        </tr>
        <tr>
          <td height="28" align="center">主&nbsp;&nbsp;题：</td>
          <td colspan="2" align="left"><input name="title" type="text" id="title" title="邮件主题" size="60"></td>
        </tr>
        <tr>
          <td height="28" align="center">附&nbsp;&nbsp;件：</td>
          <td colspan="2" align="left"><input name="adjunct" type="text" id="adjunct" title="附件" size="45" readonly="yes">
            &nbsp;
            <input name="Submit3" type="button" class="btn_grey" value="上传附件" onClick="window.open('upFile.jsp','','width=350,height=150');"></td>
        </tr>
        <tr>
          <td height="171" align="center">内&nbsp;&nbsp;容：</td>
          <td colspan="2" align="left"><textarea name="content" cols="58" rows="12" class="wenbenkuang" id="content" title="邮件内容"></textarea></td>
        </tr>
        <tr>
          <td height="32" align="center">&nbsp;</td>
          <td height="23" align="center"><input name="Submit" type="submit" class="btn_grey" value="发送">
            &nbsp;
            <input name="Submit2" type="reset" class="btn_grey" value="重置">
            &nbsp;</td>
          <td align="left">&nbsp;</td>
        </tr>

        </table>
      <table width="100%" height="135" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="right" valign="bottom"><img src="Images/center_b.gif" width="523" height="100"></td>
        </tr>
      </table></td>

  </tr>
</table>
</form>
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
