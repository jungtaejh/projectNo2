<%@ page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html" charset="UTF-8">
<title>게시판 내용을 보자용 </title>


</head>

<%
	String idx = request.getParameter("idx");

try{
    String driverName = "oracle.jdbc.driver.OracleDriver"; 
    
    String url = "jdbc:oracle:thin:@localhost:7777:XE";
	ResultSet rs = null;

	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url, "system", "1234");
	out.println("Oracle DataBase Connection Success.");
	
	Statement stmt = con.createStatement();
	String sql = "SELECT * from test where idx = " + idx;
	rs = stmt.executeQuery(sql);
	
	while(rs.next()){
	
%>

<body>
	<h1>게시글 조회</h1>
	<table border ="1">
		<tr>
			<th>번호</th>
			<td><%=rs.getString("idx") %></td>
			<th>작성자</th>
			<td>관리자 </td>
			<th>날짜</th> 
			<td><%=rs.getString("time") %></td>
		</tr>
		<tr>
			<th colspan="2">제목</th>
			<td colspan="6"><%=rs.getString("title") %></td>
		</tr>
		<tr>
			<th colspan="2">내용</th>
			<td colspan="6"><%=rs.getString("content") %></td>
		</tr>
	</table>

<%	
	}
	con.close();
}catch(Exception e){
	out.println("Oracle Database Connection Problem <hr>");
	out.println(e.getMessage());
	e.printStackTrace();
}
%>



</body>
</html>


-------------------------------------------------------------------------------------------------

<%-- 
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.BBSDTO"%>
<%@page import="bean.BBSDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
   <head>
      <title>등록한 글</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="assets/css/main.css" />
      <script type="text/javascript">
      
      function update() {
         var   title = document.getElementById("title").value;
         var   write = document.getElementById("write").value;
         var id = "1";
         var id2 = "1";
         var date = document.getElementById("date").value;
         var view = document.getElemeentById("view").value;
         /* document.write(title);
         document.write(write); */
         
         location.href="bbsSave.jsp?&title=" + title + "&write=" + write + "&id=" + id + "&id2=" + id2 +"&date=" + date + "&view=" + view+ "&num=" + num;
         
         alert('수정완료');
      }
      
      </script>
   </head>
   <body class="no-sidebar is-preload" style="color:black">
      <div id="page-wrapper">

         <!-- Header -->
            <section id="header" class="wrapper">

               <!-- Logo -->
                  <div id="logo">
                     <h1>당신이 쓴 글</h1>
                     <p>일단 보겠습니다.</p>
                  </div>

               <!-- Nav -->
                  <nav id="nav">
                     <ul>
                        <li><a href="index.html">Home</a></li>
                        <li>
                           <a href="#">Dropdown</a>
                           <ul>
                              <li><a href="#">Lorem ipsum</a></li>
                              <li><a href="#">Magna veroeros</a></li>
                              <li><a href="#">Etiam nisl</a></li>
                              <li>
                                 <a href="#">Sed consequat</a>
                                 <ul>
                                    <li><a href="#">Lorem dolor</a></li>
                                    <li><a href="#">Amet consequat</a></li>
                                    <li><a href="#">Magna phasellus</a></li>
                                    <li><a href="#">Etiam nisl</a></li>
                                    <li><a href="#">Sed feugiat</a></li>
                                 </ul>
                              </li>
                              <li><a href="#">Nisl tempus</a></li>
                           </ul>
                        </li>
                        <li><a href="left-sidebar.html">Left Sidebar</a></li>
                        <li><a href="right-sidebar.html">Right Sidebar</a></li>
                        <li class="current"><a href="no-sidebar.html">Login</a></li>
                     </ul>
                  </nav>

            </section>

         <!-- Main -->
            <div id="main" class="wrapper style2">
               <div class="title">글 보기</div> 
               <div class="container">
               <div style="text-align:center;">
                  <table class = "bbs">
                  <%   
                     Date now = new Date();
                     SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
                     String date = sf.format(now);
                     
                     String num = request.getParameter("num");
                     String title = request.getParameter("title");
                     String id = request.getParameter("id");
                     String day = request.getParameter("date");
                     int view = request.getContentLength();
                     String write = request.getParameter("write");
                     
                     BBSDAO dao = new BBSDAO();
                     BBSDTO dto = dao.select(title);
                     BBSDTO dto2 = dao.writeUpdate(title,write);
                  %>
                     <tr>
                        <td style ="width: 20%;">글 번호</td>
                        <td colspan="2" id="num" value="<%= dto.getNum() %>"><%= dto.getNum() %></td>
                     </tr>
                     <tr>
                        <td style ="width: 20%;">제목</td>
                        <td colspan="2"><input type="text" name = "title" value = "<%= title %>"></td>
                     </tr>
                     <tr>
                        <td style ="width: 20%;">작성자</td>
                        <td colspan="2"><%= id %></td>
                     </tr>
                     <tr>
                        <td style ="width: 20%;">작성한 날짜</td>
                        <td colspan="2"><%= day %></td>
                     </tr>
                     <tr>
                        <td style ="width: 20%;">조회수</td>
                        <td colspan="2" id="view" value="<%= dto.getView() %>"><%= dto.getView() %></td>
                     </tr>
                     <tr>
                        <td style ="width: 20%;">작성한 글</td>
                        <td><textarea rows="15" cols="80" id="write"><%= dto.getWrite() %></textarea></td>
                     </tr>
                     
               </table>
               <button type = "button" onclick="location.href='BBS.jsp' ">목록</button>
               <button type = "button">답글</button>
               <button type = "button" onclick="update();">수정</button>
               </div>
               </div>
            </div>
         </div>

   </body>
</html>

 --%>