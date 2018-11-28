<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp"%>
<%

		String id = request.getParameter("id");
	
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
	
	<!-- *********************************************** -->

	<DIV class="title">중복확인</DIV>

	<FORM name='frm' method='POST' action='./emailProc.jsp'>
		<input type="hidden" name="id" value="<%=id %>">
		<div class="content">이메일을 입력하세요.</div>
		<TABLE>
			<TR>
				<TH>이메일</TH>
				<TD><input type="text" name="email"></TD>
			</TR>
		</TABLE>

		<DIV class='bottom'>
			  <input type='submit' value='중복확인' >
  <input type='button' value='닫기' onclick="window.close()">
		</DIV>
	</FORM>


	<!-- *********************************************** -->
	
</body>
<!-- *********************************************** -->
</html>
