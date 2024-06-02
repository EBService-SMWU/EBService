<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>EBS | 로그인</title>
		<link rel="stylesheet" href="./css/login.css" />
		<link rel="stylesheet" href="./css/reset.css" />
		<link rel="stylesheet" href="./css/global.css" />
	</head>
	<body>
		<div class="login-box">
			<h2 class="login-title">로그인</h2>
			<div class="login-container">
				<form method="post" action="login_verify.jsp">
					<div class="login-content">
						<input type="text" name="userID" placeholder="아이디를 입력해 주세요" required />
					</div>
					<div class="login-content">
						<input
							type="password"
							name="userPassword"
							placeholder="비밀번호를 입력해 주세요"
							required
						/>
					</div>
					<button type="submit" class="login-btn">로그인</button>
				</form>
			</div>
			<div class="login-footer">
				<p class="new-message">EBook Service가 처음이신가요?</p>
				<div class="sign-up">
					<button class="sign-up-btn" onclick="location.href='sign-up.html'">회원가입</button>
				</div>
			</div>
		</div>
	</body>
</html>
