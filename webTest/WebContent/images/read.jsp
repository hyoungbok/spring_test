<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="address.AddressDAO"/>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	AddressDTO dto = dao.read(no);	
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
	margin-top: 20px;
}
th, td{
	padding: 5px;
}
table th, td{
	border:1px solid black;
	border-collapse: collapse;
}
table{
	margin:auto;
	width:60%;
} 
</style>
<script type="text/javascript">
function tlist(){
	var url = "list.jsp;"
	location.href=url;
}
</script>
</head> 
<body>
<div>조회</div>
	<table>
		<tr>
			<th>이름</th>
			<td><%=dto.getName() %></td>
		</tr>
		
		<tr>
			<th>전화번호</th>
			<td><%=dto.getPhone() %></td>
		</tr>
		
		<tr>
			<th>우편번호</th>
			<td><%=dto.getZipcode() %></td>
		</tr>
		
		<tr>
			<th>주소</th>
			<td><%=dto.getAddress() %></td>
		</tr>
		
		<tr>
			<th>상세주소</th>
			<td><%=dto.getAddress2() %></td>
		</tr>
		
	</table>
		<div>
			<input type="submit" value="저장 목록" onclick="tlist()">
		</div>
</body> 
</html> 