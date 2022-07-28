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
<link href="<%=request.getContextPath()%>/resources/css/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/footer.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!--    ckeditor -->
    <script src="<%=request.getContextPath()%>/resources/ckeditor/ckeditor.js"></script>
<title>밥풀</title>
<%
	request.setCharacterEncoding("utf-8");
%>
</head>
<body>

		<%@include file="/WEB-INF/inc/header.jsp" %>
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
				<form:form action="freeModify.do" id="editor_form" method="post"
					modelAttribute="freeBoard" enctype="multipart/form-data">
					<div id="div_table">
					<input type="hidden" id="freeBoardNo"
									name="freeBoardNo"
									value="${freeBoard.freeBoardNo}">
						<table>
							<colgroup>
								<col width="200">
								<col width="550">
							</colgroup>
							<tr>
								<td class="td_left">제목</td>
								<td class="td_right">
								<input type="text" id="freeBoardTitle" name="freeBoardTitle" maxlength="30"
									value="${freeBoard.freeBoardTitle}"></td>
							</tr>
							<tr>
								<td class="td_left">내용</td>
								<td class="td_right">
									<!-- textAread 공백 주의 -->
									 <textarea id="freeBoardContent"
										name="freeBoardContent" cols="30" rows="10">${freeBoard.freeBoardContent}</textarea>
								</td>
							</tr>
							<tr>
								<td class="td_left">첨부파일
									<button type="button" id="id_btn_new_file">추가</button>
								</td>
								<td class="td_right" id="file_area"><c:forEach var="free"
										items="${freeBoard.attaches }" varStatus="st">
										<div class="form-inline">
											파일 ${st.count} <a
												href="<c:url value='/attach/download/${free.atchNo}' />"
												target="_blank"> <span class="glyphicon glyphicon-save"
												aria-hidden="true"></span> ${free.atchOriginalName}
											</a> Size : ${free.atchFancySize} Down : ${free.atchDownHit}
											<button class="btn_file_delete" data-atch-no="${free.atchNo}" >
												<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
											</button>
										</div>
										<!-- textAread 공백 주의 -->
									</c:forEach>
									<div class="form-inline">
										<input type="file" name="boFiles" class="form-contorl">
										<button type="button" class="btn_delete btn btn-sm">삭제</button>
									</div>
								</td>
							</tr>
						</table>
					</div>
					<!-- 버튼 -->
			<div id="div_button">
				<button class="attach-button" type="submit"formaction="freeModify.do"><i>수정</i></button>
				<button class="attach-button" type="submit"formaction="freeDelete.do"><i>삭제</i></button>
				<a class="attach-button" href="freeBoardList.do"><i>목록</i></a>
			</div>
				</form:form>

			</div>

		<%@include file="/WEB-INF/inc/footer.jsp" %>


</body>
<script>
	//	첨부파일 추가  함수
	$('#id_btn_new_file').click(function() {
			$('#file_area').append('<div class="form-inline">'
			+ '<input type="file" name="boFiles" class="form-control">'
			+ ' <button type="button" class="btn_delete btn btn-sm">삭제</button>'
			+ '</div>');
					});


	// 기존 첨부파일 삭제 클릭 
	$('.btn_file_delete').click(function(){
		$btn = $(this);
		$btn.closest('div').html(
				 '<input type="hidden" name="delAtchNos" value="' + $btn.data("atch-no")  + '" />'
				); 
	});
	
	// 파일업로드할 파일  삭제
	$('#file_area').on('click', '.btn_delete', function() {
		$(this).closest('div').remove();
		});
	
	
	//ckEditor
		 CKEDITOR.replace( 'freeBoardContent', {//해당 이름으로 된 textarea에 에디터를 적용
	         width:'100%',
	         height:'400px',
	         filebrowserUploadUrl: "<c:url value='/free/fileupload.do'/>"});
	
</script>
</html>