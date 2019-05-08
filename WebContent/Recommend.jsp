<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Content</title>
<link rel="stylesheet" href="CSS/content.css">
</head>
<body>
	<table class="content">
		<tr>
			<td class="container" id="coral">
				<div class="overlay">
					<div class="text">
						<a href="ReTemplate.jsp?CONTENTPAGE=sleepProc.jsp&index=1">잠안올때</a>
					</div>
				</div>
			</td>
			<td class="container" id="lightblue"  colspan="2">
				<div class="overlay">
					<div class="text">
						<a href="ReTemplate.jsp?CONTENTPAGE=allProc.jsp&index=2">신날때</a>
					</div>
				</div>
			</td>
			<td class="container" id="yellow" rowspan="2">
				<div class="overlay">
					<div class="text">
						<a href="ReTemplate.jsp?CONTENTPAGE=allProc.jsp&index=3">우울할때</a>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td class="container" id="violet" colspan="2">
				<div class="overlay">
					<div class="text">
						<a href="ReTemplate.jsp?CONTENTPAGE=allProc.jsp&index=4">휴식할때</a>
					</div>
				</div>
			</td>
			<td class="container" id="black">
				<div class="overlay">
					<div class="text">
						<a href="ReTemplate.jsp?CONTENTPAGE=allProc.jsp&index=5">힙터질때</a>
					</div>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>