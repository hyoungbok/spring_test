<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file="../ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="address.AddressDAO"/>
<jsp:useBean id="dto" class="address.AddressDTO"/>
<jsp:setProperty name="dto" property="*"/>

<%

	boolean flag = dao.create(dto);

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
	padding:20px;
	margin:50px;
}
</style>
<script type="text/javascript">
function alist(){
		var url = "list.jsp";
		
		location.href=url;
	
}
</script> 
</head> 
<body> 
<div>처리결과</div>
<div>
<%
	if(flag){
		out.print("주소등록을 하였습니다.");
	}else{
		out.print("주소등록이 실패했습니다.");
	}
%>
</div>
<div>
<button onclick="location.href='createForm.jsp'">계속등록</button>
<button onclick="alist()">목록</button>

</div>

</body> 
</html> 