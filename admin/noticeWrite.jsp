<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@ page import="dtodao.NoticeDTO"%>
<%@ page import="dtodao.NoticeDAO"%>
<j:useBean id="productDAO" class="dtodao.ProductDAO" />
<!DOCTYPE html>

<html>
<head>
<title>제품 목록 리스트</title>
<script>
		function checkContent() {

			var temp1 = document.getElementById('date');
			var temp2 = document.getElementById('subject');
			var temp3 = document.getElementById('content');

			if (temp1.value.length == 0 || temp2.value.length == 0
					|| temp3.value.length == 0) {

				alert('작성하지 않은 내용이 있습니다.');

				return false;

			} else {
				
				<%
				NoticeDTO dto = new NoticeDTO();
				NoticeDAO dao = new NoticeDAO();
				int count = 1;
				int idx = count++;
				String title = request.getParameter("Title");
				String time = request.getParameter("Time");
				String content = request.getParameter("Content");
				dao.noticeWrite(dto);
				%>
				
				return true;
			}

		}
	</script>
</head>
<body>
<%-- <jsp:include page="adminTop.jsp"></jsp:include><br><br><br><br><br><br></br> --%>

//db 연결 실패 or 성공? 
//connetion 은 되는데 테이블을 못찾고있음
//dao 맞게 써있는지
//list 페이지 연동제대로 시키기
//하단 페이지넘김 만들기
//검색 수정 삭제 crud 제대로
// 

	<form action="list.jsp">
		작성자 : 관리자 <br>
		<br />
		<!-- 작성자 항상 고정되게 하기 -->
		날짜 : <input id="date" type="text" name="time" /> <br>
		<br /> 제목 : <input id="subject" type="text" name="title" /> <br>
		<br />
		<textarea id="content" rows="20" cols="130" name="content"></textarea>
		<br />
		
		<input type="submit" onclick="return checkContent();" />
	</form>
	
</body>
</html>