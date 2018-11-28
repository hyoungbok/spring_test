<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<%
	String upDir = "/test/storage";
	String downDir = "/test/storage";

	upDir = application.getRealPath(upDir);
	String tempDir = application.getRealPath("/test/temp");
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);
	
	FileItem fileItem = upload.getFileItem("file1");
	int size1=(int)fileItem.getSize();
	String file1 = "";
	if(size1>0)
			file1=UploadSave.saveFile(fileItem,upDir);
	
	fileItem = upload.getFileItem("file2");
	int size2 = (int)fileItem.getSize();
	String file2 = "";
	if(size2>0)
			file2=UploadSave.saveFile(fileItem, upDir);
	
	fileItem = upload.getFileItem("file3");
	int size3 = (int) fileItem.getSize();
	String file3 = "";
	if(size3>0)
		file3=UploadSave.saveFile(fileItem, upDir);
	
	String title = UploadSave.encode(upload.getParameter("title"));
	
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
 
<DIV class="title">파일 업로드 테스트</DIV>
 
 <div class="content">
	 파일1: <%=file1 %> / 파일 사이즈: <%=size1 %><br>
	 파일2: <%=file2 %> / 파일 사이즈: <%=size2 %><br>
	 파일3: <%=file3 %> / 파일 사이즈: <%=size3 %><br>
	 설명:
  </div>
  <DIV class='bottom'>
    <input type='button' value='돌아가기' onclick="history.back()">
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
