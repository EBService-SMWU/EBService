<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>EBS | 메인 페이지</title>
    <link rel="stylesheet" href="./css/top.css" />
    <link rel="stylesheet" href="./css/reset.css" />
    <link rel="stylesheet" href="./css/main.css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        table {
            width: 100%;
            margin: 0 auto;
            background-color: #ffffff;
            border: 1px solid #0075ff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        td {
            text-align: center;
            padding: 20px;
            border-bottom: 1px solid #0075ff;
        }
        td:last-child {
            border-bottom: none;
        }
        td a {
            text-decoration: none;
            color: #0075ff;
            font-weight: bold;
            display: inline-block;
            margin: 0 20px;
            padding: 10px 15px;
            transition: color 0.3s ease, background-color 0.3s ease;
            border-radius: 5px;
        }
        td a:hover {
            color: #ffffff;
            background-color: #0075ff;
        }
        .logo {
            display: inline-block;
            vertical-align: middle;
            height: 40px;
        }
        .separator {
            color: #0075ff;
            font-weight: bold;
        }
        .member-info {
            display: inline-block;
            vertical-align: middle;
            margin-left: 20px;
            text-align: left;
        }
        .message {
            display: block;
        }
        .points {
            display: block;
            margin-top: 5px;
        }
    </style>
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
                <b><a href="purchase-history.jsp">구매내역</a></b>
                <span class="separator">|</span>
                <b><a id="login-link" href="<%= session.getAttribute("isLoggedIn") != null ? "#" : "login.jsp" %>" onclick="loginClicked()"><%= session.getAttribute("isLoggedIn") != null ? "로그아웃" : "로그인" %></a></b>
                <div class="member-info">
                    <span class="message" id="login-message"><%= session.getAttribute("isLoggedIn") != null ? session.getAttribute("userName") + "님, 환영합니다!" : "로그인을 해주세요" %></span>
                    <span class="points" id="points-message"><%= session.getAttribute("isLoggedIn") != null ? session.getAttribute("points") + " 포인트 보유" : "" %></span>
                </div>
            </td>
        </tr>
    </table>

    <script>
        function loginClicked() {
            var loginLink = document.getElementById("login-link");
            if (loginLink.innerHTML === "로그인") {
                window.location.href = "login.jsp"; // 로그인 페이지로 이동
            } else {
                // 로그아웃 로직 추가
                window.location.href = "logout.jsp"; // 로그아웃 페이지로 이동
            }
        }

        // 페이지 로드 시 로그인 상태를 확인하여 버튼 상태 설정
        window.onload = function () {
            var isLoggedIn = "<%= session.getAttribute("isLoggedIn") != null %>";
            var loginLink = document.getElementById("login-link");
            var loginMessage = document.getElementById("login-message");
            var pointsMessage = document.getElementById("points-message");
            if (isLoggedIn === "true") {
                loginLink.innerHTML = "로그아웃";
                loginLink.href = "#"; // 로그아웃 동작 수행을 위해 href를 #으로 설정
                loginMessage.innerHTML = "<%= session.getAttribute("userName") %>님, 환영합니다!";
                pointsMessage.innerHTML = "<%= session.getAttribute("points") %> 포인트 보유";
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
