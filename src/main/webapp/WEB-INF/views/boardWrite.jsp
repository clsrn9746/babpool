<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='${path}/resources/css/boardWrite.css' rel='stylesheet' />
<link href="<%=request.getContextPath()%>/resources/css/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/footer.css" rel="stylesheet">
<title>밥풀</title>
<%
	request.setCharacterEncoding("UTF-8");
%>
</head>
<body>

	<div id="wrap">
		<%@include file="/WEB-INF/inc/header.jsp"%>

		<section class="content">
			<section class="noticewrite">
				<div class="page-title">
					<div class="container">
						<h3>글쓰기</h3>
					</div>
				</div>

				<form action="" id="editor_form" method="post">
					<div id="div_table">
						<table>
							<colgroup>
								<col width="200">
								<col width="550">
							</colgroup>
							<tr>
								<td class="td_left">제목</td>
								<td class="td_right"><input type="text" id="notice_title"
									maxlength="30" value=""></td>
							</tr>
							<tr>
								<td class="td_left">내용</td>
								<td class="td_right">
									<!-- textAread 공백 주의 --> <textarea id="notice_content"
										name="notice_content" cols="30" rows="10"></textarea>
								</td>
							</tr>
							<tr>
								<td class="td_left">첨부파일</td>
								<td class="td_right">
									<!-- textAread 공백 주의 -->
								</td>
							</tr>
							<td class="td_left"><label for="Seoul"> <input
									type="checkbox" name="region" id="Seoul" value="Seoul" checked>
									비밀글
							</label></td>

							</tr>
						</table>
					</div>
					<!-- 버튼 -->
					<div id="div_button">
						<input type="button" onclick="fn_notice()" value="목록"> <input
							type="button" onclick="javascript:fn_submit()" value="등록">
						<input type="button" value="수정"> <input type="button"
							value="삭제">
					</div>
				</form>
	</div>
	</div>
	</section>

	</section>
	</div>


	<%@include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>