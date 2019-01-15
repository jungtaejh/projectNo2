<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@ page import="dtodao.NoticeDAO"%>
<%@ page import="dtodao.NoticeDTO"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="productDAO" class="dtodao.ProductDAO" />
<!DOCTYPE html>

<html>
<head>
<title>제품 목록 리스트</title>

<jsp:include page="adminTop.jsp"></jsp:include><br><br><br><br><br>

     
 <%
NoticeDTO dto = new NoticeDTO();

	
%>


</head>
<body>
	<h3>공지사항</h3>
<div class="table-responsive">
  <table class="table table-bordered" width="100%" cellspacing="0" style="text-align: center;">
																	<!-- 가운데정렬    -->
 
  <tr>
      <th scope="col" width="60" >번호</th>
      <td><%=dto.getIdx() %></td>
      <th scope="col">작성자</th>
      <td>관리자</td>
      <th scope="col" width="600">제목</th>
      <td><%=dto.getTitle() %></td>
      <th scope="col">날짜</th>
  	  <td><%=dto.getTime() %></td>
    </tr>
    <tbody>
	<tr>
		<th colspan="2">내용</th>
		<td colspan="6"><%= dto.getContent() %></td>
	</tr>
	</tbody>
	</table>
	<a href="delete.jsp?idx=<%=dto.getIdx() %>">게시글 삭제</a>
	<a href="list.jsp">목록</a>
	</div>



<%

%>

</body>
</html>


<!-- 3.숫자 증가-->
<!-- 4.content.jsp 5.delete.jsp  -->

