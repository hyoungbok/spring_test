<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
 
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
 
<DIV class="title">글 등록</DIV>
 
 <form name='frmData'  
      action='./createProc_test.jsp'  
      method='post' 
      enctype="multipart/form-data">
       
    제목: <input type='text' name='title' size='60'><br></br> 
    내용: <textarea name="content" rows='15' cols="60"></textarea><br></br>  
    참고: <input type='text' name='etc' size='60'><br></br> 
    파일: <input type='file' name='filename' size='60'>
     
    <input type='submit' value='등록'></input> 
  </form> 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
