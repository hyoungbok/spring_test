<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="member.MemberDAO" />
<jsp:useBean id="dto" class="member.MemberDTO" />
<%
	String id = request.getParameter("id");
	String npasswd = request.getParameter("npasswd");
	String passwd = request.getParameter("passwd");
	String repasswd = request.getParameter("repasswd");
	System.out.println(npasswd);
	Map map = new HashMap();
	map.put("id", id);
	map.put("npasswd", npasswd);
	map.put("passwd", passwd);

	boolean rflag = false;
	rflag = dao.dubplicatepw(map);

	boolean flag = false;
	if (rflag && passwd.equals(repasswd)) {
		flag = dao.updatePw(map);
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
</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">패스워드 변경 처리</DIV>

	<div class="content">
		<%
			if (flag) {
				out.print("패스워드를 변경했습니다<br>");
				out.print("로그인를 해보세요~<br>");
			} else if (rflag == false) {
				out.print("현재비밀번호 틀림");
			} else {
				out.print("새비밀번호 중복");
			}
		%>
	</div>
	<DIV class='bottom'>
		<%
			if (flag) {
		%>
		<input type='button' value='로그인'
			onclick="location.href='./loginForm.jsp'">
		<%
			} else {
		%>
		<input type='button' value='다시시도' onclick="history.back()">
		<%
			}
		%>
		<input type='button' value='홈' onclick="location.href='../index.jsp'">
	</DIV>



	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
