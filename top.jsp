<%@ page contentType="text/html; charset=UTF-8" %> <%@ page import="javax.servlet.http.*,
javax.servlet.*" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>EBS | 메인 페이지</title>
		<link rel="stylesheet" href="./css/top.css" />
		<link rel="stylesheet" href="./css/reset.css" />
		<link rel="stylesheet" href="./css/main.css" />
		<link rel="stylesheet" href="./css/top.css" />
	</head>
	<body>
		<table>
			<tr>
				<td>
					<img src="src/logo.png" alt="logo" class="logo" />
					<b><a href="my-library.jsp">나의 서재</a></b>
					<span class="separator">|</span>
					<b><a href="shopping-cart.jsp">장바구니</a></b>
					<span class="separator">|</span>
					<b><a href="purchase_list.jsp">구매내역</a></b>
					<span class="separator">|</span>
					<b
						><a id="login-link" href="#" onclick="loginClicked()"
							><%= session.getAttribute("isLoggedIn") != null ? "로그아웃" : "로그인" %></a
						></b
					>
					<div class="member-info">
						<span class="message" id="login-message"
							><%= session.getAttribute("isLoggedIn") != null ? session.getAttribute("user_name") +
							"님, 환영합니다!" : "로그인을 해주세요" %></span
						>
						<span class="points" id="points-message"
							><%= session.getAttribute("isLoggedIn") != null ? session.getAttribute("point") + "
							포인트 보유" : "" %></span
						>
					</div>
				</td>
			</tr>
		</table>

		<script>
			function loginClicked() {
			    var loginLink = document.getElementById("login-link");
			    if (loginLink.innerHTML === "로그인") {
			        window.location.href = "login.jsp";
			    } else {
			        window.location.href = "logout.jsp";
			    }
			}

			// 페이지 로드 시 로그인 상태를 확인하여 버튼 상태 설정
			window.onload = function () {
			    var isLoggedIn = "<%= session.getAttribute("isLoggedIn") != null ? "true" : "false" %>";
			    var loginLink = document.getElementById("login-link");
			    var loginMessage = document.getElementById("login-message");
			    var pointsMessage = document.getElementById("points-message");

			    if (isLoggedIn === "true") {
			        loginLink.innerHTML = "로그아웃";
			        loginLink.href = "#";
			        loginMessage.innerHTML = "<%= session.getAttribute("user_name") != null ? session.getAttribute("user_name") : "" %>님, 환영합니다!";
			        pointsMessage.innerHTML = "<%= session.getAttribute("point") != null ? session.getAttribute("point") : "" %> 포인트 보유";
			    } else {
			        loginLink.innerHTML = "로그인";
			        loginLink.href = "login.jsp";
			        loginMessage.innerHTML = "로그인을 해주세요";
			        pointsMessage.innerHTML = "";
			    }
			};
		</script>
	</body>
</html>
