<%@ page contentType="text/html; charset=UTF-8"%>

<%@include file="../ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="img.ImgDAO" />
<%
	int no = Integer.parseInt(request.getParameter("no"));
	boolean flag = dao.delete(no);
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
function ilist() {
	var url = "list.jsp";

	location.href = url;
}
</script>
</head>
<body>
	<div>
		<%
			if (flag) {
				out.print("삭제했습니다.");
			} else {
				out.print("삭제를 실패했습니다.");
			}
		%>
		<br> <input type="button" value="목록" onclick="ilist()">
	</div>
</body>
</html>