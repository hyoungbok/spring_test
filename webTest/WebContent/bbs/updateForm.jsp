<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp"%>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));

	BbsDTO dto = bdao.read(bbsno);
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
		return;
	}
	if(f.title.value==""){
		alert("제목을 입력해주세요")
		f.title.focus();
		return;
	}
	if(f.content.value==""){
		alert("내용을 입력해주세요")
		f.content.focus();
		return;
	}
	if(f.passwd.value==""){
		alert("비밀번호를 입력해주세요")
		f.passwd.focus();
		return;
	}
	f.submit();
}

</script> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">수정</DIV>
 
<FORM name='frm' method='POST' action='./updateProc.jsp'
		enctype="multipart/form-data">
	<input type="hidden" name="bbsno" value="<%=bbsno %>">
	<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
	<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
	<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
	<input type="hidden" name="oldfile" value="<%=dto.getFilename() %>">
  <TABLE>
    <TR>
      <TH>작성자</TH>
      <TD><input type="text" name="wname" value="<%=dto.getWname() %>"></TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" value="<%=dto.getTitle() %>"></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><textarea rows="10" cols="45" name="content"><%=dto.getContent() %></textarea></TD>
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
    <input type='button' value='수정' onclick="incheck(this.form)">
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 