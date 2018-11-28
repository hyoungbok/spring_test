<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="memo.MemoDAO" />
<%
	String col=Utility.checkNull(request.getParameter("col"));
	
	String word=Utility.checkNull(request.getParameter("word"));
	
	if(col.equals("total")) word="";
	
	int nowPage=1;
	int recordPerPage=5;
	
	if(request.getParameter("nowPage")!=null){
		nowPage=Integer.parseInt(request.getParameter("nowPage"));
	}
	
	int sno=((nowPage-1)*recordPerPage)+1;
	int eno=nowPage*recordPerPage;
	
	
	
	Map map=new HashMap();
	map.put("col",col);
	map.put("word",word);
	map.put("sno",sno);
	map.put("eno",eno);



	List<MemoDTO> list = dao.list(map);
	
	int totalRecord=dao.total(map);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	function read(memono) {
		//alert(memono);
		var url = "./read.jsp";
		url = url + "?memono=" + memono;
		url+="&col=<%=col%>";
		url+="&word=<%=word%>";
		url+="&nowPage=<%=nowPage%>";
		location.href = url;

	}
</script>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}

table {
	width: 30%;
	margin: auto;
}

div {
	text-align: center;
	margin: 10px 0px;
	padding: 5px;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px;
}

a:LINK {
	color: #000000;
	text-decoration: none;
}

a:VISITED {
	color: #000000;
	text-decoration: none;
}

a:HOVER {
	color: #ff0000;
	text-decoration: none;
}

a:ACTIVE {
	color: #000000;
	text-decoration: none;
}
.search{
	margin:2px auto;
	text-align:center;
}
</style>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/menu/top.jsp" flush="false" />
	<div class="title">메모목록</div>
<form method="post" action="./list.jsp">
	<div class="search">
	<select name="col">
	<option value="title" <%if(col.equals("title"))out.print("selected"); %>>제목</option>
	<option value="content"<%if(col.equals("content"))out.print("selected"); %>>내용</option>
	<option value="total"<%if(col.equals("total"))out.print("selected"); %>>전체출력</option>
	</select>
	<input type="text" name="word" value="<%=word %>">
	<button>검색</button>
	<button type="button" onclick="location.href='createForm.jsp'">등록</button>
	</div>
	</form>
	<div class="content">
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회수</th>
		
		</tr>
		<%
			if (list.size() == 0) {
		%>
		<tr>
			<td colspan="7">등록된 메모가 없습니다.</td>
		</tr>
		<%
			} else {
				for (int i = 0; i < list.size(); i++) {
					MemoDTO dto = list.get(i);
		%>
		<tr>
			<td><%=dto.getMemono()%></td>
			<td  style='text-align:left; width:auto'>
			<%
			for(int r=0;r<dto.getIndent();r++){
				out.print("&nbsp;&nbsp;");	
			}
			if(dto.getIndent()>0)
			out.print("<img src='../menu/images/re.png' width='20' height='20' alt='' />");
			%>
			<a href="javascript:read('<%=dto.getMemono()%>')" class="link"><%=dto.getTitle()%></a>
			<%
			if(Utility.compareDay(dto.getWdate()))
				out.print("<img src='../menu/images/new.jpg' width='20' height='20' alt='' />");
			%>
			
			</td>
			<td><%=dto.getWdate()%></td>
			<td><%=dto.getViewcnt()%></td>
		</tr>
		<%
				} //for-end
			} //if-end
		%>
	</table>
	</div>
	<div class="bottom">
	<%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>
	</div>
<jsp:include page="/menu/bottom.jsp" flush="false" />	
</body>
</html>