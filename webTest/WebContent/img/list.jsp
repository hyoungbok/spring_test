<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %> 
<jsp:useBean id ="dao" class="img.ImgDAO"/>
<%
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	
	if(col.equals("total")){
		word="";
	}
	int nowPage = 1;
	if(request.getParameter("nowPage")!=null){
		nowPage= Integer.parseInt(request.getParameter("nowPage"));
	}
	int recordPerPage = 5;
	int sno = ((nowPage-1)*recordPerPage)+1;
	int eno = nowPage*recordPerPage;
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno",eno);
	
	int totalRecord = dao.total(map);
	List<ImgDTO> list = dao.list(map);
	
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: ; 
  font-size: 24px; 
} 
.serch{
	width:80%;
	text-align:center;
	margin:20px auto;
}
</style> 
<script type="text/javascript">
	function read(no){
		var url="read.jsp";
		url=url+"?no="+no;
		
		location.href=url;
	}

</script>
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->

 <div class="serch">
 <FORM name='frm' method='POST' action='./list.jsp'>

 <select name="col">
<option value="name"
<%if(col.equals("name")) out.print("selected"); %>
>이름</option>
<option value="title"
<%if(col.equals("title")) out.print("selected"); %>
>제목</option>
<option value ="total">전체검색</option>
  </select>
 <input type="text" name="word" value="<%=word %>">
 <input type="submit" value="검색">
 <input type="button" value ="등록" onclick="location.href='createForm.jsp'">
</form>
 </div>
 <div class="container">
 <h2><span class="glyphicon glyphicon-th-list"></span>
 목록</h2>
  <TABLE class="table table-hover">
  
    <%if(list.size()==0){ %>
      
    <tr>
    	<td colspan="3">
    	등록된글이없습니다
    	</td>
    </tr>
    <%}else{
    	for(int i=0; i<list.size(); i++){
    	ImgDTO dto = list.get(i);%>
    <tr>
  	<td rowspan="3"	 width="30%">
<%
				for(int r=0;r<dto.getIndent();r++){
					out.print("&nbsp;&nbsp;");
				}if(dto.getIndent()>0){
					out.print("<img src='../images/re.jpg'> ");
				}
			%>
  	<a href="javascript:read('<%=dto.getNo() %>')">
  	<img src="./storage/<%=dto.getFname() %>" width="200px" height="130px">
  	</a>
  	 
  	<th>이름</th>
  	<td><%=dto.getName() %>
  	 
  	</td>
  	</tr>
  	
  	<tr>
  	<th>제목</th>
  	<td><%=dto.getTitle() %></td>
  	</tr>
  	<tr>
  	<th>등록일</th>
  	<td><%=dto.getMdate()%></td>
  	</tr>
  	
    <%} %>
    <%} %>
  </TABLE>
  
  <DIV class='bottom'>
   <%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>
  </DIV>
</div>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
 
</html> 