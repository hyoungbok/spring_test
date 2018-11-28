<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO" />
<%
	String email=request.getParameter("email");
	
	boolean flag=dao.duplicatedEmail(email);
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
	opener.frm.email.value='<%=email%>';
	self.close();
}
</script>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<body> 

<div class=title>결과</div>
<div class=content style=text-align:center>
입력하신 이메일 <br>
<text class=content2><%=email %></text>
은
<br><br>
<%
	if(flag){
		out.print("중복된 이메일로<br> 사용할 수 없습니다.<br>");
	}else{
		out.print("사용가능한 이메일 입니다.<br>");
		out.print("<button onclick='use()'>사용</button>");
	}
%>
</div>
<div class=bottom>
<input type="button" value='다시시도' onclick="location.href='./email_form.jsp'">
<input type="button" value='닫기' onclick="window.close()">
</div>
</body> 
</html> 