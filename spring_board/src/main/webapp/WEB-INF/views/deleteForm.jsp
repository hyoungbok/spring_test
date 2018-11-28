<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
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
</style> 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
<script type="text/javascript">
function incheck(f){
	if(f.passwd.value==""){
		alert("비번을 입력하세요");
		f.passwd.focus();
		return false;
	}
}
function blist(){
	var url = "list";
	
	location.href=url;
}
</script>
</head> 

<body>
<div class="container">
<c:choose>
<c:when test="${flag}">

답변글이 존재합니다.<br>
부모글을 삭제할 수 없습니다.<br>

<input type='button' value='목록' onclick="blist()">
</c:when>
<c:otherwise>

삭제하면 복구할 수 없습니다.<br>
<FORM name='frm' method='POST' action='./delete' 
      onsubmit="return incheck(this)">
<input type="hidden" name="num" value="${param.num }">
<input type="hidden" name="oldfile" value="${param.oldfile}">
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="nowPage" value="${param.nowPage}">
 
  <TABLE>
    <TR>
      <TH>패스워드</TH>
      <TD><input type="password" name="passwd"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='확인'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
</c:otherwise>
</c:choose>
</div>
</body>

</html> 