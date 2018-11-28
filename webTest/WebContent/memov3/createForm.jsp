<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
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
function incheck(f){
	if(f.title.value==""){
		alert("제목을 입력하세요.");
		f.title.focus();
		return false;
	}
	if(f.content.value==""){
		alert("내용을 입력하세요.");
		f.content.focus();
		return false;
	}
}
</script> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<body> 
<jsp:include page="/menu/top.jsp" flush="false" />
<div>등록</div>
<form name="frm" method="post" action="./createProc.jsp"
onsubmit="return incheck(this)">
<table>
<tr>
<th>제목</th>
<td>
<input type="text" name="title" size="30" value="두시회의">
</td>
</tr>
<tr>
<th>내용</th>
<td>
<textarea rows="10" cols="30" name="content">

</textarea>
</td>
</tr>
</table>
<div>
<input type="submit" value="전송">

</div>

</form>
<jsp:include page="/menu/bottom.jsp" flush="false" />
</body> 
</html> 