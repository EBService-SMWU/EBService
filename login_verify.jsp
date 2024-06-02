<%@ page contentType="text/html; charset=UTF-8" %> <%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>EBS | 상품리스트</title>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/css/reset.css" />
		<link rel="stylesheet" href="<%= request.getContextPath() %>/css/main.css" />
		<link rel="stylesheet" href="<%= request.getContextPath() %>/css/global.css" />
		<link rel="stylesheet" href="<%= request.getContextPath() %>/css/book-list.css" />
	</head>
	<body>
		<jsp:include page="top.jsp" />

		<div class="content">
			<!-- 도서 리스트 -->
			<main class="book-list">
				<% Connection myConn = null; Statement stmt = null; ResultSet myResultSet = null; String
				dburl = "jdbc:oracle:thin:@localhost:1521:xe"; String dbUser = "db2110423"; String dbPasswd
				= "oracle"; String jdbc_driver = "oracle.jdbc.driver.OracleDriver"; try {
				Class.forName(jdbc_driver); myConn = DriverManager.getConnection(dburl, dbUser, dbPasswd);
				stmt = myConn.createStatement(); String mySQL = "SELECT product_id, product_name, author,
				product_image FROM PRODUCT"; myResultSet = stmt.executeQuery(mySQL); boolean hasResults =
				false; while (myResultSet.next()) { hasResults = true; String productId =
				myResultSet.getString("product_id"); String productName =
				myResultSet.getString("product_name"); String author = myResultSet.getString("author");
				String productImage = myResultSet.getString("product_image"); %>
				<a href="#" class="book-container-link">
					<div class="book-container">
						<div class="book-image">
							<img
								src="<%= request.getContextPath() %>/<%= productImage %>"
								alt="<%= productName %> 이미지"
							/>
						</div>
						<h3 class="title"><%= productName %></h3>
						<p class="author"><%= author %></p>
						<div class="btn-container">
							<div class="detail-btn">
								<button class="detail-view-link">상세보기</button>
							</div>
							<div class="cart-btn">
								<button class="add-to-cart-btn" data-product-id="<%= productId %>">
									장바구니 담기
								</button>
							</div>
						</div>
					</div>
				</a>
				<% } if (!hasResults) { out.println("
				<p>상품이 없습니다.</p>
				"); } } catch (SQLException ex) { out.println("SQLException: " + ex.getMessage()); } catch
				(ClassNotFoundException ex) { out.println("ClassNotFoundException: " + ex.getMessage()); }
				finally { try { if (myResultSet != null) myResultSet.close(); if (stmt != null)
				stmt.close(); if (myConn != null) myConn.close(); } catch (SQLException ex) {
				out.println("SQLException: " + ex.getMessage()); } } %>
			</main>
		</div>

		<!-- 알림창 -->
		<div class="notification" id="notification">장바구니에 담았습니다</div>
		<div class="notification" id="already-in-cart">이미 담긴 제품입니다</div>

		<!-- 자바스크립트  -->
		<script>
			document.addEventListener("DOMContentLoaded", function () {
				// 장바구니담기 버튼 클릭시, 장바구니 상태 확인 및 알림창
				const cartButtons = document.querySelectorAll(".add-to-cart-btn");
				const notification = document.getElementById("notification");
				const alreadyInCartNotification = document.getElementById("already-in-cart");

				cartButtons.forEach((button) => {
					button.addEventListener("click", function () {
						const productId = this.getAttribute("data-product-id");
						fetch("<%= request.getContextPath() %>/CheckBasketServlet", {
							method: "POST",
							headers: {
								"Content-Type": "application/x-www-form-urlencoded",
							},
							body: `userId=<%= (String) session.getAttribute("user_id") %>&productId=${productId}`,
						})
							.then((response) => response.json())
							.then((data) => {
								if (data.exists) {
									alreadyInCartNotification.style.display = "block";
									setTimeout(() => {
										alreadyInCartNotification.style.display = "none";
									}, 2000);
								} else {
									notification.style.display = "block";
									setTimeout(() => {
										notification.style.display = "none";
									}, 1000);
								}
							})
							.catch((error) => console.error("Error:", error));
					});
				});

				// 상세보기 버튼 클릭시, 해당 페이지로 이동
				const detailViewButtons = document.querySelectorAll(".detail-view-link");

				detailViewButtons.forEach((button) => {
					button.addEventListener("click", function () {
						window.location.href = "<%= request.getContextPath() %>/book-detail.jsp";
					});
				});
			});
		</script>
	</body>
</html>
