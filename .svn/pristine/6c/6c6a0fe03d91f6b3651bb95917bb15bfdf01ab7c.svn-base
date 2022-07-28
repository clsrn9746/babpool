<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<%-- 	<link href="<%=request.getContextPath() %>/resources/css/notice2.css" rel="stylesheet"> --%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<head>
<meta charset="UTF-8">
<title>밥풀</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" href="${path}/resources/css/recommend.css">
</head>
<%
	request.setCharacterEncoding("utf-8");
%>

<body>

	<div id="wrap">

		<%@include file="/WEB-INF/inc/header.jsp"%>

		<div class="wordCloud">
			<div class="wordCloudWrap">
				<h3>오늘의 인기 메뉴</h3>
				<div class="menu_img">
					<img src="${path}/resources/images/Figure_1.png" />
				</div>
			</div>
		</div>
		

		<div class="recommendWrap">
			<h2> ${member.memId }</h2>님이 좋아할 친구

			<div class="recommendList">
				<c:forEach items="${recommendList }" var="recommend">
						<div class="recommendItem" data-memid="${member.memId }"
							data-foodno="${recommend.foodNo  }">
							<p class="re_content">${recommend.foodTitle}<br>
								${recommend.foodScore}<br>
								${recommend.foodCategory}
							</p>
							<img src="${recommend.foodImg}">
						</div>
				
				</c:forEach>
	  	</div>


			</div>





		</div>
		<%@include file="/WEB-INF/inc/footer.jsp"%>
</body>
<script type="text/javascript">



</script>
</html>