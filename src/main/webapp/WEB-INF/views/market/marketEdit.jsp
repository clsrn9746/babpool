<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/94aab5b4e0.js" crossorigin="anonymous"></script>
<link href='${path}/resources/css/marketEdit.css' rel='stylesheet' />
<link href="<%=request.getContextPath()%>/resources/css/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/footer.css" rel="stylesheet">
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	 <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script
	src="<%=request.getContextPath()%>/resources/ckeditor/ckeditor.js"></script>
<title>밥풀</title>
<%
	request.setCharacterEncoding("UTF-8");
%>
</head>
<body>

		<%@include file="/WEB-INF/inc/header.jsp" %>
	<div id="wrap">
	
	<div class="content">
			<div class="market">
				<div class="market_title"></div>
				<div class="market_content">

				<form:form action="marketEdit.do" id="marketEdit" method="post"
					modelAttribute="market" enctype="multipart/form-data">
					<div id="div_table">
						<input type="hidden" name="marketNo" value="${market.marketNo }">
						<input type="hidden" name="marketNickname" value="${market.marketNickname }">
						<table>
							<colgroup>
								<col width="200">
								<col width="550">
							</colgroup>
							<tr>
								<td class="td_left">사진</td>
								<td class="td_right">
									<c:if test="${market.attaches[0] ne null }">
										<img src="${path}/marketImage.do?fileName=${market.attaches.get(0).atchName}" width="428" height="428" alt="이미지를 찾을 수 없습니다">
									</c:if>
									<c:if test="${market.attaches[0] eq null }">
										<img src="${path}/resources/images/babpoollogo5.png" width="428" height="428" alt="이미지를 등록해 주세요.">
									</c:if>
									</td>
							</tr>
								<tr>
									<td class="td_left">제목</td>
									<td class="td_right"><form:input type="text"
											id="matket_title" path="marketTitle" maxlength="30" value="" />
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
											onkeyup="inputNumberFormat(this)" placeholder="숫자만 입력해 주세요." />
										<form:errors path="marketPrice"></form:errors></td>
								</tr>
							<tr>
								<td class="td_left">내용</td>
								<td class="td_right">
									<!-- textAread 공백 주의 --> <form:textarea id="market_content" mame="market_content"
										path="marketContent" cols="30" rows="10" /> <form:errors
										path="marketContent"></form:errors>
								</td>
							</tr>
							<tr>
								<td class="td_left" id="file_title">첨부파일
								<button type="button" id="id_btn_new_file">추가</button></td>
							<td class="td_right" id="file_area">
								<c:forEach var="f" items="${market.attaches}" varStatus="st">
									<div>
										파일 ${st.count} <a href="<c:url value='/attach/download/${f.atchNo}' />" target="_blank">
										<span class="glyphicon glyphicon-save" aria-hidden="true"></span>${f.atchOriginalName}</a>
										<button class="btn_file_delete" data-atch-no="${f.atchNo}">
										<i class="fa-solid fa-trash-can"></i>
										<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
										</button>
									</div>
								</c:forEach>
								<div class="form-inline">
									<input type="file" name="boFiles" class="form-control" >
									<button type="button" class="btn_delete btn btn-sm">삭제</button>
								</div>
							</td>
						</tr>
						</table>
					</div>
					<!-- 버튼 -->
					<div id="div_button">
							<button class="attach-button" type="submit" formaction="marketDelete.do">삭제</button>
							<button class="attach-button" type="submit" formaction="marketModify.do">수정</button>
							<button class="attach-button" type="submit" formaction="marketList.do">목록</button>
						</div>
				</form:form>
			</div>
		</div>
	</div>
</div>

			<%@include file="/WEB-INF/inc/footer.jsp" %>
</body>

	<script type="text/javascript">
	
	// 첨부파일 추가버튼 클릭 
	$('#id_btn_new_file').click(function(){
	    $('#file_area').append('<div class="form-inline">'
	      	+ '<input type="file" name="boFiles" class="form-control">'
	      	+ ' <button type="button" class="btn_delete btn btn-sm">삭제</button>'
			+ '</div>');
	}); // #id_btn_new_file.click
	
	
	// 상위객체를 통해 이벤트 위임  
	$('#file_area').on('click','.btn_delete', function(){
		$(this).closest('div').remove();
	});
	 
	// 기존 첨부파일 삭제 클릭 
	$('.btn_file_delete').click(function(){
		$btn = $(this);
		$btn.closest('div').html(
				 '<input type="hidden" name="delAtchNos" value="' + $btn.data("atch-no")  + '" />'
				); 
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
		filebrowserUploadUrl : "<c:url value='/marketModify.do'/>"
	});
	
	
</script>

</html>