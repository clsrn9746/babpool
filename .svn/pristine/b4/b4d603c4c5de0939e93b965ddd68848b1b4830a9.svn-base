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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<head>
<meta charset="UTF-8">
<title>밥풀</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${path}/resources/css/freeBoardList.css">
<link href="<%=request.getContextPath()%>/resources/css/header.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/footer.css"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/94aab5b4e0.js"
	crossorigin="anonymous"></script>
</head>
<%
	request.setCharacterEncoding("utf-8");
%>

<body>
	<%@include file="/WEB-INF/inc/header.jsp"%>

	<div id="wrap">

		<div class="content">
			<div class="head">
				<div class="title">COMMUNITY</div>
				<div class="title-under"></div>
				<div class="head-nav">
					<div class="faq"><a href="${path }/marketList.do">MARKET</a></div>
					<div class="faq"><a href="#" style="color: black; text-decoration: underline;">COMMUNITY</a></div>
					<div class="notice"><a href="${path }/noticeList.do">NOTICE</a></div>
					<div class="faq"><a href="${path }/faq.do">FAQ</a></div>
				</div>
			</div>
		</div>
		<div class="body-">
			<div class="content_title"></div>
			<!-- board search area -->
			<div id="board-search">
				<div class="container">
					<div class="search-window">
						<form name="search" action="freeBoardList.do" method="post">
							<input type="hidden" name="curPage" value="${searchVO.curPage }">
							<input type="hidden" name="rowSizePerPage"
								value="${searchVO.rowSizePerPage }">
							<div class="search-wrap">
								<label for="search" class="blind">자유게시판 내용 검색</label> <input
									id="search" type="search" name="searchWord"
									placeholder="검색어를 입력해주세요." value="${searchVO.searchWord }">
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
							<th scope="col" class="th-writer">작성자</th>
							<th scope="col" class="th-date">등록일</th>
						</tr>
					</thead>

					<tbody>

						<c:forEach items="${freeNoticeList }" var="freeNotice">
							<tr>
								<td style="color: red; font-weight: bold;"></td>
								<td><a style="color: red;"
									href="noticeView.do?noticeNo=${freeNotice.noticeNo }">${freeNotice.noticeTitle }</a></td>
								<td style="color: red;">${freeNotice.noticeWriter }</td>
								<td style="color: red;">${freeNotice.noticeModDate eq null ? freeNotice.noticeRegDate : freeNotice.noticeModDate}</td>
							</tr>
						</c:forEach>
						
						
							<c:forEach items="${freeBoardList }" var="freeBoard">
							<c:set var="block" value="false"/>
								<c:forEach items="${blockMemberList }" var="blockCheck">
										<c:if test="${freeBoard.freeBoardWriternick eq blockCheck.blockMemnick }">
											<c:set var="block" value="true"/>
										</c:if>
								</c:forEach>
									<c:choose>
										<c:when test="${block }">
											<tr>
												<td style="text-decoration: line-through;">${freeBoard.freeBoardNo }</td>
												<td><a style="text-decoration: line-through;"
													href="freeView.do?freeBoardNo=${freeBoard.freeBoardNo }">
														차단 된 회원의 게시물입니다 <!-- 새로운글 표시 --> <c:if
															test="${freeBoard.freeBoardRegDate>=nowday }">
															<img class="upload" src="<c:url value="/resources/images/992DB133599974E636.png" />" style="width: 10px;height: 10px; margin-bottom: 10px;">
														</c:if>
												</a>
												<a href="freeView.do?freeBoardNo=${freeBoard.freeBoardNo }"><div class="comment" style="color: red;">&nbsp;[${freeBoard.reCnt }]&nbsp;</div></a></td>
												<td>
													<div class="dropdown">
														<a class="btn btn-secondary dropdown-toggle" href="#"
															role="button" id="dropdownMenuLink"
															style="text-decoration: line-through;"
															data-bs-toggle="dropdown" aria-expanded="false">${freeBoard.freeBoardWriternick }
														</a> <input type="hidden"
															value="${freeBoard.freeBoardWriternick }">
			
														<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
															<li><a class="dropdown-item" onclick="favorite()"
																id="favbtn">관심</a></li>
															<li><a class="dropdown-item" onclick="block()">차단</a></li>
															<li><a class="dropdown-item" href="marketMemberView.do?nick=${freeBoard.freeBoardWriternick }" onclick="window.open(this.href, '_blank', 'width=480, height=500'); return false;">정보 보기</a></li>
														</ul>
													</div>
												</td>
												<td style="text-decoration: line-through;">${freeBoard.freeBoardModDate eq null ? freeBoard.freeBoardRegDate : freeBoard.freeBoardModDate }</td>
											</tr>
										</c:when>
										<c:when test="${not block }">
											<tr>
											<td>${freeBoard.freeBoardNo }</td>
		
											<td><a
												href="freeView.do?freeBoardNo=${freeBoard.freeBoardNo }">
													${freeBoard.freeBoardTitle } <!-- 새로운글 표시 --> <c:if
														test="${freeBoard.freeBoardRegDate>=nowday }">
														<img class="upload"
															src="<c:url value="/resources/images/992DB133599974E636.png" />"
															style="width: 10px; height: 10px; margin-bottom: 10px;">
													</c:if>
											</a> <a href="freeView.do?freeBoardNo=${freeBoard.freeBoardNo }"><div
														class="comment" style="color: red;">&nbsp;[${freeBoard.reCnt }]&nbsp;</div></a></td>
											<td>
												<div class="dropdown">
													<a class="btn btn-secondary dropdown-toggle" href="#"
														role="button" id="dropdownMenuLink"
														data-bs-toggle="dropdown" aria-expanded="false">${freeBoard.freeBoardWriternick }
													</a> <input type="hidden"
														value="${freeBoard.freeBoardWriternick }">
		
													<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
														<li><a class="dropdown-item" onclick="favorite()"
															id="favbtn">관심</a></li>
														<li><a class="dropdown-item" onclick="block()">차단</a></li>
														<li><a class="dropdown-item" href="marketMemberView.do?nick=${freeBoard.freeBoardWriternick }" onclick="window.open(this.href, '_blank', 'width=480, height=500'); return false;">정보 보기</a></li>
													</ul>
												</div>
											</td>
											<td>${freeBoard.freeBoardModDate eq null ? freeBoard.freeBoardRegDate : freeBoard.freeBoardModDate }</td>
										</tr>
										</c:when>
									</c:choose>
							</c:forEach>
					</tbody>
				</table>

				<c:if test="${member ne null }">
					<a href="freeForm.do" class="attach-button" id="write-button"><i
						class="fa-solid fa-pen"></i> 글쓰기</a>
				</c:if>
			</div>
		</div>

		<div class="page_wrap">
			<div class="page_nation">

				<!-- 첫 페이지  -->
				<a class="arrow pprev" href="freeBoardList.do?curPage=1"
					data-page="1"></a>

				<!-- 이전 페이지 -->
				<c:if test="${searchVO.firstPage != 1 }">
					<a class="arrow prev"
						href="freeBoardList.do?curPage=${searchVO.firstPage -1 }"
						data-page="${searchVO.firstPage -1 }"></a>
				</c:if>

				<!-- 페이지 넘버링  -->
				<c:forEach begin="${searchVO.firstPage }"
					end="${searchVO.lastPage }" var="i">
					<c:if test="${searchVO.curPage eq i}">
						<a href="#" style="font-weight: bold">${i }</a>
					</c:if>
					<c:if test="${searchVO.curPage ne i }">
						<a href="freeBoardList.do?curPage=${i }" data-page="${i }">${i }</a>
					</c:if>
				</c:forEach>
				<!-- 다음  페이지  -->
				<c:if test="${searchVO.lastPage ne searchVO.totalPageCount }">
					<a class="arrow next"
						href="freeBoardList.do?curPage=${searchVO.lastPage + 1 }"
						data-page="${searchVO.lastPage + 1 }"></a>
				</c:if>

				<!-- 마지막 페이지 -->
				<a class="arrow nnext"
					href="freeBoardList.do?curPage=${searchVO.totalPageCount }"
					data-page="${searchVO.totalPageCount }"></a>
			</div>
		</div>
	</div>

	<%@include file="/WEB-INF/inc/footer.jsp"%>

</body>
<script type="text/javascript">
	//변수 정의
	$form = $("form[name='search']");
	$curPage = $form.find("input[name='curPage']");
	let thisRow = "";

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
		//		e.preventDefault();
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

	$('.btn').on("click", function() {
		//		thisRow = $(this).closest('a').text();
		let value = $(this).closest('tr');
		thisRow = value.find('input').val();
	});//닉네임 클릭했을때

	function favorite() {
		console.log(thisRow);

		if (!confirm("[" + thisRow + "]" + "회원을 관심회원으로 등록하시겠습니까?")) {
			return false;
		} else {
			$.ajax({
				url : "<c:url value='favorite.do'/>",
				type : "POST",
				data : {
					"nick" : thisRow
				},
				success : function(data) {
					if (data == "success") {
						alert("[" + thisRow + "]" + "회원을 관심회원으로 등록했습니다!");
						location.reload();
					} else if (data == "toomany") {
						alert("관심 회원 등록은 5명까지 가능합니다!");
						return false;
					} else if (data == "overlap") {
						alert("이미 관심회원으로 등록된 회원입니다!");
						return false;
					} else if (data == "loginplz") {
						alert("로그인이 필요합니다!");
						$(location).attr('href', 'loginPage.do');
					} else if (data == "itsme") {
						alert("자기 자신을 관심 등록할 수 없습니다!");
						return false;
					} else {
						alert("탈퇴한 회원입니다.");
						return false;
					}
				},
				error : function(req) {
					alert("에러");
					return false;
				}
			});//ajax

		}//else
	}//favorite

	function block() {

		if (!confirm("[" + thisRow + "]" + "회원을 차단하시겠습니까?")) {
			return false;
		} else {
			$.ajax({
				url : "<c:url value='block.do'/>",
				type : "POST",
				data : {
					"nick" : thisRow
				},
				success : function(data) {
					if (data == "success") {
						alert("[" + thisRow + "]" + "회원을 차단하였습니다.");
						location.reload();
					} else if (data == "toomany") {
						alert("차단은 5명까지 가능합니다!");
						return false;
					} else if (data == "overlap") {
						alert("이미 차단된 회원입니다!");
						return false;
					} else if (data == "loginplz") {
						alert("로그인이 필요합니다!");
						$(location).attr('href', 'loginPage.do');
					} else if (data == "itsme") {
						alert("자기 자신을 차단 할 수 없습니다!");
						return false;
					} else {
						alert("탈퇴한 회원입니다.");
						return false;
					}
				},
				error : function(req) {
					alert("에러");
					return false;
				}
			});//ajax

		}//else

	}//block

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