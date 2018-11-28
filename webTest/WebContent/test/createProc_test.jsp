<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<%
	String tempDir = "/test/temp";
	String upDir = "/test/storage";
	
	upDir = application.getRealPath(upDir);
	tempDir = application.getRealPath(tempDir);
			
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	
	String title = UploadSave.encode(upload.getParameter("title"));
	String content = UploadSave.encode(upload.getParameter("content"));
	String etc = UploadSave.encode(upload.getParameter("etc"));
	
	FileItem fileItem = upload.getFileItem("filename");
	int size = (int)fileItem.getSize(); 
	
	String filename = UploadSave.saveFile(fileItem, upDir);
	
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">등록확인</DIV>
 
<div class="content">
제목 : <%=title %><br>
내용 : <%=content %><br>
참고 : <%=etc %><br>
파일명 : <%=filename %><br>
크기 : <%=size %>
</div>
  
  <DIV class='bottom'>
    <input type='submit' value='등록'>
    <input type='button' value='다시시도' onclick="history.back()">
    <input type='button' value='취소' onclick="window.close()">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
