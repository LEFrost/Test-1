<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.actionForm.SendLetterForm"%>
<%@ page import="java.util.*"%>

<html>
<%
List list=(List)request.getAttribute("history");
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
        <td height="22" valign="top" class="word_orange">当前位置：收发短信 &gt; 历史记录管理 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><%
if(list==null || list.isEmpty()){
%>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="36" align="center">暂无历史记录！</td>
            </tr>
          </table>
          <%
}else{
  //通过迭代方式显示数据
  Iterator it=list.iterator();
  String toMan="";
  String content="";
  String fromMan="";
  String sendTime="";
  
  %>
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="84%">&nbsp;      </td>
<td width="16%">
      <a href="shortInfo.do?action=type"></a> </td>	  
  </tr>
</table>  
  <table width="91%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#54ABEF">
  <tr align="center" bgcolor="#e3F4F7" height="26">
    <td width="22%" bgcolor="#A8D8FC">接收方手机号码</td>
    <td width="49%" bgcolor="#A8D8FC">短信内容</td>
    <td width="7%" bgcolor="#A8D8FC">发信人</td>
    <td width="22%" bgcolor="#A8D8FC">发送时间</td>
  </tr>
<%
  while(it.hasNext()){
    SendLetterForm s=(SendLetterForm)it.next();
	toMan=s.getToMan();
	content=s.getContent();
	fromMan=s.getFromMan();
	//sendTime=s.getSendTime();
	%> 
  <tr>
    <td style="padding:5px;"><%=toMan%></td>
    <td style="padding:5px;"><%=content%></td>
    <td align="center"><%=fromMan%></td>
	    <td align="center"><%=s.getSendTime().toLocaleString()%></td>
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
