<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='${path}/resources/css/freeForm.css' rel='stylesheet' />
<link href="<%=request.getContextPath()%>/resources/css/header.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/footer.css"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<script
	src="<%=request.getContextPath()%>/resources/ckeditor/ckeditor.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


<title>게시글 작성</title>

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
		<div class="content_title"></div>
		<form:form action="freeRegist.do" method="post"
			modelAttribute="freeBoard" id="editor_form"
			enctype="multipart/form-data">
			<div id="div_table">
				<input type="hidden" id="freeBoardNo" name="freeBoardNo" value="">
				<table>
					<colgroup>
						<col width="200">
						<col width="550">
					</colgroup>
					<tr>
						<td class="td_left">제목</td>
						<td class="td_right"><form:input type="text"
								path="freeBoardTitle" id="freeBoardTitle" name="freeBoardTitle"
								maxlength="30" required="required" /> <form:errors
								path="freeBoardTitle"></form:errors></td>
					</tr>
					<tr>
						<td class="td_left">작성자</td>
						<td class="td_right"><form:input type="hidden"
								path="freeBoardWriter" id="freeBoardWriter"
								name="freeBoardWriter" value="${member.memId }" /> <form:errors
								path="freeBoardWriter"></form:errors>
								<form:input type="text"
								path="freeBoardWriternick" id="freeBoardWriternick"
								readonly="true" name="freeBoardWriternick"
								value="${member.memNickname }" /> <form:errors
								path="freeBoardWriternick"></form:errors>
								<form:input type="hidden"
								path="freeBoardProfile" id="freeBoardProfile"
								readonly="true" name="freeBoardProfile"
								value="${member.memProfile }" /> <form:errors
								path="freeBoardProfile"></form:errors>
								</td>

					</tr>
					<tr>
						<td class="td_left">비밀번호</td>
						<td class="td_right"><form:input type="password"
								path="freeBoardPass" id="freeBoardPass" name="freeBoardPass"
								maxlength="30" /> <form:errors path="freeBoardPass"></form:errors></td>
					</tr>
					<tr>
						<td class="td_left">내용</td>
						<td class="td_right">
							<!-- textAread 공백 주의 --> <textarea id="freeBoardContent"
								name="freeBoardContent"></textarea> <form:errors
								path="freeBoardContent"></form:errors> <%-- 									<form:textarea path="freeBoardContent" --%>
							<%-- 										id="freeBoardContent" name="freeBoardContent" cols="30" --%>
							<%-- 										rows="10" /> <form:errors path="freeBoardContent"></form:errors> --%>
						</td>
					</tr>
					<tr>
						<td class="td_left" id="file_title">첨부파일
							<button type="button" id="id_btn_new_file">추가</button>
						</td>
						<td class="td_right" id="file_area">
							<div class="form-inline">
								<input type="file" name="boFiles" class="form-control">
								<button type="button" name="btn_delete btn btn-sm">삭제</button>
							</div> <!-- textAread 공백 주의 --> <img alt="">

						</td>
					</tr>
				</table>
			</div>
			<!-- 버튼 -->
			<div id="div_button">
				<button class="attach-button" type="submit"
					formaction="freeRegist.do">
					<i>등록</i>
				</button>
				<a class="attach-button" href="freeBoardList.do"><i>목록</i></a>
			</div>
		</form:form>
	</div>

	<%@include file="/WEB-INF/inc/footer.jsp"%>

</body>

<script type="text/javascript">
	//	 	파일 추가  함수

	$('#id_btn_new_file')
			.click(
					function() {
						$('#file_area')
								.append(
										'<div class="form-inline">'
												+ '<input type="file" name="boFiles" class="form-control">'
												+ ' <button type="button" class="btn_delete btn btn-sm">삭제</button>'
												+ '</div>');
					});

	$('#file_area').on('click', '.btn_delete', function() {
		$(this).closest('div').remove();
	});
	
	// 기존 첨부파일 삭제 클릭 
	$('.btn_file_delete').click(function(){
		$btn = $(this);
		$btn.closest('div').html(
				 '<input type="hidden" name="delAtchNos" value="' + $btn.data("atch-no")  + '" />'
				); 
	});

	CKEDITOR.replace('freeBoardContent', {//해당 이름으로 된 textarea에 에디터를 적용
		width : '100%',
		height : '400px',
		filebrowserUploadUrl : "<c:url value='/free/fileupload.do'/>"
	});
</script>
</html>