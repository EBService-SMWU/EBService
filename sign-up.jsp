<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>EBS | 회원가입</title>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sign-up.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/reset.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css" />
	</head>
	<body>
		<div class="signup-page">
			<div class="signup-box">
				<h2 class="signup-title">회원 가입</h2>

				<div class="signup-container">
					<div class="signup-content">
						<p>이름</p>
						<div class="signup-content-input">
							<input
								type="text"
								name="name"
								id="name"
								minlength="2"
								placeholder="2 ~ 7글자 한글로 작성해주세요."
							/>
							<span id="nameCheck"></span>
						</div>
					</div>

					<div class="signup-content">
						<p>닉네임</p>
						<div class="signup-content-input">
							<input
								type="text"
								name="nickName"
								id="nickName"
								minlength="2"
								maxlength="5"
								placeholder="2 ~ 7글자 한글로 작성해주세요."
							/>
							<span id="nickNameCheck"></span>
						</div>
					</div>

					<div class="signup-content">
						<p>이메일</p>
						<div class="signup-content-input">
							<input type="email" name="email" id="email" placeholder="ebservice@sookmyung.ac.kr" />
							<span id="emailCheck"></span>
						</div>
					</div>

					<div class="signup-content">
						<p>비밀번호</p>
						<div class="signup-content-input">
							<input
								type="password"
								name="password"
								id="password"
								minlength="8"
								placeholder="영어+숫자를 조합하여 8자 이상 작성해주세요."
							/>
							<span id="passwordCheck"></span>
						</div>
					</div>

					<div class="signup-content">
						<p>비밀번호 확인</p>
						<div class="signup-content-input">
							<input type="password" id="passwordConfirm" />
							<span id="passwordConfirmCheck"></span>
						</div>
					</div>

					<div class="signup-content">
						<p>생년월일</p>
						<div class="signup-content-input">
							<input type="date" id="birthDate" />
							<span id="birthDateCheck"></span>
						</div>
					</div>

					<div class="signup-content">
						<p>휴대폰 번호</p>
						<div class="signup-content-input">
							<input
								type="tel"
								id="phoneNumber"
								pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}"
								placeholder="010-1234-5678"
							/>
							<span id="phoneNumberCheck"></span>
						</div>
					</div>
				</div>

				<button id="signup-button" onclick="handleSignUpButtonClick()">가입하기</button>
			</div>

			<div class="signup-completion-modal-overlay" style="display: none">
				<div class="signup-completion-modal">
					<h2>가입 성공!</h2>
					<p>EBService 가입을 축하합니다!!</p>
					<div class="signup-completion-modal-button-wrapper">
						<button onclick="handleSignUpCompletionModalCloseButtonClick()">로그인하러 가기</button>
					</div>
				</div>
			</div>
		</div>

		<script>
			// 이름 유효성 검사
			function checkValidationForName() {
				const regName = /^[가-힣]{2,7}$/;
				const nameInputElement = document.getElementById("name");

				if (nameInputElement.value === "") {
					return { isError: true, message: "필수 입력 항목입니다!" };
				} else if (!regName.test(nameInputElement.value)) {
					return { isError: true, message: "이름은 2 ~ 7글자 한글로 구성해주세요!" };
				} else {
					return { isError: false, message: "멋진 이름이네요!" };
				}
			}

			// 닉네임 유효성 검사
			function checkValidationForNickname() {
				const regNickname = /^[가-힣]{2,7}$/;
				const nicknameInputElement = document.getElementById("nickName");

				if (nicknameInputElement.value === "") {
					return { isError: true, message: "필수 입력 항목입니다!" };
				} else if (!regNickname.test(nicknameInputElement.value)) {
					return { isError: true, message: "닉네임은 2 ~ 7글자 한글로 구성해주세요!" };
				} else {
					return { isError: false, message: "멋진 닉네임이군요!" };
				}
			}

			// 이메일 유효성 검사
			function checkValidationForEmail() {
				const regEmail =
					/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
				const emailInputElement = document.getElementById("email");

				if (emailInputElement.value === "") {
					return { isError: true, message: "필수 입력 항목입니다!" };
				} else if (!regEmail.test(emailInputElement.value)) {
					return { isError: true, message: "올바른 메일 형식이 아닙니다!" };
				} else {
					return { isError: false, message: "올바른 메일 형식입니다!" };
				}
			}

			// 비밀번호 유효성 검사
			function checkValidationForPassword() {
				const regPassword = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,25}$/;
				const passwordInputElement = document.getElementById("password");

				if (passwordInputElement.value === "") {
					return { isError: true, message: "필수 입력 항목입니다!" };
				} else if (!regPassword.test(passwordInputElement.value)) {
					return { isError: true, message: "영어+숫자를 조합하여 8자 이상 작성해주세요." };
				} else {
					return { isError: false, message: "안전한 비밀번호입니다!" };
				}
			}

			// 비밀번호 확인 유효성 검사
			function checkValidationForPasswordConfirm() {
				const regPasswordCheck = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,25}$/;
				const passwordConfirmInputElement = document.getElementById("passwordConfirm");

				if (passwordConfirmInputElement.value === "") {
					return { isError: true, message: "비밀번호를 입력해주세요!" };
				} else if (!regPasswordCheck.test(passwordConfirmInputElement.value)) {
					return { isError: true, message: "영어+숫자를 조합하여 8자 이상 작성해주세요." };
				} else if (
					passwordConfirmInputElement.value !== document.getElementById("password").value
				) {
					return { isError: true, message: "비밀번호가 일치하지 않습니다." };
				} else {
					return { isError: false, message: "비밀번호가 일치합니다." };
				}
			}

			// 생년월일 유효성 검사
			function checkValidationForBirthDate() {
				const birthDateInputElement = document.getElementById("birthDate");

				if (birthDateInputElement.value === "") {
					return { isError: true, message: "필수 입력 항목입니다!" };
				} else {
					return { isError: false, message: "올바른 생년월일입니다!" };
				}
			}

			// 휴대폰 번호 유효성 검사
			function checkValidationForPhoneNumber() {
				const regPhoneNumber = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
				const phoneNumberInputElement = document.getElementById("phoneNumber");

				if (phoneNumberInputElement.value === "") {
					return { isError: true, message: "필수 입력 항목입니다!" };
				} else if (!regPhoneNumber.test(phoneNumberInputElement.value)) {
					return { isError: true, message: "올바른 휴대폰 번호 형식이 아닙니다!" };
				} else {
					return { isError: false, message: "올바른 휴대폰 번호입니다!" };
				}
			}

			// 회원가입 버튼 클릭 핸들러
			function handleSignUpButtonClick() {
				const nameValidation = checkValidationForName();
				const nicknameValidation = checkValidationForNickname();
				const emailValidation = checkValidationForEmail();
				const passwordValidation = checkValidationForPassword();
				const passwordConfirmValidation = checkValidationForPasswordConfirm();
				const birthDateValidation = checkValidationForBirthDate();
				const phoneNumberValidation = checkValidationForPhoneNumber();

				document.getElementById("nameCheck").innerText = nameValidation.message;
				document.getElementById("nickNameCheck").innerText = nicknameValidation.message;
				document.getElementById("emailCheck").innerText = emailValidation.message;
				document.getElementById("passwordCheck").innerText = passwordValidation.message;
				document.getElementById("passwordConfirmCheck").innerText =
					passwordConfirmValidation.message;
				document.getElementById("birthDateCheck").innerText = birthDateValidation.message;
				document.getElementById("phoneNumberCheck").innerText = phoneNumberValidation.message;

				if (
					!nameValidation.isError &&
					!nicknameValidation.isError &&
					!emailValidation.isError &&
					!passwordValidation.isError &&
					!passwordConfirmValidation.isError &&
					!birthDateValidation.isError &&
					!phoneNumberValidation.isError
				) {
					document.querySelector(".signup-completion-modal-overlay").style.display = "block";
				}
			}

			function handleSignUpCompletionModalCloseButtonClick() {
				document.querySelector(".signup-completion-modal-overlay").style.display = "none";
				window.location.href = "login.html";
			}
		</script>
	</body>
</html>
