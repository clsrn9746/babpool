<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<script>
	function myPageLogin() {
		alert("로그인이 필요합니다!")
		location.replace("loginPage.do");
	}
	function logout() {
		alert("로그아웃 되었습니다.")
		location.replace("logOut.do");
	}
</script>

<div class="header">
		<div class="logo">
		<a href="${path}/main.do"><img src="${path }/resources/images/babpoollogo5.png"></a>
		</div>
		<div class="menu-bar">
			<li><a href="${path }/main.do" class="link">약속 잡기</a></li>
			<li><a href="${path}/recommend.do" class="link">오늘의
					음식</a></li>
			<li><a href="${path}/marketList.do" class="link">밥풀 마켓</a></li>
			<li><a href="${path}/freeBoardList.do" class="link">커뮤니티</a></li>
			<li><a href="${path}/noticeList.do" class="link">NOTICE</a></li>
			<li><a href="${path}/faq.do" class="link">FAQ</a></li>
		</div>
		<div class="info">
		<c:if test="${member != null }">
			<li><a href="${path}/mypage.do" style="color: gray" id="myPage">마이페이지</a></li>
			<li><a onclick="logout()" style="color: gray;" id="logout">로그아웃</a></li>
		</c:if>
		<c:if test="${member == null }">
			<li><a href="${path }/loginPage.do" style="color: gray">로그인</a></li>
			<li><a href="${path }/join.do" style="color: gray">회원가입</a></li>
		</c:if>
		</div>
	</div>
