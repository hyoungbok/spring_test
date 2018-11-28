<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="memo.MemoDAO" />
<jsp:useBean id="dto" class="memo.MemoDTO" />
<jsp:setProperty property="*" name="dto"/>
<%
	Map map=new HashMap();
	map.put("grpno", dto.getGrpno());
	map.put("ansnum", dto.getAnsnum());
	dao.up(map);
	
	boolean flag=dao.reCreate(dto);

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 24px; 
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
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<body> 
<jsp:include page="/menu/top.jsp" flush="false" />
<div class="title">처리결과</div>
<div class="content">
<%
	if(flag){
		out.print("등록 완료");
	}else{
		out.print("등록 실패");
	}
%>

</div>
<div class="bottom">
<button onclick="mlist()">확인</button>

</div>
<jsp:include page="/menu/bottom.jsp" flush="false" />
</body> 
</html> 