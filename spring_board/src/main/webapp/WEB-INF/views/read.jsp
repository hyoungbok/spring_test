<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function del(){
	var url = "delete";
	url += "?col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	url += "&num=${dto.num}";
	url += "&oldfile=${dto.filename}";
	
	location.href=url;
}

function fileDown(){
	var url = "${pageContext.request.contextPath}/download";
	
	url += "?filename=${dto.filename}";
	url += "&dir=/storage";
	
	location.href=url;
}

function replyb(){
	var url = "reply";
	url += "?col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	url += "&num=${dto.num}";
	
	location.href=url;
}
function updateb(){
	var url = "update";
	url += "?col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	url += "&num=${dto.num}";
	
	location.href=url;
}
function listb(){
	var url = "list";
	url += "?col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";

	
	location.href=url;
}
</script>
</head>
<body>
<div class="container">
  <h2>조회</h2>
  <table class="table">
   
      <tr>
        <th>성명</th>
        <td>${dto.name}</td>
       </tr>
    
      <tr>
        <th>제목</th>
        <td>${dto.subject}</td>
      </tr>
      <tr>
        <th>내용</th>
        <td>${content }</td>
      </tr>
      <tr>
        <th>파일</th>
        <td>
        
        <c:choose>
         <c:when test="${empty dto.filename }">파일없음</c:when>
         <c:otherwise>
          <a href="javascript:fileDown()">${dto.filename}(${dto.filesize})</a>           
         </c:otherwise>
        </c:choose>  
        
        </td>
      </tr>
      <tr>
        <th>등록일</th>
        <td>${dto.regdate}</td>
      </tr>
      <tr>
        <th>조회수</th>
        <td>${dto.count}</td>
      </tr>
      <tr>
        <th>아이피</th>
        <td>${dto.ip}</td>
      </tr>

  </table>
  <button onclick="listb()">목록</button>
  <button onclick="updateb()">수정</button>
  <button onclick="del()">삭제</button>
  <button onclick="replyb()">답변</button>
</div>

</body>
</html>