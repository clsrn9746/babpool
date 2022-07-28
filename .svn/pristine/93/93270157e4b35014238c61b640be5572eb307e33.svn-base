<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='${path}/resources/css/marketList.css' rel='stylesheet' />
<link href="<%=request.getContextPath()%>/resources/css/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/footer.css" rel="stylesheet">
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/94aab5b4e0.js" crossorigin="anonymous"></script>
<title>밥풀</title>
<%
	request.setCharacterEncoding("UTF-8");
	String user = String.valueOf(session.getAttribute("member"));
%>
</head>
<body>
		<%@include file="/WEB-INF/inc/header.jsp"%>
	<div id="wrap">
	
	<div class="content">
			<div class="head">
				<div class="title">MARKET</div>
				<div class="title-under"></div>
				<div class="head-nav">
					<div class="faq"><a href="#" style="color: black; text-decoration: underline;">MARKET</a></div>
					<div class="faq"><a href="${path }/freeBoardList.do">COMMUNITY</a></div>
					<div class="notice"><a href="${path }/noticeList.do">NOTICE</a></div>
					<div class="faq"><a href="${path }/faq.do">FAQ</a></div>
				</div>
			</div>
		</div>

		<div class="body-">

			<div class="content_title"></div>

		<!-- board list area -->
			<div id="board-search">
				<div class="container">
					<div class="search-window">
						<form name="search" action="marketList.do" method="post">
							<input type="hidden" name="curPage" value="${search.curPage }">
							<input type="hidden" name="rowSizePerPage" value="${search.rowSizePerPage }">
							<div class="search-wrap">
								<label for="search" class="blind">마켓 내용 검색</label> <input id="search" type="search"
									name="searchWord" placeholder="검색어를 입력해주세요." value="${search.searchWord }">
								<button type="submit" class="btn btn-dark">검색</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			
			<div class="market_list">

				<c:forEach items="${marketList }" var="marketList">
				<c:set var="block" value="false"/>
					<c:forEach items="${blockMemberList }" var="blockCheck">
						<c:if test="${marketList.marketNickname eq blockCheck.blockMemnick }">
								<c:set var="block" value="true"/>
						</c:if>
					</c:forEach>
					<c:choose>
						<c:when test="${block }">
							<div class="market_frame">
								<a class="market_content" href="marketView.do?marketNo=${marketList.marketNo }">
									<div class="market_photo">
											<img src="${path}/resources/images/block.png" width="200" height="200" alt="">
									</div>
									<div class="market_title" style="text-decoration: line-through;">차단 회원 장터 글</div>
									<div class="market_price" style="text-decoration: line-through;">${marketList.marketPrice }원</div>
								</a>
							</div>
						</c:when>
						<c:when test="${not block }">
							<div class="market_frame">
								<a class="market_content" href="marketView.do?marketNo=${marketList.marketNo }">
									<div class="market_photo">
										<c:if test="${marketList.attaches[0] ne null }">
											<c:if test="${marketList.marketCategory eq '판매완료'}">
											<img src="${path}/resources/images/sell.png" width="200" height="200" alt="">
											</c:if>
											<c:if test="${marketList.marketCategory eq '삽니다' or marketList.marketCategory eq '팝니다'}">
											<img src="${path}/marketImage.do?fileName=${marketList.attaches.get(0).atchName}" width="200" height="200" alt="">
											</c:if>
										</c:if>
									</div>
									<div class="market_title">[${marketList.marketCategory}] ${marketList.marketTitle }</div>
									<div class="market_price">${marketList.marketPrice }원</div>
								</a>
							</div>
						</c:when>
					</c:choose>
				</c:forEach>
			</div>
			<c:if test="${member ne null }">
		<a href="marketForm.do" class="attach-button"><i class="fa-solid fa-pen"></i> 글쓰기</a>
		</c:if>
		</div>

		<div class="page_wrap">
			<div class="page_nation">

				<!-- 첫 페이지  -->
				<a class="arrow pprev" href="marketList.do?curPage=1" data-page="1"></a>

				<!-- 이전 페이지 -->
				<c:if test="${search.firstPage != 1 }">
					<a class="arrow prev"
						href="marketList.do?curPage=${search.firstPage -1 }"
						data-page="${search.firstPage -1 }"></a>
				</c:if>

				<!-- 페이지 넘버링  -->
				<c:forEach begin="${search.firstPage }" end="${search.lastPage }"
					var="i">
					<c:if test="${search.curPage eq i}">
						<a href="#" style="font-weight: bold">${i }</a>
					</c:if>
					<c:if test="${search.curPage ne i }">
						<a href="marketList.do?curPage=${i }" data-page="${i }">${i }</a>
					</c:if>
				</c:forEach>
				<!-- 다음  페이지  -->
				<c:if test="${search.lastPage ne search.totalPageCount }">
					<a class="arrow next"
						href="marketList.do?curPage=${search.lastPage + 1 }"
						data-page="${search.lastPage + 1 }"></a>
				</c:if>

				<!-- 마지막 페이지 -->
				<a class="arrow nnext"
					href="marketList.do?curPage=${search.totalPageCount }"
					data-page="${search.totalPageCount }"></a>
			</div>
		</div>
		
	</div>
	<%@include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>