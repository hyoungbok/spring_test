<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	padding:20px;
	margin:50px;
}
</style>
<script type="text/javascript">
function tlist(){
	
	var url = "list.jsp"
		url = url + "?col=<%=request.getParameter("col")%>";
	url = url + "&word=<%=request.getParameter("word")%>";
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>";
	
	location.href=url;
	
}
</script> 
</head> 
<body> 
<div id="title">처리결과</div>
<div>
<%
	if(flag){
		out.print("팀정보가 수정되었습니다.");
	}else{
		out.print("팀정보 수정이 실패했습니다..");
	}
%>
</div>
<div  id="title">
<button onclick="tlist()">목록</button>
</div>
</body> 
</html> 