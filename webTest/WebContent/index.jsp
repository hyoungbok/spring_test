<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 

<%
	String id=(String)session.getAttribute("id");
	String grade=(String)session.getAttribute("grade");
	String str=null;
	
	String title="홈페이지가 없다...ㅜㅜ";
	if(id!=null && grade.equals("A")){
	   title="관리자 페이지";
	}
	if(id==null){
		str="게시판페이지 입니다.";
	}else{
		str="안녕하세요"+id+"님";
	}
	

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

</style> 
<link href='css/style.css' rel="stylesheet">
</head> 
<body> 
<jsp:include page="/menu/top.jsp"/>

<div class="title"><%=title %></div>
<div class="content">
<h1><%=str %></h1>
<img src="images/main.jpg" width="50%" ><br>
<%
	if(id==null){%>
	<button onclick="location.href='member/loginForm.jsp'">로그인</button>
<%}else{ %>
<button onclick="location.href='member/logout.jsp'">로그아웃</button>
<%} %>

</div>




<jsp:include page="/menu/bottom.jsp"/>

</body> 
</html> 