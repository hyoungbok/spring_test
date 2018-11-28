<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
 <%
 	String id = request.getParameter("id");
 	boolean flag = dao.dubplicateId(id);
 %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">

function use(){
	opener.frm.id.value='<%=id%>';
	self.close();
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

<!-- *********************************************** -->
 
<DIV class="title">아이디 중복 확인</DIV>
<div class="content">
입력된 ID:<%=id %><br><br>
<%
	if(flag){
		out.print("중복되어서 사용할 수 없습니다. <br><br>");
	}else{
		out.print("중복아님, 사용가능합니다. <br><br>");
		out.print("<button onclick='use()'>사용</button>");
	}
	%>

  <DIV class='bottom'>
    <input type='button' value='다시시도' onclick="location.href='idForm.jsp'">
    <input type='button' value='닫기' onclick="window.close()">
    
  </DIV>

 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
