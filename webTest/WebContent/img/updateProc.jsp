<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="img.ImgDAO"/>
<jsp:useBean id="dto" class="img.ImgDTO"/>

<% 

	String upDir = application.getRealPath("/img/storage");
	String tempDir = application.getRealPath("/img/temp");
	
	
	UploadSave upload = new UploadSave(request,-1,-1, tempDir);
	int no = Integer.parseInt(upload.getParameter("no"));
	String passwd = upload.getParameter("passwd");
	Map map = new HashMap();
	map.put("no", no); 
	map.put("passwd",passwd );
 	
	
	dto.setName(UploadSave.encode(upload.getParameter("name")));		
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));		
	dto.setPasswd(passwd);
	dto.setNo(no);
	  
	boolean flag = dao.passCheck(map);
	boolean flag2 = false;
	if(flag==true){
		
	
	 	
	 	
	 	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
	 	FileItem fileItem = upload.getFileItem("fname");
	 	String fname = null;
	 	if(fileItem.getSize()>0){
	 		UploadSave.deleteFile(upDir, oldfile);	
	 		fname = UploadSave.saveFile(fileItem, upDir);
	 		dto.setFname(fname);
	 	}
	 		dto.setFname(oldfile);
	 		
	 		  
	 		flag2= dao.update(dto);
	 	 	
	}
	
 	
%>   
  
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function mread(){
	var url = "read.jsp";
	url += "?no=<%=dto.getNo()%>";
	location.href=url;
}
</script>
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
 
<DIV class="title">정보수정</DIV>
 
 
  <DIV class="content">
  <%
  
//   out.print(passwd); 
//   out.print(no);
  if(flag2){
	  out.print("정보가 수정되었습니다.");
	}else{
		out.print("정보수정이 실패했습니다.");
	} 
  %>
   
  </DIV>
  
 
  <DIV class='bottom'>
    <input type='button' value='정보확인' onclick="mread()">
    <input type='button' value='다시시도' onclick="history.back()">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 