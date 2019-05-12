<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="CSS/cover.css">
</head>
<body>
	<div id="btn">
		<button onclick="show('your')">너의멜로디가 되어줄게</button>
		<button onclick="show('mask')">복면가왕</button>
	</div>
	<div class="video">
		<div id="your">
			<iframe width="600" height="400"
				src="https://www.youtube.com/embed/HFdMzBXnwMo" frameborder="0"
				allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
				allowfullscreen></iframe>
		</div>
		<div id="mask">
			<div class="grid-container">
				<div class="grid-item">
					<iframe
						src='https://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=9007C33B8A58284A54463298814B7B8562AE&outKey=V1239a24599c755e4d1ff346ff3fb11fe605a8cbb91067d143a7b346ff3fb11fe605a&controlBarMovable=true&jsCallable=true&isAutoPlay=true&skinName=tvcast_white'
						frameborder='no' scrolling='no' marginwidth='0' marginheight='0'
						WIDTH='300' HEIGHT='200' allow=' autoplay' allowfullscreen></iframe>
				</div>
				<div class="grid-item">
					<iframe
						src='https://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=4911E89B669493E81DEDDED0B06BBC892E14&outKey=V127f3c7d12051f5165c81d496879eb567a696bfa5b12a028f4c21d496879eb567a69&controlBarMovable=true&jsCallable=true&isAutoPlay=true&skinName=tvcast_white'
						frameborder='no' scrolling='no' marginwidth='0' marginheight='0'
						WIDTH='300' HEIGHT='200' allow=' autoplay' allowfullscreen></iframe>
				</div>
				<div class="grid-item">
					<iframe
						src='https://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=2EBF16AF5E11B991D09559498E28E4722CA9&outKey=V126f575720a2cd46b6a45b6d9c178be30775dcf3414a9cba17615b6d9c178be30775&controlBarMovable=true&jsCallable=true&isAutoPlay=true&skinName=tvcast_white'
						frameborder='no' scrolling='no' marginwidth='0' marginheight='0'
						WIDTH='300' HEIGHT='200' allow=' autoplay' allowfullscreen></iframe>
				</div>
				<div class="grid-item">
					<iframe
						src='https://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=52CEC0D477A2D6D2728D5B6D9C178BE30775&outKey=V129198d9dbf2be74e94d26ae0e820ef3dc32ebe8b99003dfc51c26ae0e820ef3dc32&controlBarMovable=true&jsCallable=true&isAutoPlay=true&skinName=tvcast_white'
						frameborder='no' scrolling='no' marginwidth='0' marginheight='0'
						WIDTH='300' HEIGHT='200' allow=' autoplay' allowfullscreen></iframe>
				</div>
				<div class="grid-item">
					<iframe
						src='https://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=CC0C1858A616C2CC630D46F67A43B7F141B1&outKey=V126c75922d35c404f5d26ac265f0176e6ecc58ab8b11097a46d16ac265f0176e6ecc&controlBarMovable=true&jsCallable=true&isAutoPlay=true&skinName=tvcast_white'
						frameborder='no' scrolling='no' marginwidth='0' marginheight='0'
						WIDTH='300' HEIGHT='200' allow='autoplay' allowfullscreen></iframe>
				</div>
				<div class="grid-item"></div>
				<div class="grid-item"></div>
				<div class="grid-item"></div>
				<div class="grid-item"></div>
			</div>
		</div>
		<div id="test">
			<iframe
				src='https://serviceapi.rmcnmv.naver.com/flash/outKeyPlayer.nhn?vid=9007C33B8A58284A54463298814B7B8562AE&outKey=V1239a24599c755e4d1ff346ff3fb11fe605a8cbb91067d143a7b346ff3fb11fe605a&controlBarMovable=true&jsCallable=true&isAutoPlay=true&skinName=tvcast_white'
				frameborder='no' scrolling='no' marginwidth='0' marginheight='0'
				WIDTH='80%' HEIGHT='504 allow=' autoplay' allowfullscreen></iframe>
		</div>
	</div>

	<script>
		var you = document.getElementById('your');
		var mask = document.getElementById('mask');
		var test = document.getElementById('test');
		function show(div) {
			var showdiv = document.getElementById(div);
			you.style.display = "none";
			mask.style.display = "none";
			test.style.display = "none";
			if (showdiv.style.display === "none") {
				showdiv.style.display = "block";
			} else {
				showdiv.style.display = "none";
			}
		}
	</script>
</body>
</html>