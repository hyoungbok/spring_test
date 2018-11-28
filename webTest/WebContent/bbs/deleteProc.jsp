<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp"%>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String passwd = request.getParameter("passwd");
	String oldfile = request.getParameter("oldfile");
	
	Map map = new HashMap();
	map.put("bbsno", bbsno);
	map.put("passwd", passwd);
	
	boolean pflag=bdao.passwdCheck(map);
	
	boolean flag=false;

	if(pflag){
		flag=bdao.delete(bbsno);
	}
	
	String upDir = application.getRealPath("/bbs/storage");
	
	if(flag){
		UploadSave.deleteFile(upDir, oldfile);
	}
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
function blist(){
	var url = "list.jsp";
	url = url + "?col=<%=request.getParameter("col")%>";
	url = url + "&word=<%=request.getParameter("word")%>";
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href=url;
} 
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">처리결과</DIV>
 <div class="content">
<%
 	if(pflag==false){
 		out.print("비밀번호 오류");
%>
 		  </div>
 		  <DIV class='bottom'>
 		    <input type='button' value='다시시도' onclick="history.back()">
 		    <input type='button' value='목록' onclick="blist()">
 		  </DIV>
<% 		
 	}else if(flag){
 		out.print("삭제 완료");
%>
   </div>
  <DIV class='bottom'>
  
    <input type='button' value='목록' onclick="blist()">
  </DIV> 	
<% 		
 	}else {
 		out.print("삭제 실패");
%>
	</div>
<div class='bottom'>
  <input type='button' value='다시시도' onclick="history.back()">
	<input type='button' value='목록' onclick="blist()">
</div>
<% 		 
 	}
%>
 



 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 