<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
 <% System.out.println(request.getRemoteAddr()); %>
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
 
<DIV class="title">파일업로드 테스트</DIV>
 
<DIV class='content'>
  <form name="frm" 
      action="./upload_multi_Proc.jsp"  
      method="post" 
      enctype="multipart/form-data"> 
 
    ① 파일: <input type="file" name="file1" size="50"><br>  
    ② 파일: <input type="file" name="file2" size="50"><br> 
    ③ 파일: <input type="file" name="file3" size="50"><br> 
    파일 설명: <input type="text" name="title" size="50" value="시원한 설악산 계곡"><br> 
    <input type="submit" value="전송"> 
  </form> 
</DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
