<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="address.AddressDAO"/>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	boolean flag = dao.delete(no);
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
div {
	text-align: center;

</style> 
</head> 
<body>
<div>삭제처리</div> 
	<div>
	<%if(flag){
		out.print("삭제가 완료되었습니다.");
	}else{
		out.print("삭제를 실패하엿습니다.");
	}
	%>
	</div>
	<div>
	<input type = "button" value = "저장 목록" onclick = "location.href='./list.jsp'">
	</div>
</body> 
</html> 