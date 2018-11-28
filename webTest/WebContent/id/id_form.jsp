<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
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
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<body> 

<div class=title>ID확인</div>
<form name="frm" method="post" action="./id_proc.jsp">
<div class=content>아이디를 입력하세요</div>
<table>
<tr>
<th>아이디
</th>
<td><input type="text" name="id"></td>
</tr>
</table>
<div class=bottom>
<input type="submit" value="중복확인">
<input type="button" value="취소" onclick="window.close()">

</div>
</form>

</body> 
</html> 