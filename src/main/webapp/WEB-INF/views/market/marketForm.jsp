<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='${path}/resources/css/marketForm.css' rel='stylesheet' />
<link href="<%=request.getContextPath()%>/resources/css/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/footer.css" rel="stylesheet">
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<script
	src="<%=request.getContextPath()%>/resources/ckeditor/ckeditor.js"></script>
<script src="https://kit.fontawesome.com/94aab5b4e0.js"
	crossorigin="anonymous"></script>
<title>밥풀</title>
<%
	request.setCharacterEncoding("UTF-8");
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
			<div class="content_title"></div>

					<form:form action="marketRegist.do" method="post"
						modelAttribute="market" id="editor_form" enctype="multipart/form-data">
						<div id="div_table">
							<form:input type="hidden" id="market_id" path="marketId"
								maxlength="30" value="${member.memId }" />
								
								<form:input type="hidden"
								id="market_nickname" path="marketNickname" value="${member.memNickname }" />
								
							<table>
								<colgroup>
									<col width="200">
									<col width="550">
								</colgroup>
								<tr>
									<td class="td_left">제목</td>
									<td class="td_right"><form:input type="text"
											id="matket_title" path="marketTitle" maxlength="30" value="" required="true"/>
										<form:errors path="marketTitle"></form:errors></td>
								</tr>
								<tr>
									<td class="td_left">카테고리</td>
									<td class="td_right"><form:select id="matket_category"
											path="marketCategory" maxlength="30" value="" style="background:white;width:100%;font-size:15px;padding:10px;float:left;border:0">
											<form:option value="삽니다" label="삽니다" />
											<form:option value="팝니다" label="팝니다" />
											<form:option value="판매완료" label="판매완료" />
										</form:select> <form:errors path="marketTitle"></form:errors></td>
								</tr>
								<tr>
									<td class="td_left">가격</td>
									<td class="td_right"><form:input type="text"
											id="market_price" path="marketPrice" maxlength="30" value=""
											onkeyup="inputNumberFormat(this)" placeholder="숫자만 입력해 주세요." required="true"/>
										<form:errors path="marketPrice"></form:errors></td>
								</tr>
								<tr>
									<td class="td_left">내용</td>
									<td class="td_right">
										<!-- textAread 공백 주의 --> <form:textarea id="market_content"
											name="market_content" cols="30" rows="10"
											path="marketContent" placeholder="내용을 입력해 주세요." required="true"/> <form:errors
											path="marketContent"></form:errors>
									</td>
								</tr>
								<tr>
									<td class="td_left" id="file_title">첨부파일
										<button type="button" id="id_btn_new_file">추가</button>
									</td>
									<td class="td_right" id="file_area">
										<div class="form-inline">
											<input type="file" name="boFiles" class="form-control" required="required">
											<button type="button" class="btn_delete btn btn-sm">삭제</button>
										</div>
									</td>
								</tr>
							</table>
						</div>
						<!-- 버튼 -->
						<div id="div_button">
				<button class="attach-button" type="submit"
					formaction="marketRegist.do">
					<i>등록</i>
				</button>
				<a class="attach-button" href="marketList.do"><i>목록</i></a>
			</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/inc/footer.jsp"%>

	<script type="text/javascript">
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

		function inputNumberFormat(obj) {
			obj.value = comma(uncomma(obj.value));
		}

		function comma(str) {
			str = String(str);
			return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}

		function uncomma(str) {
			str = String(str);
			return str.replace(/[^\d]+/g, '');
		}

		//ck editor
		CKEDITOR.replace('market_content', {//해당 이름으로 된 textarea에 에디터를 적용
			width : '100%',
			height : '400px',
	      filebrowserUploadUrl: "<c:url value='/free/fileupload.do'/>"
		});
	</script>

</body>

</html>