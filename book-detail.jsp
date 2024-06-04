<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>EBS | 상품리스트</title>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/css/book-detail.css" />
		<link rel="stylesheet" href="<%= request.getContextPath() %>/css/reset.css" />
		<link rel="stylesheet" href="<%= request.getContextPath() %>/css/global.css" />
	</head>
	<body>
		<div>
			<h2 class="book-detail-container">도서 상세 정보</h2>
			<div class="book-container">
				<div class="book-image">
					<img src="<%= request.getContextPath() %>/img/Clean Code in Python.jpg" alt="책 이미지" />
				</div>
				<div class="book-info">
					<div class="book-title">타이틀</div>
					<div class="book-author">김형석 저자(글)</div>
					<div class="book-publisher">21세기북스 (2024년 05월 08일 출판)</div>
					<div class="book-price">22,000원</div>
					<div class="add-to-cart">
						<button class="add-to-cart-button">
							<img
								src="<%= request.getContextPath() %>/src/shopping-cart-icon.png"
								alt="shopping-cart-icon"
								class="shopping-cart-icon"
							/>
							<p>장바구니 담기</p>
						</button>
					</div>
				</div>
			</div>
			<hr />
			<div class="book-description">
				올해 105세 한국 최고령 철학자이자 작가, 연세대 명예교수로서 이 시대 최후의 지성이라 불리는
				김형석 교수는 인간 존재에 대한 뛰어난 고찰로 각계각층 전문가가 먼저 가르침을 청하는 ‘큰
				어른’이다. 〈KBS NEWS 9〉 〈인간극장〉 〈EBS 초대석〉 〈MKTV〉 등 수많은 매체에 출연하며
				삶에 대한 탁월한 통찰을 부드럽고 유려한 언어로 선사해왔다. 그리고 삶의 지표를 잃어버린
				현대인이 단단한 삶을 살아갈 수 있도록, 100년 넘게 살아오며 얻은 인생의 진리와 깨달음을
				『김형석, 백 년의 지혜』에 고스란히 집대성했다.『김형석, 백 년의 지혜』는 저자의 경험을
				토대로 세 가지 관점으로 삶에 대한 통찰을 웅장하고 대담하게 제시한다. 첫째로 철학계
				거목으로서 빠르게 변화하는 세상에 바쁜 일상을 살아가는 대중이 잊어버린 사랑과 자유, 평화에
				대한 근원적인 질문과 해답을 던져준다. 둘째로 교육자로서 다가올 미래를 위해 후손에게 전해줘야
				할 정의는 무엇인지 다룬다. 마지막으로 일제강점기와 한국전쟁, 산업화와 민주화 시대의
				산증인으로서 이념적 갈등으로 위태로운 한국인에게 다정하지만 예리한 일침을 전해준다. 이 책은
				세상의 파도에 흔들리지 않는 인간을 만드는 최후의 가치를 사유토록 하여 인생의 스승이 필요한
				남녀노소에게 꼭 필요한 삶의 지침서가 되어줄 것이다.
			</div>
		</div>
	</body>
</html>
