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

<head>
<link href="<%=request.getContextPath()%>/resources/css/noticeList.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/footer.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://kit.fontawesome.com/94aab5b4e0.js"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>밥풀</title>
</head>

<body>
		<%@include file="/WEB-INF/inc/header.jsp"%>
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

		<div class="body-">

			<div class="content_title"></div>

			<!-- board seach area -->
			<div id="board-search">
				<div class="container">
					<div class="search-window">
						<form name="search" action="noticeList.do" method="post">
							<input type="hidden" name="curPage" value="${searchVO.curPage }">
							<input type="hidden" name="rowSizePerPage" value="${searchVO.rowSizePerPage }">
							<div class="search-wrap">
								<label for="search" class="blind">공지사항 내용 검색</label> <input id="search" type="search"
									name="searchWord" placeholder="검색어를 입력해주세요." value="${searchVO.searchWord }">
								<button type="submit" class="btn btn-dark">검색</button>
							</div>
						</form>
					</div>
				</div>
			</div>

			<!-- board list area -->
			<div id="board-list">
				<table class="board-table">
					<thead>
						<tr>
							<th scope="col" class="th-num"></th>
							<th scope="col" class="th-title">제목</th>
							<th scope="col" class="th-date">등록일</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="notice" items="${noticeList }">
							<tr>
								<td>${notice.noticeNo }</td>
								<th><a href="noticeView.do?noticeNo=${notice.noticeNo }">${notice.noticeTitle }</a>
								</th>
								<td>${notice.noticeModDate eq null ? notice.noticeRegDate : notice.noticeModDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:if test="${member.memManager eq 'y' }">
					<a href="noticeForm.do" class="attach-button"><i class="fa-solid fa-pen"></i> 글쓰기</a>
				</c:if>
			</div>
		</div>

		<div class="page_wrap">
			<div class="page_nation">

				<!-- 첫 페이지  -->
				<a class="arrow pprev" href="noticeList.do?curPage=1" data-page="1"></a>

				<!-- 이전 페이지 -->
				<c:if test="${searchVO.firstPage != 1 }">
					<a class="arrow prev"
						href="noticeList.do?curPage=${searchVO.firstPage -1 }"
						data-page="${searchVO.firstPage -1 }"></a>
				</c:if>

				<!-- 페이지 넘버링  -->
				<c:forEach begin="${searchVO.firstPage }"
					end="${searchVO.lastPage }" var="i">
					<c:if test="${searchVO.curPage eq i}">
						<a href="#" style="font-weight: bold">${i }</a>
					</c:if>
					<c:if test="${searchVO.curPage ne i }">
						<a href="noticeList.do?curPage=${i }" data-page="${i }">${i }</a>
					</c:if>
				</c:forEach>
				<!-- 다음  페이지  -->
				<c:if test="${searchVO.lastPage ne searchVO.totalPageCount }">
					<a class="arrow next"
						href="noticeList.do?curPage=${searchVO.lastPage + 1 }"
						data-page="${searchVO.lastPage + 1 }"></a>
				</c:if>

				<!-- 마지막 페이지 -->
				<a class="arrow nnext"
					href="noticeList.do?curPage=${searchVO.totalPageCount }"
					data-page="${searchVO.totalPageCount }"></a>
			</div>
		</div>
	</div>

	<%@include file="/WEB-INF/inc/footer.jsp"%>

</body>

<script type="text/javascript">
	// 변수 정의
	$form = $("form[name='search']");
	$curPage = $form.find("input[name='curPage']");

	// 각 이벤트 등록
	// 페이지 링크 클릭, event전파방지, data속성값읽고 form태그 내의 input name=curPage값 바꾸기 
	//submit
	$('.page_nation a[data-page]').click(function(e) {
		e.preventDefault();

		$curPage.val($(this).data("page"));
		$form.submit();
	}); // ul.pagination li a[data-page]

	//form태그내의 버튼 클릭
	//이벤트전파방지, curPage 값 1로
	//submit
	$form.find("button[type=submit]").click(function(e) {
		e.preventDefault();
		$curPage.val(1);
		$form.submit();
	});

	// 목록 갯수 변경
	// id_rowSizePerPage 변경되었을 때
	// 페이지 1, 목록수 = 현재값 으로 변경 후 서브밋
	$('#id_rowSizePerPage').change(function(e) {
		// 			e.preventDefault();
		$form.find("input[name='rowSizePerPage']").val($(this).val());
		$form.submit();
	}); // '#id_rowSizePerPage'.change

	// 초기화 버튼 클릭
	$('#id_btn_reset').click(
			function() {
				$form.find("select[name='searchType'] option:eq(0)").attr(
						"selected", "selected");
				$form.find("select[name='searchCategory'] option:eq(0)").prop(
						"selected", "selected");
				$form.find("input[name='searchWord']").val('');
			}); // #id_btn_reset.click
</script>

</html>