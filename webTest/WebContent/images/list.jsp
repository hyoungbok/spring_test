<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="address.AddressDAO"/>
<%
	List<AddressDTO> list = dao.list();
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
	margin: 10px 0px 
	padding: 5px;
}

table {
	width: 60%;
	margin: auto;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px;
}
th{
	background-color: lightgrey;
}
 
</style>
<script type="text/javascript">
function read(no){
	var url = "read.jsp"
	url = url+"?no="+no;
	location.href=url;
}

function update(no){
	var url = "updateForm.jsp";
	url = url+"?no="+no;
	location.href=url;
}
function del(no){
	if(confirm("정말삭제하시겠습니까?")){
		var url = "deleteProc.jsp";
		url = url+"?no="+no;
		location.href=url;
	}
}
	
</script> 
</head> 
<body> 
	<div>저장 목록</div>
	
	<table>
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>수정/삭제</th>
	</tr>
	<% for(int i = 0; i < list.size(); i++){
		AddressDTO dto = list.get(i);
	%>	
	<tr>
		<td><%=dto.getNo() %></td>
		<td><a href="javascript:read('<%=dto.getNo() %>')">
			<%=dto.getName() %></a></td>
		<td><a href="javascript:update('<%=dto.getNo() %>')">수정</a>
			<a href="javascript:del('<%=dto.getNo() %>')">삭제</a>
	<%
	}
 	%>	
	</table>
	<div>
		<button type="submit" onclick="location.href='./createForm.jsp'">등록</button>
	</div>
</body> 
</html> 