<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밥풀</title>
<link href='${path}/resources/css/faq.css' rel='stylesheet' />
<link href="<%=request.getContextPath()%>/resources/css/header.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/footer.css"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://kit.fontawesome.com/94aab5b4e0.js" crossorigin="anonymous"></script>
<%
	request.setCharacterEncoding("UTF-8");
%>
</head>
<script>
	$('.accoArea').ready(function() {
		$('.accTit').on('click', function() {
			if ($(this).hasClass('on')) {
				slideUp(200);
			} else {
				slideUp();
				$(this).addClass('on').next().slideDown(200);
			}
			function slideUp() {
				$('.accTit').removeClass('on').next().slideUp(200);
			}
			;
		});
	});
</script>
<body>
	<%@include file="/WEB-INF/inc/header.jsp"%>
	<div class="wrap">
		<div class="content">
			<div class="head">
				<div class="title">FAQ</div>
				<div class="title-under"></div>
				<div class="head-nav">
					<div class="faq"><a href="${path }/marketList.do">MARKET</a></div>
					<div class="faq"><a href="${path }/freeBoardList.do">COMMUNITY</a></div>
					<div class="notice"><a href="${path }/noticeList.do">NOTICE</a></div>
					<div class="faq"><a href="#" style="color: black; text-decoration: underline;">FAQ</a>
					</div>
				</div>
			</div>
		</div>

		<div class="body-">
			<div class="accoArea">
				<c:forEach items="${faqList }" var="faq">
					<a href="#url" class="accTit"><i class="fa-solid fa-q"></i> ${faq.faqQuestion } </a>
					<div class="accBox">
						<ul>
							<li><i class="fa-solid fa-a"></i> ${faq.faqAnswer }</li>
						</ul>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="content_title"></div>
	</div>
	<%@include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>