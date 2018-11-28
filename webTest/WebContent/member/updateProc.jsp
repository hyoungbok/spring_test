<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<jsp:useBean id="dto" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>


<%
	
	String id = request.getParameter("id");
	
	boolean flag = dao.update(dto);
	
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
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">회원정보수정확인</DIV>
 <div class="content">
 <%
 	if(flag){
 		out.print("회원정보가 수정되었습니다.");
 	}else{
 		out.print("회원정보 수정을 실패했습니다.");
 	}
 %>
 </div>

  
  <DIV class='bottom'>
    <input type='button' value='수정완료' onclick="location.href='../index.jsp'">
    <input type='button' value='뒤로가기' onclick="history.back()">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
