<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page
import="java.sql.*, java.io.*" %> <% String userID = request.getParameter("user_id"); String
password = request.getParameter("password"); String userName = request.getParameter("user_name");
String birth = request.getParameter("birth"); String phone = request.getParameter("phone"); String
email = request.getParameter("email"); Connection myConn = null; PreparedStatement pstmt = null;
String dburl = "jdbc:oracle:thin:@localhost:1521:xe"; String dbUser = "db2110423"; String dbPasswd =
"oracle"; String dbDriver = "oracle.jdbc.driver.OracleDriver"; try { // 드라이버 로드
Class.forName(dbDriver); // myConn 생성 myConn = DriverManager.getConnection(dburl, dbUser,
dbPasswd); out.println("DB 연결 성공<br />"); String mySQL = "INSERT INTO USERS (user_id, password,
user_name, birth, phone, email, point, create_date) VALUES (?, ?, ?, ?, ?, ?, 200000,
SYSTIMESTAMP)"; // pstmt 생성 pstmt = myConn.prepareStatement(mySQL); pstmt.setString(1,
userID.trim()); pstmt.setString(2, password.trim()); pstmt.setString(3, userName.trim());
pstmt.setString(4, birth.trim()); pstmt.setString(5, phone.trim()); pstmt.setString(6,
email.trim()); // sql문 실행 int result = pstmt.executeUpdate(); if (result > 0) {
out.println("회원가입 성공<br />"); session.setAttribute("user", userID);
response.sendRedirect("login.jsp"); } else { out.println("
<script>
	alert("회원가입에 성공했습니다. 로그인 화면으로 이동합니다.");
	location.href = "login.jsp";
</script>
"); session.setAttribute("user", userID); } } catch (Exception e) { out.println("
<script>
	alert("회원가입 처리 중 오류가 발생했습니다.");
	location.href = "signup.jsp";
</script>
"); } finally { try { if (pstmt != null) pstmt.close(); if (myConn != null) myConn.close(); } catch
(SQLException ex) { StringWriter sw = new StringWriter(); ex.printStackTrace(new PrintWriter(sw));
out.println("오류: " + sw.toString() + "<br />"); } } %>
