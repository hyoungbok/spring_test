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
table{
	width:50%
	margin: 5px auto;
}
th,td{
	padding: 5px;
}
table,th,td{
	border:1px solid black;
	border-collapse:collapse;
}
</style> 
<script type="text/javascript">
function incheck(f){
	if(f.phone.value==""){
		alert("전화번호를 적으세요")
		f.phone.focus();
		return;
	}
	f.submit();
	
	
}
</script>

</head> 
<body> 
<div>수정</div>
<form name ='frm' action='./updateProc.jsp' method='post'>
<input type="hidden" name="no" value="<%=no%>">
	<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
	<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
	<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
<table>
	<tr>
	<th>이름</th>
	<td><%=dto.getName() %>
	</td>
	<tr>
	<th>전화번호</th>
	<td><input type="text" name="phone" value="<%=dto.getPhone() %>"></td>
	<tr>
	<th>우편번호</th>
	<td><input type="text" name="zipcode" size"7" maxlength="5" value="<%=dto.getZipcode() %>">
	<button type="button" onclick="sample6_execDaumPostcod()">우편번호 검색</button>
	</td>
	
	<tr>
	<th>주소</th>
	<td>
	<input type="text" name="address" size="45" value="<%=dto.getAddress() %>">
	<input type="text" name="address2" size="45" value="<%=dto.getAddress2() %>">
	</td> 
	</tr>

</table>
<div>
	<button type="button" onclick="incheck(this.form)">수정</button>
	<button type="reset">입력취소</button>
</div>
</form>


</body> 
</html> 