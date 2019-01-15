<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@ page import="dtodao.NoticeDTO"%>
<%@ page import="dtodao.NoticeDAO"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="NoticeDAO" class="dtodao.NoticeDAO" />
<!DOCTYPE html>

<html>
<head>
<title>제품 목록 리스트</title>

<jsp:include page="adminTop.jsp"></jsp:include><br><br><br><br><br><br></br>
 
</head>
<body>

	   <%   
          NoticeDAO dao = new NoticeDAO();
          NoticeDTO dto = new NoticeDTO();
        %>
                  
	<h3>공지사항</h3>
	
<div class="table-responsive">

  <table class="table table-bordered" width="100%" cellspacing="0" style="text-align: center;">
	
  <thead>
    <tr>
      <th scope="col" width="60" >번호</th>
      <th scope="col">작성자</th>
      <th scope="col" width="600">제목</th>
      <th scope="col">날짜</th>
    </tr>
  </thead>
  <tbody>
		<tr>
		<td  id="idx"><%= dto.getIdx() %></td>
		<td>관리자</td>
		<td  id="title"><%= dto.getTitle() %></td>
		<td  id="content"><%= dto.getContent() %> <a href = 'content.jsp'></a></td>
		</tr>

  </tbody>
</table>
	<a href="noticeWrite.jsp"><button type="button">글쓰기</button></a>
</div>

</body>
</html>


<!-- dto가 아니라 db에서 가져와야함
select * from notice
 -->

<!-- 3.숫자 증가-->
<!-- 4.content.jsp 5.delete.jsp  -->

