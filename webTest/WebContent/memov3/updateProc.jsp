<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="memo.MemoDTO" />
<jsp:useBean id="dao" class="memo.MemoDAO" />
<jsp:setProperty property="*" name="dto"/>
<% request.setCharacterEncoding("utf-8"); 

/* int memono = Integer.parseInt(request.getParameter("memono"));
setProperty 에서 int로 변환되어 dto에 저장되어짐*/
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
margin-top: 100px;
} 
</style> 
<script type="text/javascript">
function mlist(){
	var url="list.jsp";
	url+="?col=<%=request.getParameter("col")%>";
	url+="&word=<%=request.getParameter("word")%>";
	url+="&nowPage=<%=request.getParameter("nowPage")%>";
	
	location.href=url;
}

</script>
</head> 
<body> 
<div>
<%
if(flag){
	out.print("메모를 수정하였습니다.");
}else{
	out.print("메모수정을 실패했습니다.");
}
%>
<br>
<input type="button" value="목록" onclick="mlist()">
</div>
</body> 
</html> 
