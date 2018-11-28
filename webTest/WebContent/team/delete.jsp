<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="team.TeamDAO" />
<%
	int no = Integer.parseInt(request.getParameter("no"));

	boolean dflag = dao.checkRefnum(no);

	boolean flag = false;
	if (dflag == false) {
		flag = dao.delete(no);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}

div {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
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
	<div id="title">처리결과</div>
	<div>
		<%
			if (dflag) {
				out.print("답변글이 있으므로 삭제할 수 없습니다.");
			} else if (flag) {
				out.print("삭제를 하였습니다.");

			} else {
				out.print("삭제를 실패하였습니다.");
			}
		%>
	</div>
	<div>
	<button type="button" onclick="tlist()">목록</button>
	
	</div>



</body>
</html>
