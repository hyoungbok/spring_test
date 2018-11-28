<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp"%>

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

	<DIV class="title">ID중복확인</DIV>
	<FORM name='frm' method='POST' action='./idProc.jsp'>
		<div class="content">아이디를 입력하세요</div>

		<TABLE>

			<TR>
				<TH>아이디</TH>
				<TD><input type="text" name="id"></TD>
			</TR>
		</TABLE>

		<DIV class='bottom'>
			<input type='submit' value='중복확인'> 
			<input type='button' value='취소' onclick="window.close()">
		</DIV>
	</FORM>


	<!-- *********************************************** -->
	
</body>
<!-- *********************************************** -->
</html>
