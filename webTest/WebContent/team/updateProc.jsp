<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="team.TeamDAO"/>
<jsp:useBean id="dto" class="team.TeamDTO"/>
<jsp:setProperty property="*" name="dto"/>

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
div {
	text-align: center;
	margin-top: 100px;
}
</style> 
<script type="text/javascript">
function tlist(){
	var url = "list.jsp"
	url = url + "?col=<%=request.getParameter("col")%> ";
	url = url + "&word=<%=request.getParameter("word")%> ";
	url = url + "&nowPage=<%=request.getParameter("nowPage")%> ";
	location.href=url;
}</script>
</head> 
<body>
<div>
<%if(flag){
	out.print("수정이 완료되었습니다.");
		}else{
			out.print("수정을 실패하였습니다.");
		}
%>
<br><input type="button" value = "목록" onclick="tlist()"> 
</div>
			
	

</body> 
</html> 