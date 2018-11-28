<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="memo.MemoDAO" />
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	int memono = Integer.parseInt(request.getParameter("memono"));
	boolean dflag=dao.check(memono);
	boolean flag=false;
	if(dflag==false) flag=dao.delete(memono);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 24px;
}

div {
	text-align: center;
	margin-top: 100px;
}
</style>
<script type="text/javascript">
function mlist(){
	var url = "list.jsp";
	url+="?col=<%=request.getParameter("col")%>";
	url+="&word=<%=request.getParameter("word")%>";
	url+="&nowPage=<%=request.getParameter("nowPage")%>";
	
	location.href = url;
	
}
</script>
</head>
<body>
	<div>
		<%
			if (dflag) {
				out.print("답변글이 있어 삭제할 수 없습니다.");
			} else if(flag){
				out.print("삭제 완료");
			}else{
				out.print("삭제 실패");
			}
		%>
		<br><br> <input type="button" value="목록"
			onclick="mlist()">
	</div>
</body>
</html>
