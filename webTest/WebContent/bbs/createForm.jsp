<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp"%> 
<%
int bbsno = bdao.bbsnoForCreate();

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
div{
	text-align: center;
	margin: 10px 0px padding: 5px;
}
</style> 
<script type="text/javascript">
function incheck(f){
	if(f.name.value==""){
		alert("이름을 입력해주세요");
		f.name.focus();
		return false;
	}
	if(f.title.value==""){
		alert("제목을 입력해주세요")
		f.title.focus();
		return false;
	}
	if(f.content.value==""){
		alert("내용을 입력해주세요")
		f.content.focus();
		return false;
	}
	if(f.passwd.value==""){
		alert("비밀번호를 입력해주세요")
		f.passwd.focus();
		return false;
	}
	
}
</script>
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<div class="container">
<h2 class="	glyphicon glyphicon-glass">등록</h2>
<FORM name='frm' method='POST' action='./createProc.jsp' onsubmit='return incheck(this)'
		enctype="multipart/form-data">
  <input type="hidden" name="bbsno" value="<%=bbsno%>">
  <TABLE class="table table-bordered">
    <TR>
      <TH>작성자</TH>
      <TD><input type="text" name="wname"></TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title"></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><textarea rows="10" cols="45" name="content"></textarea></TD>
    </TR>
    <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="passwd"></TD>
    </TR>
    <TR>
      <TH>파일</TH>
      <TD><input type="file" name="filename"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='등록'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>




 
 </div>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 