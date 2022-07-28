<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='${path}/resources/css/noticeView.css' rel='stylesheet' />
<link href="<%=request.getContextPath()%>/resources/css/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/footer.css" rel="stylesheet">
 <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/94aab5b4e0.js" crossorigin="anonymous"></script>
<title>밥풀</title>
<%
	request.setCharacterEncoding("UTF-8");
%>
</head>
<body>

		<%@include file="/WEB-INF/inc/header.jsp" %>
	<div id="wrap">

		<div class="content">
			<div class="head">
				<div class="title">NOTICE</div>
				<div class="title-under"></div>
				<div class="head-nav">
					<div class="faq"><a href="${path }/marketList.do">MARKET</a></div>
					<div class="faq"><a href="${path }/freeBoardList.do">COMMUNITY</a></div>
					<div class="notice"><a href="#" style="color: black; text-decoration: underline;">NOTICE</a></div>
					<div class="faq"><a href="${path }/faq.do">FAQ</a></div>
				</div>
			</div>
         </div>
         			<div class="content_title"></div>

				<form action="<c:url value='/noticeEdit.do'/>" id="editor_form" method="post">
					<div id="div_table">
						<input type="hidden" name="noticeRegDate" value="${notice.noticeRegDate }">
						<%-- <input type="hidden" name="noticeModDate" value="${notice.noticeModDate }"> --%>
						<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
						<input type="hidden" name="noticeNo" value="${notice.noticeDelYn }">
						<table>
							<colgroup>
								<col width="200">
								<col width="550">
							</colgroup>
							
							<tr>
								<td class="td_left">제목</td>
								<td class="td_right">${notice.noticeTitle }</td>
							</tr>
							<tr>
								<td class="td_left">최근등록일자</td>
								<td class="td_right">${notice.noticeModDate eq null ? notice.noticeRegDate : notice.noticeModDate}</td>
							</tr>
							<tr>
								<td class="td_left">작성자</td>
								<td class="td_right">${notice.noticeWriter }</td>
							</tr>
							<tr>
								<td class="td_left">내용</td>
								<td class="td_right">
<!-- 									textAread 공백 주의 <textarea id="notice_content" -->
<%-- 										name="notice_content" cols="30" rows="10" readonly="readonly">${notice.noticeContent }</textarea> --%>
											${notice.noticeContent }
								</td>
							</tr>
							
						</table>
					</div>
					<!-- 버튼 -->
					<div id="div_button">
						<a class="attach-button" href="noticeList.do"><i>목록</i></a>
					<c:if test="${member.memManager eq 'y' }">
						<a class="attach-button" href="noticeEdit.do?noticeNo=${notice.noticeNo }"><i>수정</i></a> 
					</c:if>
					</div>
				</form>
	</div>

	<%@include file="/WEB-INF/inc/footer.jsp" %>
</body>
</html>