<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO" />
<%

	String id=request.getParameter("id");
	
	boolean flag=dao.dubplicateId(id);
%>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
}
div{
text-align: center;
margin-top: 10px;
margin-bottom: 10px;
}
table{
width:'auto';
margin: 0 auto;
} 
table,th,td{
border:1px solid black;
border-collapse:collapse;
}
.content2{
	padding:10px auto;
	border:1px solid black;
	text-size:11
}
</style> 
<script type="text/javascript">
function use(){
	opener.frm.id.value='<%=id%>';
	self.close();
	
}
</script>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<body> 

<div class=title>결과</div>
<div class="content">
<text class=content2><%=id %></text>는<br><br>
<%
	if(flag){
		out.print("중복ID로 사용할 수 없습니다.<br><br>");
	}else{
		out.print("사용가능한 ID 입니다.<br><br>");
		out.print("<button onclick='use()'>사용</button>");
	}
%>
</div>
<div class=bottom>
<input type="button" value='다시시도' onclick="location.href='./id_form.jsp'">
<input type="button" value='닫기' onclick="window.close()">
</div>
</body> 
</html> 