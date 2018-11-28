<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp"%> 
<% int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	BbsDTO dto = bdao.replyRead(bbsno);	
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
 
<DIV class="title">답변</DIV>
 
<FORM name='frm' method='POST' action='./replyProc.jsp' 
		enctype = "multipart/form-data">
	<!--  답변있는 부모글의 삭제를 못하게 하기 위해서 -->
	<input type="hidden" name="bbsno" value="<%=dto.getBbsno() %>">
	<!--  답변에 필요한 부모자료들 -->
	<input type="hidden" name="grpno" value="<%=dto.getGrpno() %>">
	<input type="hidden" name="indent" value="<%=dto.getIndent() %>">
	<input type="hidden" name="ansnum" value="<%=dto.getAnsnum() %>">
	<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
	
	<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
	<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
  <TABLE>
    <TR>
      <TH>작성자</TH>
      <TD><input type="text" name="wname"></TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" value="re:<%=dto.getTitle() %>"></TD>
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
    <input type='submit' value='등록' onclick="incheck(this.form)">
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 