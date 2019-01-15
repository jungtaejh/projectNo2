<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dtodao.NoticeDTO"%>
<%@ page import="dtodao.NoticeDAO"%>
<jsp:useBean id="productDAO" class="dtodao.ProductDAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%

NoticeDTO dto = new NoticeDTO();

try {
String driverName = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:localhost:7777:XE";
Class.forName(driverName);
Connection con = DriverManager.getConnection(url,"system","1234");

String sql = "insert into notice (?,?,?,?)";
PreparedStatement ps = con.prepareStatement(sql);

ps.setString(1, dto.getIdx());
ps.setString(2, dto.getTitle());
ps.setString(3, dto.getTime());
ps.setString(4, dto.getContent());

ps.executeUpdate();		
con.close();
ps.close();

} catch (Exception e) {
	out.println("연결실패");
	out.println(e.getMessage());
	e.printStackTrace();
	} finally {
		out.print(dto.toString());
		out.print("<script>location.href='list.jsp';</script>");
	}
%>

//dto에 저장이 안됨

</head>
<body>

</body>
</html>