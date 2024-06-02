<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page
import="java.sql.*" %> <% String userID = request.getParameter("userID"); String userPassword =
request.getParameter("userPassword"); // 디버깅 메시지 추가 out.println("입력된 userID: [" + userID
+ "]<br />"); out.println("입력된 userPassword: [" + userPassword + "]<br />"); Connection myConn =
null; PreparedStatement pstmt = null; ResultSet myResultSet = null; String dburl =
"jdbc:oracle:thin:@localhost:1521:xe"; String dbUser = "db2110423"; String dbPasswd = "oracle";
String dbDriver = "oracle.jdbc.driver.OracleDriver"; try { Class.forName(dbDriver); myConn =
DriverManager.getConnection(dburl, dbUser, dbPasswd); out.println("DB 연결 성공<br />"); String
mySQL = "SELECT user_id, user_name, point FROM USERS WHERE user_id = ? AND password = ?"; pstmt =
myConn.prepareStatement(mySQL); pstmt.setString(1, userID.trim()); pstmt.setString(2,
userPassword.trim()); myResultSet = pstmt.executeQuery(); out.println("쿼리 실행 성공<br />"); if
(myResultSet.next()) { out.println("로그인 성공<br />"); session.setAttribute("user",
myResultSet.getString("user_id")); session.setAttribute("isLoggedIn", true);
session.setAttribute("userName", myResultSet.getString("user_name")); session.setAttribute("points",
myResultSet.getInt("point")); response.sendRedirect("main.jsp"); } else { out.println("일치하는
회원정보가 없습니다.<br />"); out.println("
<script>
	alert("일치하는 회원정보가 없습니다.");
	location.href = "login.jsp";
</script>
"); } } catch (Exception e) { e.printStackTrace(); out.println("오류: " + e.getMessage() + "<br />");
out.println("
<script>
	alert("로그인 처리 중 오류가 발생했습니다.");
	location.href = "login.jsp";
</script>
"); } finally { try { if (myResultSet != null) myResultSet.close(); if (pstmt != null)
pstmt.close(); if (myConn != null) myConn.close(); } catch (SQLException ex) { ex.printStackTrace();
} } %>
