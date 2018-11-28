<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="address.AddressDAO"/>
<jsp:useBean id="dto" class="address.AddressDTO"/>
<jsp:setProperty name="dto" property="*"/>

<%
boolean flag = dao.update(dto);
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
div{
	text-align: center;
	margin: auto;
} 
</style> 
</head> 
<body> 
<div>
		<%
			if(flag){
				out.print("정보를 수정했습니다.");
			}else{
				out.print("정보수정을 실패했습니다.");
			}
		%>
		<br>
		<input type="button" value="다시 수정"
				onclick="location.href='./updateForm.jsp'">
		<input type="button" value="저장 목록"
				onclick="location.href='./list.jsp'">		
	</div>
</body> 
</html> 