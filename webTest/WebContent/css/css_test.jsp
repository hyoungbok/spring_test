<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
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

#idcss {
	color: #FF0000;
	background-color: #FFFF00;
	font-size: 50px;
	text-align: center;
	width: 35%;
	margin: 0 auto;
}
</style>
<link href="./style.css" rel="Stylesheet" type="text/css">
</head>
<body>
	<div class='title'>게시판 version2.0</div>
	<div class='content'>내용</div>
	<table class='table'>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
		</tr>
		<tr>
			<Td align='center'>1</Td>
			<td align='center'>월요일</td>
			<td>첫눈</td>
		</tr>
		<tr>
			<td align='center'>2</td>
			<td align='center'>화요일</td>
			<td>메모장 제작</td>
		</tr>
		<tr>
			<td align='center'>3</td>
			<td align='center'>수요일</td>
			<td>메모장 테스트</td>
		</tr>
	</table>
	<DIV class='content'>
		<A href='http://www.kma.go.kr'>기 상 청</A><br>
	</DIV>
	<DIV id='idcss'>
		<br> 고유한 css적용 <br> <br>
	</div>
	<DIV class='bottom'>하단 메뉴</div>
</body>
</html>
