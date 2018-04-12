<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="com.wgh.core.ChStr" %>
<%
//验证用户是否登录
String manager=(String)session.getAttribute("manager");
String purview=(String)session.getAttribute("purview");
if (manager==null || "".equals(manager)){
	response.sendRedirect("login.jsp");
	return;
}
ChStr chStr=new ChStr();
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script src="JS/menu.JS"></script>
<script src="JS/function.js"></script>
<div class=menuskin id=popmenu onmouseover="clearhidemenu();highlightmenu(event,'on')"
      onmouseout="highlightmenu(event,'off');dynamichide(event)" style="Z-index:100;position:absolute;"></div>
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="112" valign="top" background="Images/top_bg.jpg"><table width="100%" height="35"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="78%" height="6"></td>
        <td colspan="2"></td>
      </tr>
      <tr>
        <td height="22">&nbsp;</td>
        <td width="10%"><a href="#" onClick="window.location.reload();" ><span class="word_white">＞刷新页面</span></a></td>
        <td width="12%"><a href="#" onClick="myclose()"><span class="word_white">＞关闭系统</span></a></td>
        </tr>
    </table>
      <table width="98%" height="72"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="72" align="right" valign="bottom" class="word_white">企业快信欢迎您！<b> 当前登录用户：<%=manager%></b></td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td height="39" align="right" valign="top" background="Images/navigate_bg.jpg" bgcolor="#EEEEEE"><table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="28%">&nbsp;</td>
        <td width="70%" align="center" valign="middle" class="word_grey"><a href="main.jsp">首页</a> |
          <a  onmouseover=showmenu(event,cardClip) onmouseout=delayhidemenu() class='navlink' style="CURSOR:hand" >名片夹管理</a> |
          <a  onmouseover=showmenu(event,infoLibrary) onmouseout=delayhidemenu() class='navlink' style="CURSOR:hand" >信息库管理</a> |
          <a  onmouseover=showmenu(event,shortLetter) onmouseout=delayhidemenu() class='navlink' style="CURSOR:hand" >收发短信</a> |
          <a  href="sendMail.do?action=addMail">邮件群发</a> | 
        <%if(purview.equals("1")){%>
        <a  href="sysParameterSet.do?action=parameterQuery" >系统参数设定</a> |
        <%}%>
		<a onmouseover=showmenu(event,sysSet) onmouseout=delayhidemenu() class='navlink' style="CURSOR:hand">系统设置</a>
		| <a href="#" onClick="quit()">退出系统</a></td>
        <td width="2%">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
<script language="javascript">
var cardClip='<table width=56><tr><td id=customer onMouseOver=overbg(customer) onMouseOut=outbg(customer)><a href=customer.do?action=customerQuery>客户管理</a></td></tr>\
<tr><td id=personnel onMouseOver=overbg(personnel) onMouseOut=outbg(personnel)><a href=personnel.do?action=personnelQuery>员工管理</a></td></tr>\
</table>'
var infoLibrary='<table width=86><tr><td id=infoType onMouseOver=overbg(infoType) onMouseOut=outbg(infoType)><a href=infoType.do?action=infoTypeQuery>信息类别管理</a></td></tr>\
<tr><td id=shortInfo onMouseOver=overbg(shortInfo) onMouseOut=outbg(shortInfo)><a href=shortInfo.do?action=shortInfoQuery>常用短语管理</a></td></tr>\
</table>'
<%if(purview.equals("1")){%>
	var shortLetter='<table width=86><tr><td id=sendLetter onMouseOver=overbg(sendLetter) onMouseOut=outbg(sendLetter)><a href=sendLetter.do?action=addLetter>发送短信</a></td></tr>\
<tr><td id=getLetter onMouseOver=overbg(getLetter) onMouseOut=outbg(getLetter)><a href=sendLetter.do?action=getLetterQuery>接收短信</a></td></tr>\
<tr><td id=historyQ onMouseOver=overbg(historyQ) onMouseOut=outbg(historyQ)><a href=sendLetter.do?action=historyQuery>查看发送日志</a></td></tr>\
</table>'
<%}else{%>
	var shortLetter='<table width=56><tr><td id=sendLetter onMouseOver=overbg(sendLetter) onMouseOut=outbg(sendLetter)><a href=sendLetter.do?action=addLetter>发送短信</a></td></tr>\
<tr><td id=getLetter onMouseOver=overbg(getLetter) onMouseOut=outbg(getLetter)><a href=sendLetter.do?action=getLetterQuery>接收短信</a></td></tr>\
</table>'
<%}
if(purview.equals("1")){%>
	var sysSet='<table width=70><tr><td id=manager onMouseOver=overbg(manager) onMouseOut=outbg(manager)><a href=manager.do?action=managerQuery>操作员管理</a></td></tr>\
<tr><td id=changePWD onMouseOver=overbg(changePWD) onMouseOut=outbg(changePWD)><a  href="manager.do?action=queryPWD">更改口令</a></td></tr>\
</table>'
<%}else{%>
	var sysSet='<table width=70><tr><td id=changePWD onMouseOver=overbg(changePWD) onMouseOut=outbg(changePWD)><a  					href="manager.do?action=queryPWD">更改口令</a></td></tr></table>'
<%}%>
</script>