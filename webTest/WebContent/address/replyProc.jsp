<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file="../ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="address.AddressDAO"/>
<jsp:useBean id="dto" class="address.AddressDTO"/>
<jsp:setProperty name="dto" property="*"/>

<%

Map map = new HashMap();
map.put("grpno",dto.getGrpno() );
map.put("ansnum",dto.getAnsnum() );
dao.upAnsnum(map);
boolean flag= dao.replyCreate(dto);

 
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
function alist(){
		var url = "list.jsp";
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
		out.print("답변이 등록 되었습니다.");
	}else{
		out.print("답변등록이 실패했습니다.");
	}
%>
</div>
<div>
<button onclick="location.href='replyForm.jsp'">계속등록</button>
<button onclick="alist()">목록</button>

</div>

</body> 
</html> 