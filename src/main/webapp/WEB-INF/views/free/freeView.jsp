<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 부트스트랩 css -->
<link
	href="<%=request.getContextPath()%>/resources/css/bootstrap-3.3.2/css/bootstrap.css"
	rel="stylesheet">
<!-- 부트스트랩 js -->
<script
	src="<%=request.getContextPath()%>/resources/css/bootstrap-3.3.2/js/bootstrap.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/header.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/footer.css"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/94aab5b4e0.js"
	crossorigin="anonymous"></script>
<link href='${path}/resources/css/freeView.css' rel='stylesheet' />

<title>게시판</title>

</head>
<%
	request.setCharacterEncoding("utf-8");
%>
<body>

	<%@include file="/WEB-INF/inc/header.jsp"%>
	<div id="wrap">


		<div class="content-title"></div>
		<div class="content">

			<div class="content-head">
				<a href="./freeBoardList.html">자유게시판 ></a>
				<div class="content-head-title">${freeBoard.freeBoardTitle }</div>
				<div class="content-writer-info">

					<div class="photo"
						style="width: 50px; height: 50px; float: left; margin-right: 10px;">
						<c:if test="${freeBoard.freeBoardProfile == '프사'}">
							<img class="profile"
								src="${path}/resources/images/profile/profiledefault.png"
								style="width: 50px; height: 50px; border-radius: 50%;">
						</c:if>
						<c:if test="${freeBoard.freeBoardProfile != '프사'}">
							<img class="profile" src="/profileimg/${profile }"
								style="width: 50px; height: 50px; border-radius: 50%;">
						</c:if>

					</div>
					<div class="profile-area">
						<div class="content-nickname" style="font-weight: bold;">
							<a href="#">${freeBoard.freeBoardWriternick }</a>
						</div>
						<div class="profile-date">
							<span class="date" style="color: gray">${freeBoard.freeBoardModDate eq null ? freeBoard.freeBoardRegDate : freeBoard.freeBoardModDate }</span>
						</div>
					</div>
				</div>
			</div>

			<div class="content-content">${freeBoard.freeBoardContent }</div>
			<div class="attach-area">
				<div class="attach-title">
					첨부파일 <i class="fa-solid fa-file"></i>
				</div>
				<div class="attach-content" id="file_area">
					<c:forEach var="free" items="${freeBoard.attaches }" varStatus="st">
						<div>
							파일 ${st.count } <a
								href="<c:url value='/attach/download/${free.atchNo}'/>"
								target="_blank"> <span class="glyphicon glyphicon-save"
								aria-hidden="true"></span> ${free.atchOriginalName }
							</a> Size : ${free.atchFancySize} Down : ${free.atchDownHit}
						</div>
					</c:forEach>
				</div>
			</div>
			<hr>
			<!-- 댓글 영역------------------------------------------------------------------------------------>
			<h4>댓글</h4>
			<br>

			<!-- DB에서 댓글불러오기  -->

			<div id="id_reply_list_area">

				<c:forEach items="${replyList}" var="replyVo">
					<!-- 			일반글	 -->

					<c:if
						test="${replyVo.reSecret eq 'N' || member.memId eq replyVo.reWriterId || member.memId eq freeBoard.freeBoardWriter }">
						<c:if test="${replyVo.lv == 1 }">
							<div class="row" data-reno=${replyVo.reNo }
								data-rewriterid=${replyVo.reWriterId }
								data-recontent=${replyVo.reContent } data-lv='${replyVo.lv}'
								data-reparentid=${replyVo.reParentId }>

								<div class="col-sm-1 text-left">${replyVo.reWriter }</div>
								<div class="col-sm-9">
									<div class="col-sm-12">
										<pre>${replyVo.reContent}</pre>
									</div>
									<p class="re_date">${replyVo.reRegDate }
										<button name="btn_re_reply_regist" type="button"
											class="re_reply_button" data-lv=${replyVo.lv + 1}
											data-reno=${replyVo.reNo }
											data-reparentid=${replyVo.reParentId}>답글</button>
									</p>
								</div>
								<div class="col-sm-2 text-right">
									<c:if test="${member.memId eq replyVo.reWriterId }">
										<button name="btn_reply_delete" type="button"
											class="edit_button">삭제</button>
										<button name="btn_reply_edit" type="button"
											class="edit_button" data-bs-target="#id_reply_edit_modal">수정</button>
									</c:if>
								</div>

							</div>
						</c:if>

						<c:if test="${1 < replyVo.lv }">
							<div
								<%-- 						style="margin-left: ${replyVo.lv * 15}px;" --%>
						style="margin-left: 10px;"
								class="row re_row_name" data-rewriterid=${replyVo.reWriterId }
								data-reno=${replyVo.reNo }>
								<div class="col-sm-1 text-left">${replyVo.reWriter }</div>
								<div class="col-sm-7">
									<pre> ${replyVo.reContent} </pre>
								</div>
								<div class="col-sm-2 re_date">${replyVo.reRegDate }
									<button name="btn_re_reply_regist" class="edit_button"
										type="button">답글</button>
								</div>
								<div class="col-sm-2 text-right">
									<c:if test="${member.memId eq replyVo.reWriterId }">
										<button name="btn_reply_edit" class="edit_button"
											type="button">수정</button>
										<button name="btn_reply_delete" type="button"
											class="edit_button">삭제</button>
									</c:if>
								</div>
							</div>


						</c:if>
					</c:if>

					<!-- 				비밀글 -->
					<c:if
						test="${replyVo.reSecret eq 'Y' && member.memId ne replyVo.reWriterId && member.memId ne freeBoard.freeBoardWriter}">
						

						<c:if test="${replyVo.lv == 1 }">
							<div class="row" data-reno=${replyVo.reNo }
								data-rewriterid=${replyVo.reWriterId }
								data-recontent=${replyVo.reContent } data-lv='${replyVo.lv}'
								data-reparentid=${replyVo.reParentId }  style="margin-bottom: 10px;" >
							<span style="color: red; margin-left: 15px;"><i class="fa-solid fa-lock"></i>
								비밀 댓글입니다.</span>
							<button name="btn_re_reply_regist" class="edit_button"
								type="button">답글</button>
							</div>
						</c:if>

						<c:if test="${replyVo.lv > 1 }">
							<span style="margin-left: ${replyVo.lv * 30}px; color:red;">
								<i class="fa-solid fa-lock"></i> 비밀 댓글입니다.
							</span>

							<hr>
						</c:if>
					</c:if>

				</c:forEach>
			</div>

			<!-- START : 댓글 수정용 Modal -->
			<div class="modal fade" id="id_reply_edit_modal" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<form name="frm_reply_edit"
							action="<c:url value='/reply/replyModify' />" method="post"
							onclick="return false;">
							<div class="modal-header">
								<h4 class="modal-title">댓글 수정</h4>
								<div class="btn_box">
									<button id="btn_reply_modify" type="button"
										class="btn btn-sm btn-info">수정</button>
									<button type="button" class="btn btn-default btn-sm"
										data-dismiss="modal">닫기</button>
								</div>
							</div>
							<div class="modal-body">
								<input type="hidden" name="reNo" value="">
								<textarea rows="1" name="reContent" class="form-control"></textarea>
								<input type="hidden" name="reWriterId" value="${member.memId }">
								<input type="hidden" name="reWriter" value="${member.memName}">
							</div>

						</form>
					</div>
				</div>
			</div>
			<!-- End : 댓글 수정용 Modal -->


			<!-- START : 대댓글 등록 Modal -->
			<div class="modal fade" id="id_re_reply_regist_modal" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<form name="frm_re_reply_regist"
							action="<c:url value='/reply/re_replyRegist' />" method="post"
							onclick="return false;">
							<div class="modal-header">
								<h4 class="modal-title">추가 댓글</h4>
								<input type="hidden" name="reIp"
								value="<%=request.getRemoteAddr()%>"> <input
								type="checkbox" class="re_check" name="reSecret" value="Y">secret
								<div class="btn_box">
									<button id="re_reply_regist" type="button"
										class="btn btn-sm btn-info">등록</button>
									<button type="button" class="btn btn-default btn-sm"
										data-dismiss="modal">닫기</button>
								</div>
							</div>
							<div class="modal-body">
								<input type="hidden" name="reBoardNo"
									value="${freeBoard.freeBoardNo}"> <input type="hidden"
									name="lv" value=""> <input type="hidden"
									name="reParentId" value="2">
								<textarea rows="1" name="reContent" class="form-control rereply"></textarea>
								<input type="hidden" name="reWriterId" value="${member.memId }">
								<input type="hidden" name="reWriter" value="${member.memName}">
							</div>

						</form>
					</div>
				</div>
			</div>
			<!--End :대댓글 등록Modal -->

			<div class="reply_area">
				<!-- // START : 댓글 등록 영역  -->
				<div class="panel panel-default">
					<div class="panel-body form-horizontal">
						<form id="DBreplyList" name="frm_reply"
							action="<c:url value='/reply/replyRegist' />" method="post">
							<input type="hidden" name="reBoardNo"
								value="${freeBoard.freeBoardNo}"> <input type="hidden"
								name="reCategory" value="FREE"> <input type="hidden"
								name="reWriterId" value="${member.memId}"> <input
								type="hidden" name="reWriter" value="${member.memNickname}">
							<input type="hidden" name="reIp"value="<%=request.getRemoteAddr()%>"> 
<!-- 							<input	type="checkbox" class="re_check" name="reSecret" value="Y">secret -->
							<div class="form-group">
								<label class="col-sm-1  control-label">댓글</label>
								<div class="col-sm-10">
									<textarea rows="1" name="reContent" class="form-control"
										style="resize: none;"></textarea>
								</div>
								<div class="col-sm-1">
									<button id="btn_reply_regist" type="button"
										class="attach-button">등록</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- // END : 댓글 등록 영역  -->

			<!-- 댓글 영역  끄읏   -------------------------------------------------------->
		</div>
		<!-- 버튼 -->
		<div id="div_button">

			<a class="attach-button" href="freeBoardList.do"><i>목록</i></a>
			<c:if test="${member.memId eq freeBoard.freeBoardWriter }">
				<a class="attach-button"
					href="freeEdit.do?freeBoardNo=${freeBoard.freeBoardNo }"><i>수정</i></a>
			</c:if>
		</div>

	</div>
	<%@include file="/WEB-INF/inc/footer.jsp"%>
</body>

<script type="text/javascript">
	//리스트 불러오기
	let params = {
		"reBoardNo" : "${freeBoard.freeBoardNo}",
		"curPage" : 1,
		"rowSizePerPage" : 10
	};

	function new_page() {
		location.reload();
	}

	$(document)
			.ready(
					function() {
						//더보기 버튼
						$("#id_reply_list_more").on("click", function(e) {
							e.preventDefault();
						});

						// ----------------------------------------------------------------------------------------------------		----------------------

						// ----------------------------------------------------------------------------------------------------		----------------------
						//등록버튼
						$("#btn_reply_regist")
								.on(
										"click",
										function(e) {
											e.preventDefault();
											$form = $(this).closest(
													"form[name='frm_reply']");
											console.log($form.serialize());

											let memberId = $(this).find(
													"input[name='reWriterId']")
													.val();
											console.log(memberId);

											$
													.ajax({
														url : "<c:url value='/replyRegist.do'/>",
														data : $form
																.serialize() //넘어가는 파라미터들을 json 으로 바꿔줌.( reContent, reMemId, reIp, reCategory, reParentNo )
														,
														type : "POST",
														dataType : "text",
														success : function(data) {
															console.log('데이터 ',
																	data);
															if (data == "success") {
																$form
																		.find(
																				"textarea[name='reContent']")
																		.val('');
																$(
																		"#id_reply_list_area")
																		.html(
																				'');
																params.curPage = 1;
																new_page();
																console
																		.log($form
																				.serialize());
															} else {
																location.href = "<c:url value='/loginPage.do'/>";
															}
														},
														error : function(req) {
															console
																	.log(req.status);
															if (req.status == 401) {
																location.href = "<c:url value='/loginPage.do'/>";
															}
														}
													});//ajaxd

										}); // 등록버튼
						// ----------------------------------------------------------------------------------------------------		----------------------
						// 삭제버튼
						// btn_reply_delete
						$("#id_reply_list_area")
								.on(
										"click",
										'button[name="btn_reply_delete"]',
										function(e) {
											e.preventDefault();
											$div = $(this).closest('.row'); //여기서 this = $("#id_reply_list_area")
											let reNo = $div.data("reno");
											let reWriterId = $div
													.data("rewriterid");
											let reParentId = $div
													.data("reparentid");
											console.log(reParentId);

											$
													.ajax({
														url : "<c:url value='/replyDelete.do'/>",
														type : "POST",
														data : {
															"reNo" : reNo,
															"reWriterId" : reWriterId,
															"reParentId" : reParentId
														},
														dataType : "text",
														success : function(data) {
															if (data == "success") {
																console
																		.log(reParentId)
																if (1) {

																} else {
																	$div
																			.remove();
																}
																alert("성공");
																console
																		.log("성공이다");
																new_page();
															} else if (data == "fail") {
																alert("실패 댓글작성자가 아니거나 로그인 필요 합니다.1");
															}
														},
														error : function(
																request,
																status, error) {
															alert("code:"
																	+ request.status
																	+ "\n"
																	+ "message:"
																	+ request.responseText
																	+ "\n"
																	+ "error:"
																	+ error);
														}

													});

										});

						// ----------------------------------------------------------------------------------------------------		----------------------

						//수정버튼 : 댓글 영역안에 있는 수정버튼만  이벤트 등록   아이디랑 작성자랑 
						$("#id_reply_list_area")
								.on(
										"click",
										"button[name='btn_reply_edit']",
										function(e) {
											$div = $(this).closest(".row");//댓글 div
											let reNo = $div.data("reno");
											let reWriterId = $div
													.data("rewriterid");
											console.log(reNo);
											// 			let reContent =$div.find("pre").html("");
											let $modal = $("#id_reply_edit_modal");
											let $modalForm = $modal
													.find("form[name='frm_reply_edit']");
											$modalForm.find(
													"input[name='reNo']").val(
													reNo);
											$(
													"#id_reply_edit_modal textarea[name='reContent']")
													.val(
															$(this)
																	.closest(
																			$(".row"))
																	.data(
																			'recontent'));
											$("#id_reply_edit_modal").modal(
													"show");
										}); //모달창 띄우고 안에 내용 받아오기 /수정버튼

						//모달저장 - 수정 눌렀을 때
						$("#btn_reply_modify")
								.on(
										"click",
										function(e) {
											console
													.log($("form[name='frm_reply_edit']")[0]);
											$
													.ajax({
														url : "<c:url value='/replyModify.do'/>",
														data : $(
																"form[name='frm_reply_edit']")
																.serialize(),
														dataType : "text",
														success : function(data) {
															if (data == "success") {
																console
																		.log(data);
																$(
																		"#id_reply_list_area")
																		.html(
																				'');
																params.curPage = 1;
																new_page();
																$(
																		'#id_reply_edit_modal')
																		.modal(
																				"hide");
															} else {
																alert("false");
																alert("수정하시려면 로그인이 필요합니다. ");
																location.href = "<c:url value='/loginPage.do'/>";
															}
														},
														error : function(
																request,
																status, error) {
															alert("code:"
																	+ request.status
																	+ "\n"
																	+ "message:"
																	+ request.responseText
																	+ "\n"
																	+ "error:"
																	+ error);

														}
													});
										});// 모달 저장
						// --------------------------------------------------------------------------------------------------------------------------

						// 대댓글 버튼 : 이벤트 등록 
						$("#id_reply_list_area")
								.on(
										"click",
										'button[name="btn_re_reply_regist"]',
										function(e) {
											// 		console.log($("form[name='frm_re_reply_regist']")[0]);
											let memberId = $(this).data(
													"rewriterid");
											console.log(memberId);
											$(
													"#id_reply_edit_modal textarea[name='reContent']")
													.val(
															$(this)
																	.closest(
																			$(".row"))
																	.data(
																			'recontent'));

											let reNo = $(this).data("reno");

											console.log(reNo, "reNo");
											$('#id_re_reply_regist_modal')
													.modal();
											// 대댓글 모달창 뜨기
											$("#re_reply_regist")
													.on(
															"click",
															function() {
																e
																		.preventDefault();
																//상위댓글의 요소 가져오기

																let cur_reply = e.target
																		.closest(".row");
																console
																		.log(
																				cur_reply,
																				"cur_reply");
																let rereNo = cur_reply
																		.getAttribute("data-reno");

																let lv = cur_reply
																		.getAttribute("data-lv");
																lv = Number(lv) + 1;
																console.log(lv,
																		"lv");
																console
																		.log(
																				rereNo,
																				"reParentNo");
																let content = $(
																		".rereply")
																		.val();
																let relv = $(
																		"input[name='lv']")
																		.val(lv);
																let reParentId = $(
																		"input[name='reParentId']")
																		.val(
																				rereNo);

																$
																		.ajax({
																			url : "<c:url value='/replyRegist.do'/>", // 컨트롤러만들기 
																			data : $(
																					"form[name='frm_re_reply_regist']")
																					.serialize(),
																			dataType : "text",
																			success : function(
																					data) {
																				console
																						.log(data);
																				$btn = $(this);
																				$div = $btn
																						.closest('div.row');
																				$modal = $("id_re_reply_regist_modal");
																				$modal
																						.find(
																								"textarea[name='reContent']")
																						.val(
																								content);
																				// 							$modal.find('input[name=reNo]').val(reNo);
																				$modal
																						.find(
																								'input[name=lv]')
																						.val(
																								relv);
																				$modal
																						.find(
																								'input[name=reParentId]')
																						.val(
																								reParentId);
																				$(
																						"#id_reply_list_area")
																						.html(
																								'');

																				params.curPage = 1;
																				location
																						.reload();
																				$(
																						'#id_re_reply_regist_modal')
																						.modal(
																								"hide");
																			},
																			error : function(
																					req) {
																				alert("false");
																				console
																						.log(req);
																			}
																		});
															});

										}); // 대댓글 저장

					}); // document
</script>

</html>
