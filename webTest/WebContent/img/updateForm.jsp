<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
 <jsp:useBean id="dao" class="img.ImgDAO"/>
 
 <%
 	
  	int no = Integer.parseInt(request.getParameter("no"));
   String passwd = request.getParameter("passwd");
	 ImgDTO dto = dao.read(no); 
 %> 
<!DOCTYPE html>   
<html>  
<head> 
<meta charset="UTF-8"> 
<title></title>  
<script type="text/javascript">
function inCheck(f){ 
	if(f.passwd.value=""){
	alert("패스워드를 입력하세요");
	f.passwd.focus();
	return false; 
	}
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
 
<DIV class="title">수정</DIV>
 
<FORM name='frm' method='POST' action='./updateProc.jsp'
      onsubmit="return inputCheck(this)"
      enctype="multipart/form-data">
      <input type="hidden" name="no" value="<%=no%>">

  <table>
    <TR>  
      
      <TD colspan="3" >
      <img src="./storage/<%=dto.getFname() %>">
      </TD>
      <div><input type="file" name="fname"></div>
     
    </TR>
    <tr> 
    <th>*번호</th> 
    <TD><%=dto.getNo() %> 
    </TD>
   
    </tr>
    <tr>
    <th>이름</th>
    <TD><input type="text" name="name" value="<%=dto.getName() %>">
    </TD>
    
    </tr>
    <tr>
    <th>제목</th>
    <TD><input type="text" name="title" value="<%=dto.getTitle() %>">
    </TD>
    
    </tr>
    
    <TR>
      <TH>내용</TH>
      <TD><textarea rows="5" cols="40" name="content"></textarea>
      </TD>
      
    </TR>
    
    <tr>
    <th>기존 패스워드</th>
    <TD><input type="password" name="passwd"></TD>
   
    </tr>
 
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='정보수정'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 