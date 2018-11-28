<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
 <jsp:useBean id="dao" class="img.ImgDAO"/>
 <jsp:useBean id="dto" class="img.ImgDTO"/>
  
 
 <%
 	String tempDir="/img/temp";
	String upDir="/img/storage";
	 
	tempDir =  application.getRealPath(tempDir);
	upDir = application.getRealPath(upDir);
	
	
	UploadSave upload = new UploadSave(request,-1,-1, tempDir);
	
 
	dto.setName(UploadSave.encode(upload.getParameter("name")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setPasswd(upload.getParameter("passwd"));
	
	
	FileItem fileItem = upload.getFileItem("fname");
 	int size= (int)fileItem.getSize();
 	String fname= null;
 	if(size>0){
 		fname=UploadSave.saveFile(fileItem, upDir);
 	}else{
 		fname="member.jpg";
 	}
 	dto.setFname(fname);
 	
 	boolean flag= dao.create(dto);
 
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
 
<DIV class="title"> 등록</DIV>
 
<div class="content">

<% if(flag){
	
	out.print("등록 성공.");
}else{
	out.print("등록 실패.");
	
}
%>
</div>
  <DIV class='bottom'>
    <input type='button' value='계속등록' onclick="location.href='./createForm.jsp'">
    <input type='button' value='목록' onclick="location.href='./list.jsp'">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 