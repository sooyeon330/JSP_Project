<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<link rel="stylesheet" href="CSS/recss.css">
</head>
<body>

<div class="slideshow-container">

<div class="mySlides fade">
  		<img src="img/sleepimg.jpg">
		<div class="rdiv">
		<h1>잠 안 올때</h1>
		<div>
			hello
		</div>
		</div>
</div>

<div class="mySlides fade">
  		<img src="img/excitedimg.png">
		<div class="rdiv">
		<h1>신날때</h1>
		</div>
</div>

<div class="mySlides fade">
  		<img src="img/pool.jpg">
		<div class="rdiv">
		<h1>우울할때</h1>
		</div>
</div>

<div class="mySlides fade">
  		<img src="img/rest.jpg">
		<div class="rdiv">
		<h1>휴식할때</h1>
		</div>
</div>

<div class="mySlides fade">
  		<img src="img/hip.jpg">
		<div class="rdiv">
		<h1>힙할때</h1>
		</div>
</div>

<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div>
<br>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
  <span class="dot" onclick="currentSlide(4)"></span> 
  <span class="dot" onclick="currentSlide(5)"></span> 
</div>
<%
	request.setCharacterEncoding("utf-8");
	int index = Integer.valueOf(request.getParameter("index"));
%>
<script>
var slideIndex = <%=index %>;
showSlides(slideIndex);

function plusSlides(n) {
  gopage(slideIndex += n);
}

function currentSlide(n) {
	gopage(slideIndex = n);
}

function showSlides(n) {
		var i;
		var slides = document.getElementsByClassName("mySlides");
		var dots = document.getElementsByClassName("dot");
		var page;
		
		if (n > slides.length) {
			slideIndex = 1;
		}
		if (n < 1) {
			slideIndex = slides.length;
		}
		
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex - 1].style.display = "block";
		dots[slideIndex - 1].className += " active";
	
}
function gopage(n){
	
	var slides = document.getElementsByClassName("mySlides");
	var dots = document.getElementsByClassName("dot");
	
	if (n > slides.length) {
		n = 1;
	}
	if (n < 1) {
		n = slides.length;
	}
	
 	switch(n){
	case 1 : page = "sleep"; break;
	case 2 : page = "exciting"; break;
	case 3 : page = "sad"; break;
	case 4 : page = "rest"; break;
	case 5 : page = "hip"; break;
	default: page = "soloProc.jsp";
	} 
/* 	location.href= "main.jsp"; */
 	location.href= "ReTemplate.jsp?CONTENTPAGE=showRe.jsp&index="+n+"&List="+page;
}
</script>

</body>
</html> 
