<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp"%>
<%
	//dao빈즈사용
%>
<jsp:useBean id="dao" class="member.MemberDAO" />
<%
	//검색관련

	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));

	if (col.equals("total"))
		word = "";

	//페이징관련

	int nowPage = 1;
	int recordPerPage = 5;

	if (request.getParameter("nowPage") != null)
		nowPage = Integer.parseInt(request.getParameter("nowPage"));

	//DB에서 가져올 번호계산
	int sno = ((nowPage - 1) * recordPerPage) + 1;
	int eno = nowPage * recordPerPage;

	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);

	List<MemberDTO> list = dao.list(map);
	int totalRecord = dao.total(map);

	String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<script type="text/javascript">

function createForm(){
	var url = "createForm.jsp";

	location.href = url;
}

function read(id){
	var url = "<%=root%>/member/read.jsp";
	url = url + "?id=" +id;
	location.href = url;
	
}
</script>


<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>

</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<FORM name='frm' method='POST' action='./list.jsp'>

		<div class="search">

			<select name="col">


				<option value="id" <%if (col.equals("id"))
				out.print("selected");%>>아이디</option>

				<option value="email"
					<%if (col.equals("email"))
				out.print("selected");%>>이메일</option>

				<option value="mname"
					<%if (col.equals("mname"))
				out.print("selected");%>>성명</option>

				<option value="total">전체출력</option>

			</select> <input type="text" name="word" value="<%=word%>">
			<button>검색</button>
			<button type="button" onclick="location.href='<%=root%>/member/createForm.jsp'">회원가입</button>
		</div>
	</FORM>
		<div class="container">
		 <h2><span class="glyphicon glyphicon-th-list"></span>
		 회원목록
		 </h2>
	<%
		for(int i = 0; i < list.size(); i++){
		MemberDTO dto = list.get(i);
	%>


	<TABLE class="table table-hover">
		<tr>
			<td rowspan='5' style="width:30%">
			<img src='<%=root %>/member/storage/<%=dto.getFname() %>'>
			</td>
			<TH style="width:20%">아이디</TH>
			 <td style="width:50%"> 
				<a href="javascript:read('<%=dto.getId() %>')">
				<%=dto.getId() %>
			 </a>
			 </TD>
			
		</tr>

		<TR>
			<TH >이메일</TH>
			<TD ><%=dto.getEmail() %></TD>
		</TR>
		<TR>
			<TH >성명</TH>
			<TD ><%=dto.getMname() %></TD>
		</TR>
		<TR>
			<TH >주소</TH>
			<TD ><%=dto.getAddress1() %></td>
		</TR>
		<tr>
			<TH >상세주소</TH>
			<td ><%=dto.getAddress2() %></TD>
		</tr>	
	</TABLE>





	<%
		}
	%>


	<DIV class='bottom'>
		<%=paging%>
	</DIV>
</div>
	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
