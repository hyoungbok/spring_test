<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp"%>
<%
	int memono = Integer.parseInt(request.getParameter("memono"));

	MemoDAO dao = new MemoDAO();
	boolean flag = dao.delete(memono);
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
</head>
<body>
	<div>
		<%
			if (flag) {
				out.print("메모를 삭제했습니다.");
			} else {
				out.print("메모삭제를 실패했습니다.");
			}
		%>
		<br> <input type="button" value="목록"
			onclick="location.href='./list.jsp'">
	</div>
</body>
</html>

