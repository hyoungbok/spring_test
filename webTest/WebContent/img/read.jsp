<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
 <jsp:useBean id="dao" class="img.ImgDAO"/>
 <%
 	int no = Integer.parseInt(request.getParameter("no"));
 	ImgDTO dto = dao.read(no);
 	  List list = dao.Imgread(no);
 	int[] no1 = (int[])list.get(0);
 	  String[] fname1 = (String[])list.get(1);
 
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
td{
	text-align: center;
}
</style> 
<script type="text/javascript">
function list(){
	var url= "list.jsp";

	location.href=url;
}
function del(){
	var url = "deleteForm.jsp";
	url += "?no=<%=request.getParameter("no")%>";
	location.href=url;
}

function imgread(no1){
	var url = "read.jsp";
	url += "?no="+no1;
	location.href=url;
}

</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<div class="container">
<h2><span class="glyphicon glyphicon-th list"></span>
조회
</h2>
 

  <TABLE class="table table-bordered">
    <TR>
      <td rowspan="5" width="50%">
      <img width="500px" height="250px" src= "./storage/<%=dto.getFname()%>"></TD>
      <TH style="text-align: center; margin-top: auto;">제목</TH>
      <td style="text-align: center; margin-top: auto;"><%=dto.getTitle() %>      
      </td>
    </TR>
    <tr>
    <th style="text-align: center; margin-top: auto;">작성자</th>
    <td style="text-align: center; margin-top: auto;"><%=dto.getName() %></td>
    </tr>
   
  </TABLE>
  <table style="margin-left: auto; margin-right: auto;">
  <tr> 
  <%
  for(int i=0;i<5;i++){
		  if(fname1[i]==null){%>
	<td  style="padding: 10px" width="180px" height="120px" ></td>	

	<%  }else{
		if(no1[i]==no){%>
	<td style="padding: 10px"><img width="180px" height="120px" src="./storage/<%=fname1[i] %>"></td>
	<%	}else{%>
	<td style="padding: 10px"><a href="javascript:imgread('<%=no1[i] %>')"><img width="180px" height="120px" src="./storage/<%=fname1[i] %>"></a></td>	
	<%}
		
	}
  }%>



  
  

  
  
  </table>
  
  <DIV class='bottom' style="text-align: center">
    <input type="button" value='수정' onclick="location.href='updateForm.jsp?no=<%=request.getParameter("no")%>'">
    <input type='button' value='목록' onclick="location.href='list.jsp'">
    <input type='button' value='답변' onclick="location.href='reply.jsp'">
    <input type='button' value='삭제' onclick="del()">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
