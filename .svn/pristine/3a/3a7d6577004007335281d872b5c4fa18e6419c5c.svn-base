<%@page import="com.babpool.main.vo.CalendarVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- bootstrap 4 -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src='${path}/resources/js/fullcalendar.js'></script>
<script src='${path}/resources/js/ko.js'></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
 <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href='${path}/resources/css/fullcalendar.css' rel='stylesheet' />
<link href='${path}/resources/css/main.css' rel='stylesheet' />
<link href="<%=request.getContextPath()%>/resources/css/footer.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/94aab5b4e0.js"
	crossorigin="anonymous"></script>
<title>밥풀</title>
<%
	request.setCharacterEncoding("UTF-8");
	String user = String.valueOf(session.getAttribute("member"));
%>
</head>

<script>
  
  // 메인 캘린더
  document.addEventListener('DOMContentLoaded', function () {
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	    	 locale: "ko",
		      navLinks: true, // can click day/week names to navigate views
		      selectable: true,
		      selectMirror: true,
		        eventClick: function(arg) {
	        		 
	        	   	 // 이벤트 선택했을 때 보이는 모달창==============================================================\
		        	 $("#calendarselectModal").modal("show"); // modal 나타내기
		        	 var calTitle = arg.event.title;
		        	 $("#calendar_content1").val(arg.event.title);
		        	 var startDate = arg.event.start;
		        	 var fmStartDate = moment(startDate).format('YYYY-MM-DD');
		        	 var endDate = arg.event.end;
		        	 var fmEndDate = moment(endDate).format('YYYY-MM-DD');
		        	 $("#calendar_start_date1").val(fmStartDate);
		        	 $("#calendar_end_date1").val(fmEndDate);
					 $("#calendar_master1").val(arg.event.extendedProps.master);
				    $("#calendar_people1").val(arg.event.extendedProps.people);
				    $("#calendar_id1").val(arg.event.extendedProps.masterId);

				    var calendarList = ${calendarList}
				    for(var i = 0; i < calendarList.length; i++){
				    	if(	$("#calendar_id1").val() == calendarList[i].masterId && $("#calendar_content1").val() == calendarList[i].title){
				    	$("#calendar_no1").val(calendarList[i].calNo);
					    }
				    }
				    
				    
	        		 // 일정 삭제 (다른 일정 클릭했을 때 마지막 누른 것만)
	        			$("#deleteButton").off().on('click', function() {
	        			 var value = arg.event.extendedProps.calNo;
	        			 var data = {"calNo" : value};
	        			 $.ajax({
                			 type : "GET",
                			 url : "deleteCalendar.do",
                			 data: data,
                			 error : function(error){
                				 console.log("error");
                			 },
                			 success : function(data){
				        			 alert("삭제 되었습니다.");
				        			 location.reload();
                			 }
	        		 	});
	        			 
	        		});
	        		 
	        		 $("#deleteButton").show();
		        	 if( $("#calendar_id1").val() != $("#idcheck").val() ){
		        		 $("#deleteButton").hide();
		        	}
		        },
		      events:
		    	  ${calendarList},
	      headerToolbar: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'addEventButton'
	      }, customButtons: {
	     	 	addEventButton: {
	     	 		text : "일정 추가",  // 버튼 내용
                    click : function(){ // 버튼 클릭 시 이벤트 추가
                     	if($("#idcheck").val() != 'null'){
                    	
   	        	   	 // 일정추가 했을 때 보이는 모달창==============================================================
                        $("#calendarModal").modal("show"); // modal 나타내기

                        $("#addCalendar").off().on("click",function(){  // modal의 추가 버튼 클릭 시
                        	
                        			// 일정 제목 칸에 값이 content에 담긴다
                            var content = $("#calendar_content").val();
                        			// 일정 방장 칸에 값이 master에 담긴다
                            var master = $("#calendar_master").val();
                        			// 일정 시작 시간 칸에 값이 start_date에 담긴다
                            var start_date = $("#calendar_start_date").val();
                        			// 일정 끝나는 시간 칸에 값이 end_date에 담긴다
                            var end_date = $("#calendar_end_date").val();
                        			// 일정 인원 칸에 값이 people에 담긴다
                            var people = $("#calendar_people").val();
                            		// 일정 아이디 칸에 값이 masterId에 담긴다
	                         var masterId = $("#calendar_id").val();
                            		// 일정 색
                            var color = $("#calendar_color").val();
                            		

                            		//내용 입력 여부 확인
                            if(content == null || content == ""){
                                alert("내용을 입력하세요.");
                            }else if(start_date == "" || end_date ==""){
                                alert("날짜를 입력하세요.");
                            }else if(new Date(end_date)- new Date(start_date) < 0){ // date 타입으로 변경 후 확인
                                alert("종료일이 시작일보다 먼저입니다.");
                            }else if(people < 0 || people == 0 || people == 1){
                                alert("인원을 잘못 입력하셨습니다. 다시 입력해 주세요.");
                            }else if(people > 4){
                                alert("인원은 4명까지 가능합니다.");
                            }else{
	                            var obj = {
	                                    "title" : content,
	                                    "master" : master,
	                                    "start" : start_date,
	                                    "end" : end_date,
	                                    "people" : people,
	                                    "masterId" : masterId,
	                                    "backgroundcolor" : color
	                                }//전송할 객체 생성
                                 console.log(obj); //서버로 해당 객체를 전달해서 DB 연동 가능
                                 $.ajax({
                                			 type : "GET",
                                			 url : "calendar.do",
                                			 data : obj,
                                			 error : function(error){
                                				 console.log("error");
                                			 },
                                			 success : function(data){
                                				 console.log("success");
                                			 }
                                 });
                          $("#calendarModal").modal("hide");
                          location.reload();
                          
                           
                                 
                            }
                        });
                    }else {
                    	alert("로그인이 필요합니다.");
                    	location.replace("loginPage.do");
                    }
                   
                    }
	     	 	}
	      },
	      editable: false,
	      dayMaxEvents: true // allow "more" link when too many events
	      
	    });
	    calendar.render();
	  });
  
  function logout(){
	  alert("로그아웃 되었습니다.");
	  location.replace("logOut.do");
  }
  
	
  
</script>

<body>
	
	<%
		String masterId = String.valueOf(session.getAttribute("memId"));
		String master = String.valueOf(session.getAttribute("memNick"));
	%>
	
	<input id="idcheck" type="hidden" value="${member.memId }">

		<div class="header">
		<div class="logo">
		<a href="${path}/main.do"><img src="${path }/resources/images/babpoollogo5.png"></a>
		</div>
		<div class="menu-bar">
			<li><a href="#calendar-title" class="link">약속 잡기</a></li>
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
			<li><a onclick="logout()" style="color: gray" id="logout">로그아웃</a></li>
		</c:if>
		<c:if test="${member == null }">
			<li><a href="${path }/loginPage.do" style="color: gray">로그인</a></li>
			<li><a href="${path }/join.do" style="color: gray">회원가입</a></li>
		</c:if>
		</div>
	</div>
	
	<div id="wrap">
	
		<div class="intro">
		
			<div class="intro-content">
				<p>혼자 밥 먹기 싫으신 분,</p>
				<p>음식 양이 너무 많아 곤란하신 분,</p>
				<h1>밥풀로 모여라!</h1>
				
			</div>
			
			<img src="${path}/resources/images/babpoolintro2.png" width="800px">
			<a id="scroll" class="scroll"><span></span></a>
			<div id="calendar-title"></div>
		</div>
		<section class="content">
			<div id="calendarBox">
				<div id="calendar"></div>
			</div>
			<!-- 선택했을 때 수정, 삭제 가능한 모달 추가 -->
			<div class="modal fade" id="calendarselectModal" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
				data-title="data">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">상세 내용</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label for="taskId" class="col-form-label">일정 제목</label> <input
									type="text" style="width: 445px" class="form-control"
									id="calendar_content1" name="calendar_content">
								 <input type="hidden" style="width: 445px" class="form-control"
									id="calendar_no1" name="calendar_no">
									<input type="hidden" style="width: 445px" class="form-control"
									id="calendar_id1" name="calendar_id" value=""
									readonly="readonly"> <label for="taskId"
									class="col-form-label">방장</label> <input type="text"
									style="width: 445px" class="form-control" id="calendar_master1"
									value="" name="calendar_master" readonly="readonly"> <label
									for="taskId" class="col-form-label">시작 날짜</label> <input
									type="date" style="width: 445px" class="form-control"
									id="calendar_start_date1" name="calendar_start_date"> 
									<label
									for="taskId" class="col-form-label">인원</label> <input
									type="number" style="width: 445px" class="form-control"
									id="calendar_people1" name="calendar_people" value="">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-warning" id="deleteButton" data-dismiss="modal">삭제</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal" id="sprintSettingModalClose">취소</button>
						</div>
					</div>
				</div>
			</div>

			<!-- 일정 추가 했을 때 modal 추가 -->
			<div class="modal fade" id="calendarModal" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
				data-title="data">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">일정 등록하기</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label for="taskId" class="col-form-label">일정 제목</label> <input
									type="text" style="width: 445px" class="form-control"
									id="calendar_content" name="calendar_content">
									<label
									for="taskId" class="col-form-label">아이디</label> <input
									type="text" style="width: 445px" class="form-control"
									id="calendar_id" name="calendar_id" value="${member.memId }"
									readonly="readonly"> <label for="taskId"
									class="col-form-label">방장</label> <input type="text"
									style="width: 445px" class="form-control" id="calendar_master"
									value="${member.memNickname }" name="calendar_master" readonly="readonly">

								<label for="taskId" class="col-form-label">시작 날짜</label> <input
									type="date" style="width: 445px" class="form-control"
									id="calendar_start_date" name="calendar_start_date">
									 <label
									for="taskId" class="col-form-label">인원</label> <input
									type="number" style="width: 445px" class="form-control"
									id="calendar_people" name="calendar_people" value="">
									<label
									for="taskId" class="col-form-label">일정 색</label> <input
									type="color" style="width: 445px" class="form-control"
									id="calendar_color" name="calendar_color" value="">
							</div>
						</div>
						<div class="modal-footer">
						<!-- 원태 : 여기 수정중 -->
							<button type="button" class="btn btn-warning" id="addCalendar">추가</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal" id="sprintSettingModalClose">취소</button>
						</div>
					</div>
				</div>
			</div>

			<section class="right-side">
				<h1><i class="fa-solid fa-door-open"></i> 채팅방 입장하기</h1>
				<hr>
				<c:forEach items="${scheduleList }" var="schedule">
					<div class="schedule">
						<input type="hidden" id="scheduleNo" name="calendar_no" value="${schedule.calNo }">
						<input type="hidden" id="scheduleTitle" name="calendar_title" value="${schedule.calTitle }">
						<input type="hidden" id="scheduleNick" name="calendar_nick" value="${schedule.calNick }">
						<input type="hidden" id="scheduleStart" name="calendar_start" value="${schedule.calStart }">
						<div class="schedule-content">
						<div class="schedule-title" style="font-weight: bold;">${schedule.calTitle }</div>
						<div class="schedule-info">
							<div class="schedule-nick">${schedule.calNick }</div>
							<div class="schedule-start-date">${schedule.calStart }</div>
						</div>
							<c:if test="${member ne null }">
								<div id="chat-button" style="background-color: ${schedule.calColor}; border-radius: 30px;"><a href="chat.do?calNo=${schedule.calNo }"
								onclick="window.open(this.href, '_blank', 'width=800px, height=900px, left=560px, top=50px'); return false;">채팅방 입장</a></div>
							</c:if>
							<c:if test="${member eq null }">
								<div id="chat-button" style="background-color: ${schedule.calColor}; border-radius: 30px;"><a href="loginPage.do"
								onclick="sendChat();">로그인 필요</a></div>
							</c:if>
							
						</div>
					</div>
				</c:forEach>
				
				<div class="page_wrap">
					<div class="page_nation">

						<!-- 첫 페이지  -->
						<a class="arrow pprev" href="main.do"
							data-page="1"></a>

						<!-- 이전 페이지 -->
						<c:if test="${paging.firstPage != 1 }">
							<a class="arrow prev"
								href="main.do?curPage=${paging.firstPage -1 }"
								data-page="${paging.firstPage -1 }"></a>
						</c:if>

						<!-- 페이지 넘버링  -->
						<c:forEach begin="${paging.firstPage }" end="${paging.lastPage }"
							var="i">
							<c:if test="${paging.curPage eq i}">
								<a href="#" style="font-weight: bold">${i }</a>
							</c:if>
							<c:if test="${paging.curPage ne i }">
								<a href="main.do?curPage=${i }" data-page="${i }">${i }</a>
							</c:if>
						</c:forEach>
						<!-- 다음  페이지  -->
						<c:if test="${paging.lastPage ne paging.totalPageCount }">
							<a class="arrow next"
								href="main.do?curPage=${paging.lastPage + 1 }"
								data-page="${paging.lastPage + 1 }"></a>
						</c:if>

						<!-- 마지막 페이지 -->
						<a class="arrow nnext"
							href="main.do?curPage=${paging.totalPageCount }"
							data-page="${paging.totalPageCount }"></a>
					</div>
				</div>
				
			</section>
			</section>
			

		<section class="board-list">

			<div class="freeboard">
				<div class="freeboard-title">자유게시판</div>
				<div class="freeboard-list">
				
				<div class="freeboard-list-notice">
			 		<table>
                    <colgroup>
                        <col width="70">	
                        <col width="400">
                        <col width="150">
                    </colgroup>
                  
                    <tbody>
                    	<c:forEach items="${mainNoticeList }" var="mainNotice">
                        <tr>
                            <td><img src="${path}/resources/images/notice-photo.png"></td>
                            <td><a href="noticeView.do?noticeNo=${mainNotice.noticeNo }">${mainNotice.noticeTitle }</a></td>
                            <td>${mainNotice.noticeWriter }</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
                </div>

					<div class="freeboard-list">
					<table>
                    <colgroup>
                        <col width="70">	
                        <col width="385">
                        <col width="135">
                    </colgroup>
                    <tbody>
                    	<c:forEach items="${mainFreeBoardList }" var="mainFreeBoard">
                        <tr>
                        		<td></td>
                            
                            <td><a href="freeView.do?freeBoardNo=${mainFreeBoard.freeBoardNo }">${mainFreeBoard.freeBoardTitle }</a></td>
                            
                            <td>${mainFreeBoard.freeBoardWriternick }</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
                </div>
					
					<div class="more">
						<a class="board-more" href="freeBoardList.do">더보기 ></a>
					</div>

				</div>
			</div>

			<div class="market">
				<div class="market-title">장터</div>
				<div class="market-content">
					<c:forEach items="${mainMarketList}" var="mainMarket">
					<a href="marketView.do?marketNo=${mainMarket.marketNo }">
						<div class="market-list">
							<div class="market-list-content">
								<c:if test="${mainMarket.attaches[0] ne null }">
									<c:if test = "${mainMarket.marketCategory eq '판매완료' }">
										<img src="${path }/resources/images/sell.png" width="150" height="150">
									</c:if>
									<c:if test="${mainMarket.marketCategory eq '삽니다' or mainMarket.marketCategory eq '팝니다'}">
									<img src="${path}/marketImage.do?fileName=${mainMarket.attaches.get(0).atchName}"
										width="150" height="150" alt="이미지를 찾을 수 없습니다.">
								</c:if>
								</c:if>
								<c:if test="${mainMarket.attaches[0] eq null }">
									<img src="${path}/resources/images/babpoollogo5.png"
										width="150" height="150" alt="이미지를 등록해 주세요.">
								</c:if>
							</div>
							<div class="market-list-title">${mainMarket.marketTitle }</div>
						</div>
						</a>
					</c:forEach>
				</div>
				<div class="more">
					<a class="board-more" href="marketList.do">더보기 ></a>
				</div>
				
			
			</div>
		</section>
		
	</div>

	<%@include file="/WEB-INF/inc/footer.jsp"%>

</body>

</html>