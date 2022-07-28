<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밥풀</title>
<%request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/mypage.css">
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> 
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		if(${member == null}){
			alert("로그인이 필요합니다!")
			location.replace("loginPage.do");
		}
	});
</script>
<body>
        <div class="wrap">
            <div class="greenContainer">
              <div class="profile_area">
                <div class="box" style="background: #BDBDBD;">
                	 	<c:if test="${member.memProfile == '프사'}">
                    		<img class="profile" src="${path}/resources/images/profile/profiledefault.png">
                    	</c:if>
                    	<c:if test="${member.memProfile != '프사'}">
							<img class="profile" src="/profileimg/${member.memProfile}">
						</c:if>
                </div>
                <div class="name">
                	  <c:if test="${member.memManager == 'y' }">
                    	[관리자]&nbsp;${member.memNickname }님 안녕하세요!<br>
                    </c:if>
                     <c:if test="${member.memManager != 'y' }">
                      ${member.memNickname }님 안녕하세요!<br>
                		</c:if>
                    <img class="jumsu" src="${path}/resources/images/profile/babpool_image.png" width="90" height="70"> 
                    <div class="avg">
                    ${member.memLevel }&nbsp;/&nbsp;10&nbsp;점
                    </div>
                </div>
                <form action="upload.do" method="post" id="uploadId" enctype="multipart/form-data">
	                <div class="profileimg">
		                <input type='file' accept='image/jpg,image/png,image/jpeg,image/gif' name="profileimg" id='profileimg'/>
		                <label for='profileimg' id='profileimg_label'><i class="far fa-file-image"></i>사진 선택</label>
	                </div>
                </form>
                <form action="upload.do" method="post" id="uploadId" enctype="multipart/form-data">
	                <div class="profile_upload">
		                <input type='button' accept='image/jpg,image/png,image/jpeg,image/gif' id='upload'/>
		                <label for='upload'><i class="far fa-file-image"></i>적용</label>
                	  </div>
                </form>
                <c:if test="${member.memManager == 'y' }">
	                <div class="management">
		                <input type='button' onclick="window.open('memberlist.do')" id='management'/>
		                <label for='management'><i class="far fa-file-image"></i>회원 관리</label>
                	  </div>
                </c:if>
                <div class="pwchange">
		                <input type='button' onclick="location.href='pwchangepage.do'" id='pwchangebtn'/>
		                <label for='pwchangebtn'><i class="far fa-file-image"></i>비밀번호 변경</label>
                	  </div>
                <!-- <div class="babpool">밥풀갯수</div> -->
              </div>    
              <!-- <div class="second_box" style="background: ;"> -->


              </div>  
            </div>
            <div class="summaryContainer">
              <div class="profiles">
                  <div class="title">내 프로필</div>
                  <table class="table">
                    <tr>
                      <td><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;${member.memName }
                      </td>
                    </tr>
                    <tr>
                      <td><span class="glyphicon glyphicon-star" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;${member.memGender }
                      </td>
                    </tr>
                    <tr>
                      <td><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;${member.memEmail }
                      </td>
                    </tr>
                    <tr>
                      <td id="phoneedit"><span class="glyphicon glyphicon-phone" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;${member.memPhone }
                     	<button type="button" class="btn btn-default" id="phonebtn">수정</button>
                      </td>
                    </tr>
                    <tr>
                      <td id ="likeedit"><span class="glyphicon glyphicon-heart" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;${member.memFoodCode }
                        <button type="button" class="btn btn-default" id="likebtn">수정</button>
                      </td>
                    </tr>
                  </table>
                </div>
                <div class="profiles">
                  <div class="title">관심 회원</div>
                  <table class="table">
                   	<c:if test="${favMember eq '[]'}">
                 			<tr>
                 				<td>관심 회원 없음</td>
                 			</tr>
                  	</c:if>
                  	<c:forEach items="${favMember }" var="favmember">
	                  	<tr>
	                      <td>
	                        <span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;${favmember.favMemid }(${favmember.favMemNick })
	                        <input type="hidden" value="${favmember.favMemid }">
	                        <button type="button" class="btn btn-default" id="fix" name="favorite">삭제</button>
	                      </td>
	                    </tr>
                  	</c:forEach>
                  </table>
                </div>
                <div class="profiles">
                  <div class="title">차단 회원</div>
                  <table class="table">
                  <c:if test="${blockMember eq '[]'}">
                 			<tr>
                 				<td>차단 회원 없음</td>
                 			</tr>
                  	</c:if>
                    	<c:forEach items="${blockMember }" var="blockmember">
	                  	<tr>
	                      <td>
	                        <span class="glyphicon glyphicon-ban-circle" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;${blockmember.blockMemid }(${blockmember.blockMemnick })
	                        <input type="hidden" value="${blockmember.blockMemid }">
	                        <button type="button" class="btn btn-default" id="fix" name="block">삭제</button>
	                      </td>
	                    </tr>
                  	</c:forEach>
                  </table>
                </div>
            </div>  
            <div class="summaryContainer">
              <div class="profiles">
                <div class="title"> 내가 쓴 글 ( 최근 목록 5개까지 표시됩니다 )</div>
                <table class="table table-striped">
                  <th>글 제목</th>
                  <th>작성 일자</th>
                  <th>게시판</th>
                 	<c:if test="${myFreeBoard eq '[]'}">
                 			<tr>
                 				<td>작성한 글 없음</td>
                 				<td>--</td>
                 				<td>--</td>
                 			</tr>
                 	</c:if>
                  <c:forEach items="${myFreeBoard }" var="freeBoard">
                  	<tr>
                  		<td><a class="click" onclick="window.open('freeView.do?freeBoardNo=${freeBoard.freeBoardNo }')">${freeBoard.freeBoardTitle }</a></td>
                  		<td>${freeBoard.freeBoardRegDate }</td>
                  		<td>자유게시판</td>
                  	</tr>
                  </c:forEach>
                </table>
              </div>

              <div class="profiles">
                <div class="title"> 내 장터 글</div>
                  <table class="table table-striped">
                    <th>장터 제목</th>
                    <th>등록 일자</th>
	                    <c:if test="${myMarket eq '[]'}">
	                 			<tr>
	                 				<td>작성한 장터 글 없음</td>
	                 				<td>--</td>
	                 			</tr>
	                  	</c:if>
	                    <c:forEach items="${myMarket }" var="market">
	                   	 <tr>
	                   	 	<td><a class="click" onclick="window.open('marketView.do?marketNo=${market.marketNo }')">${market.marketTitle }</a></td>
	                   	 	<td>${market.marketRegDate }</td>
	                   	 </tr>
	                    </c:forEach>
                  </table>
                </div>


                    
            </div>  
            <div class="infoContainer">
              <a href="noticeList.do" class="item">
                <div>Notice</div>
                <div>공지사항</div>
              </a>    
              <a href="main.do" class="item">
                <div>Main</div>
                <div>메인화면</div>
              </a>    
              <a href="memberDropPage.do" class="item">
                <div>Withdrawal</div>
                <div>회원탈퇴</div>
              </a>
            </div>
          </div>
    </body>

<script>

function autoHypenTel(str) {
	  str = str.replace(/[^0-9]/g, '');
	  var tmp = '';

	  if (str.substring(0, 2) == 02) {
	    // 서울 전화번호일 경우 10자리까지만 나타나고 그 이상의 자리수는 자동삭제
	    if (str.length < 3) {
	      return str;
	    } else if (str.length < 6) {
	      tmp += str.substr(0, 2);
	      tmp += '-';
	      tmp += str.substr(2);
	      return tmp;
	    } else if (str.length < 10) {
	      tmp += str.substr(0, 2);
	      tmp += '-';
	      tmp += str.substr(2, 3);
	      tmp += '-';
	      tmp += str.substr(5);
	      return tmp;
	    } else {
	      tmp += str.substr(0, 2);
	      tmp += '-';
	      tmp += str.substr(2, 4);
	      tmp += '-';
	      tmp += str.substr(6, 4);
	      return tmp;
	    }
	  } else {
	    // 핸드폰 및 다른 지역 전화번호 일 경우
	    if (str.length < 4) {
	      return str;
	    } else if (str.length < 7) {
	      tmp += str.substr(0, 3);
	      tmp += '-';
	      tmp += str.substr(3);
	      return tmp;
	    } else if (str.length < 11) {
	      tmp += str.substr(0, 3);
	      tmp += '-';
	      tmp += str.substr(3, 3);
	      tmp += '-';
	      tmp += str.substr(6);
	      return tmp;
	    } else {
	      tmp += str.substr(0, 3);
	      tmp += '-';
	      tmp += str.substr(3, 4);
	      tmp += '-';
	      tmp += str.substr(7);
	      return tmp;
	    }
	  }

	  return str;
	}



</script>



<script type="text/javascript">
	let thisRow = "";
	
	$("#upload").on("click",function(e){
		var fileCheck = document.getElementById("profileimg").value;
		if(!fileCheck){
			alert("사진을 선택 후 적용 버튼을 눌러주세요!");
		}else{
			$("#uploadId").submit();
			alert("프로필 사진이 변경되었습니다!");
		}
		
	});//upload
	
	$("#profileimg").on("change",function(e){
		$("#profileimg_label").text("다시 선택");
	});
	
	$("#likebtn").on("click", function(e){
		$("#likeedit").empty();
		$("#likeedit").prepend("<span class='glyphicon glyphicon-heart' aria-hidden='true'></span>&nbsp;&nbsp;&nbsp;");
		$("#likeedit").append("<select class='form-control' name='memFoodCode' id='likefood' required></select>");
		$("#likeedit").append("<button type='button' class='btn btn-default' id='likefix'>완료</button>");
			$("#likefood").append("<option value=''>좋아하는 음식 선택</option>");
			$("#likefood").append("<option value='한식'>한식</option>");
			$("#likefood").append("<option value='중식'>중식</option>");
			$("#likefood").append("<option value='일식'>일식</option>");
			$("#likefood").append("<option value='양식'>양식</option>");
			$("#likefood").append("<option value='분식'>분식</option>");
	});//likebtn
	
	$("#phonebtn").on("click", function(e){
		$("#phoneedit").empty();
		$("#phoneedit").prepend("<span class='glyphicon glyphicon-phone' aria-hidden='true'></span>&nbsp;&nbsp;&nbsp;");
		$("#phoneedit").append("<input type='text' id='mem_phone' name='memPhone' class='form-control' autocomplete='off' value='' pattern='[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}' placeholder='휴대폰' maxlength='13' required>");
		$("#phoneedit").append("<button type='button' class='btn btn-default' id='phonefix'>완료</button>");
	});//phonebtn
	
	$(document).on("click","#likefix" ,function(e){
		console.log("likefix 눌림");
		$.ajax({
			url : "<c:url value='likeedit.do'/>"
		  ,type : "POST"
		  ,data : {"like" : $("#likefood").val(), "id" : "${member.memId}"}
		  ,success : function(data){
			  if(data == "success"){
				  alert("변경이 완료되었습니다!");
				  location.reload();
			  }else if(data == "empty"){
				  alert("선택 후에 완료를 눌러주세요!");
			  }else{
				  alert("오류");
			  }
		  },error : function(req){
			  alert("에러");
		  }
			
		});//ajax
		
	});//likefix
	
	$(document).on("click","#phonefix" ,function(e){
		console.log("phonefix 눌림");
		$.ajax({
			url : "<c:url value='phoneedit.do'/>"
		  ,type : "POST"
		  ,data : {"phone" : $("#mem_phone").val(), "id" : "${member.memId}"}
		  ,success : function(data){
			  if(data == "success"){
				  alert("변경이 완료되었습니다!");
				  location.reload();
			  }else if(data == "empty"){
				  alert("입력 후에 완료를 눌러주세요!");
			  }else{
				  alert("오류");
			  }
		  },error : function(req){
			  alert("에러");
		  }
			
		});//ajax
		
	});//likefix
	
	$(document).on("keyup","#mem_phone", function(event){
		  event = event || window.event;
		  var _val = this.value.trim();
		  this.value = autoHypenTel(_val);
	});
	
	
	$('.btn').on("click", function(){
		let value = $(this).closest('tr');
		if(value.find('button').text() == "삭제"){
			thisRow = value.find('input').val();
			//alert(thisRow);
			if(value.find('button').attr('name') == "favorite"){
				favoriteRemove();
			}else if(value.find('button').attr('name') == "block"){ 
				blockRemove();
			}
		}
	});//삭제 버튼 클릭
	
	function favoriteRemove(){
		if(!confirm("["+ thisRow +"]" + "회원을 관심 삭제하시겠습니까?")){
			return false;
		}else{
			$.ajax({
				url : "<c:url value='favoriteRemove.do'/>"
			  ,type : "POST"
			  ,data : {"id" : thisRow}
			  ,success : function(data){
				  if(data == "success"){
					  alert("["+ thisRow +"]" + "회원을 관심회원에서 삭제하였습니다!");
					  location.reload();
				  }
			  },error : function(req){
				  alert("!에러");
				  return false;
			  }
			});//ajax
		}
	}// favoriteRemove
	
	function blockRemove(){
		if(!confirm("["+ thisRow +"]" + "회원을 차단 삭제하시겠습니까?")){
			return false;
		}else{
			$.ajax({
				url : "<c:url value='blockRemove.do'/>"
			  ,type : "POST"
			  ,data : {"id" : thisRow}
			  ,success : function(data){
				  if(data == "success"){
					  alert("["+ thisRow +"]" + "회원을 차단회원에서 삭제하였습니다!");
					  location.reload();
				  }
			  },error : function(req){
				  alert("!에러");
				  return false;
			  }
			});//ajax
		}
	} //blockRemove
	


</script>
</html>