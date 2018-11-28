<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp"%>
<%
	//검색관련 처리
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	
	
	if(col.equals("total")) word="";
	
	//paging관련
	int nowPage = 1;			//현재페이지번호
	int recordPerPage = 5;		//목록 행의 개수
	
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage")); //null값 number format exception 오류 위험
	}
	//DB에서 가져올 레코드의 순번
	int sno = ((nowPage-1)*recordPerPage) + 1;
	int eno = nowPage * recordPerPage;
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);

	List<BbsDTO> list = bdao.list(map);
	//전체 레코드 갯수(col, word)
	
	int totalRecord = bdao.total(map);   
	
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
/* *{ 
  font-family: gulim; 
  font-size: 20px; 
}
div{
	text-align: center;
	margin: 10px 0px padding: 5px;
} */
.search{
	width:80%;
	text-align:center;
	margin:2px auto;
} 
</style>
<script type="text/javascript">
function read(bbsno){
	var url = "read.jsp";
	url = url + "?bbsno="+bbsno;
	url = url + "&col=<%=col%>";
	url = url + "&word=<%=word%>";
	url = url + "&nowPage=<%=nowPage%>";
	location.href=url;
	
}
function fileDown(filename){
	var url = "<%=root%>/download";
	url = url + "?filename="+filename;
	url = url + "&dir=/bbs/storage";
	
	location.href = url;
}
</script> 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 

 
 <div class="search">
 <form method="post" action="./list.jsp">
 <select name="col">
 <option value="wname"
 <%if(col.equals("wname")) out.print("selected"); %>
 >성명</option>
 <option value="title"
  <%if(col.equals("title")) out.print("selected"); %>
 >제목</option>
 <option value="content"
  <%if(col.equals("content")) out.print("selected"); %>
 >내용</option>
 <option value="total">전체출력</option>
 </select>
 <input type="text" name="word" value="<%=word %>">
 <button>검색</button>
 <button type="button" onclick="location.href='createFrom.jsp'">등록</button>
 </form>
 
 </div>
<div class="container">
<h2>
<span class="glyphicon glyphicon-euro"></span>
목록</h2>
  <TABLE class="table table-hover">
  <thead>
    <TR>
      <TH>번호</TH>
      <TH>제목</TH>
      <TH>글쓴이</TH>
      <TH>조회수</TH>
      <TH>등록일</TH>
      <Th>파일명</Th>
   </TR>
   </thead>
 <%
 if(list.size()==0){
 %>
 <tbody>
	 <tr>
	 	<td colspan='6'>
	 	등록된 글이 없습니다.</td>
	 </tr>
	 </tbody>
 <%
 } else {
	 
	 for(int i=0; i<list.size();i++){
		 BbsDTO dto = list.get(i);
 %>
 
<tbody>
   <tr>
   	  <td><%=dto.getBbsno() %></td>
   	  <td width="60%">
   	  <%
   	  for(int r=0; r<dto.getIndent();r++){
   		  out.print("&nbsp;&nbsp;");
   	  }
   	  if(dto.getIndent()>0)
   		  out.print("<img src='../menu/images/re.jpg'>");
   	  %>
   	  <a href="javascript:read('<%=dto.getBbsno()%>')"><%=dto.getTitle() %></a>
   	  <%
   	  
   	  if(Utility.compareDay(dto.getWdate()))
   		  out.print("<img src='../menu/images/new.gif'>");
   	  
   	  %>
   	  
   	  </td>
   	  
   	  <td><%=dto.getWname() %></td>
   	  <td><%=dto.getViewcnt() %></td>
   	  <td><%=dto.getWdate() %></td>
   	  
   	  <td>
   	  <%if(dto.getFilename()!=null) {%>
   		<a href="javascript:fileDown('<%=dto.getFilename()%>')">
        <span class="glyphicon glyphicon-download-alt"></span>
      </a>
      <% 
   	  }else{
   		  out.print("파일없음");
   	  }
   	  %>
   	  </td>
   </tr>
   </tbody>
 <%
	 }//for-end
	 
 }//if-end
 %>  
  </TABLE>
  
  <DIV class='bottom' ">
  <%= Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>
   <input type='button' value='등록' onclick="location.href='createForm.jsp'">
  </DIV>

 
 </div>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 