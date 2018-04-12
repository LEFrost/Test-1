<%@ page contentType="text/html; charset=gb2312" language="java"%>
<jsp:useBean id="upFile" scope="page" class="com.jspsmart.upload.SmartUpload" />
<%
upFile.initialize(pageContext);
upFile.upload();
System.out.println("文件大小："+upFile.getFiles().getSize());
if(upFile.getFiles().getSize()>2000000){
	out.println("<script>alert('您上传的文件太大，不能完成上传！');</script>");
}else{
	String getFileName=upFile.getFiles().getFile(0).getFileName();
	out.println("<script>opener.form1.adjunct.value='"+getFileName+"';window.close();</script>");
	try{
		//System.out.println("SSS:"+System.getProperty("java.io.tmpdir") );
		upFile.save(System.getProperty("java.io.tmpdir"));
	}catch(Exception e){
		out.println("上传文件出现错误："+e.getMessage());
	}
}
%>