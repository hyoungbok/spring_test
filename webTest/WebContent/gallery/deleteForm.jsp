<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<%
	 int gno = 9; 
	 /* int gno = Integer.parseInt(request.getParameter("gno"));  */

%>
 
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
<script type="text/javascript">
function incheck(f){
	if(f.passwd.value==""){
		alert("비밀번호을 입력하세요");
		f.passwd.focus();
		return false;
	}
}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">이미지삭제</DIV>

<FORM name='frm' method='POST' action='./deleteProc.jsp' 
onsubmit="return incheck(this)">>
	<input type="hidden" name="gno" value=<%=gno %>>
<div class="content">
삭제하면 복구 할 수 없습니다.<br>
삭제 하시겠습니까?
</div>
    <TABLE>
    <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="pw"></TD>
    </TR>
  </TABLE>
  <DIV class='bottom'>
    <input type='submit' value='삭제'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
