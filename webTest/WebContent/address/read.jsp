<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp"  %>
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
	margin-top: 10px 0px;
	padding: 5px;
}
table{
	width: 60%;
	margin: 0 auto;
}
table,th,td{
	border: 1px solid black;
	border-collaspe: collapse;
	padding: 5px;
}
</style>
<script type="text/javascript">
function tlist(){
	var url = "list.jsp";
	url = url + "?col=<%=request.getParameter("col")%>";
	url = url + "&word=<%=request.getParameter("word")%>";
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>";
	
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
	<th>우편주소</th>
	<td><%=dto.getZipcode() %></td>
	</tr>
	<tr>
	<th>주소</th>
	<td><%=dto.getAddress() %><br>
		<%=dto.getAddress2() %>
	</tr>
</table>
<div>
	<button type="button" onclick="tlist()">목록</button>
	
</div>

</body> 
</html> 