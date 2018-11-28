<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="memo.MemoDAO" />

<%
	request.setCharacterEncoding("utf-8");

	int memono = Integer.parseInt(request.getParameter("memono"));

	
	//조회수 증가
	dao.updateViewcnt(memono);
	/*조회수 증가 END*/
	/* 조회    */
	MemoDTO dto = dao.read(memono);
	String content = dto.getContent();
	content = content.replaceAll("\r\n", "<br>");

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

table {
	width: 60%;
	margin: 0 auto;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
}
</style>
<script type="text/javascript">
	function mcreate() {
		var url = "createForm.jsp";
		location.href = url;
	}
	function mupdate(memono) {
		var url = "updateForm.jsp";
		url += "?memono=" + memono;
		url+="&col=<%=request.getParameter("col")%>";
		url+="&word=<%=request.getParameter("word")%>";
		url+="&nowPage=<%=request.getParameter("nowPage")%>";
		location.href = url;
	}
	function mdelete(memono) {
		var url = "deleteForm.jsp";
		url += "?memono=" + memono;
		url+="&col=<%=request.getParameter("col")%>";
		url+="&word=<%=request.getParameter("word")%>";
		url+="&nowPage=<%=request.getParameter("nowPage")%>";
		location.href = url;
	}
	function mlist() {
		var url = "list.jsp";
		url+="?col=<%=request.getParameter("col")%>";
		url+="&word=<%=request.getParameter("word")%>";
		url+="&nowPage=<%=request.getParameter("nowPage")%>";
		location.href = url;
	}
	function mreply(){
		var url="replyForm.jsp";
		url +="?memono=<%=memono%>";
		url+="&col=<%=request.getParameter("col")%>";
		url+="&word=<%=request.getParameter("word")%>";
		url+="&nowPage=<%=request.getParameter("nowPage")%>";
		
		location.href=url;
		
	}
</script>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/menu/top.jsp" flush="false" />
	<div>조회</div>
	<table>
		<tr>
			<th>제목</th>
			<td><%=dto.getTitle()%></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><%=content%></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%=dto.getViewcnt()%></td>
		</tr>
		<tr>
			<th>등록일</th>
			<td><%=dto.getWdate()%></td>
		</tr>
	</table>
	<div>
		<input type="button" value="등록" onclick="mcreate()"> <input
			type="button" value="수정"
			onclick="mupdate('<%=dto.getMemono()%>')"> <input
			type="button" value="삭제"
			onclick="mdelete('<%=dto.getMemono()%>')"> <input
			type="button" value="목록" onclick="mlist()">
			<button onclick="mreply()">답변</button>
	</div>
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
</html>

