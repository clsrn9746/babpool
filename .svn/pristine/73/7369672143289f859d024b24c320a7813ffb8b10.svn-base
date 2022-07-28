<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밥풀</title>
	<%request.setCharacterEncoding("UTF-8"); %>
	<link rel="stylesheet" href="${path}/resources/css/naverjoin.css">
        <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>
<script>
	alert("네이버 로그인 정보가 없어 간편가입 후 이용하실 수 있습니다.");
</script>
<body>
	<form action="naverregist.do" method="post" id="formsubmit">
		<div class="join">
        <div class="join_form">
            <div class="join_logo">밥풀</div>
            <div class="joinFrom">
                <div class="int-area">
                    <input type="hidden" id="mem_id" name="memId" value="naver_${realid }" placeholder="아이디" autocomplete="off" required>
                </div>
                <div class="int-area">
                    <input type="text" id="mem_name" name="memName" value="${name }" placeholder="이름" autocomplete="off"
                        readonly>
                        <!-- c:if 써라 남규야 (value는 남자, 여자) -->
                        <c:if test="${gender eq 'M'}">
		                    <input type="hidden" id="memGender" name="memGender" value="남자" placeholder="이름" autocomplete="off"
		                        required>
                        </c:if>
                        <c:if test="${gender eq 'F'}">
		                    <input type="hidden" id="memGender" name="memGender" value="여자" placeholder="이름" autocomplete="off"
		                        required>
                        </c:if>
                </div>
                <div class="int-area">
                    <input type="text" id="mem_nick_name" name="memNickname" value="" placeholder="닉네임" autocomplete="off"
                        maxlength="6" required>
                    <button onclick="return false;" type="button" id="nickCheck">확인</button>
                </div>
                <div class="int-area">
                    <input type="hidden" id="mem_pw" name="memPass" value="${id }" placeholder="비밀번호" autocomplete="off"
                        >
                </div>
                <div class="int-area">
                    <input type="hidden" id="mem_phone" name="memPhone" autocomplete="off" value="${mobile }" placeholder="휴대폰"
                         maxlength="11" required>
                </div>
                <div class="int-area">
                    <input type="date" id="mem_birth" name="memBirth" autocomplete="off" value="" placeholder="생년월일"
                        required>
                </div>
                <div class="int-area">
                    <input type="text" id="mem_email" name="memEmail" autocomplete="off" value="${email }" placeholder="이메일"
                        required readonly>
                </div>
                <div class="int-area">
                    <input type="text" id="mem_add" name="memAddress" autocomplete="off" value="" placeholder="주소" readonly onclick="findAddr()"
                        required>           
                </div>
                <div class="int-area">
                    <input type="text" id="mem_add2" name="memAddress2" autocomplete="off" value="" placeholder="상세 주소" 
                        required>           
                </div>
                <div class="like_food_area">
                    <select name="memFoodCode" id="like_food" required>
                        <option value="">좋아하는 음식 선택</option>
                        <option value="한식">한식</option>
                        <option value="중식">중식</option>
                        <option value="일식">일식</option>
                        <option value="양식">양식</option>
                        <option value="분식">분식</option>
                    </select>
                </div>
            </div>
            <div class="btn-area">
                <button type="submit" id="btn_id" >JOIN</button>
            </div>
        </div>
    </div>
	</form>
</body>

<script>
function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	console.log(data);
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            document.getElementById("mem_add").value = roadAddr;
            $("#mem_add2").focus();
        }
    }).open();
}

</script>

<script type="text/javascript">
	
	$(document).ready(function(){
		let isNickChecked = false;
		
		$("input[name='memNickname']").on("change", function(e){
			isNickChecked=false;
		});//memId값 바뀔 때마다
		
		$("#nickCheck").on("click", function(e){
			e.preventDefault();
			$.ajax({
				url : "<c:url value='nickCheck.do'/>"
			  ,data : {"nick" : $("input[name='memNickname']").val()}
			  ,success : function(data){
				  if(data == "사용가능"){
					  isNickChecked = true;
					  alert("사용 가능한 닉네임 입니다!");
				  }else if(data == "공백"){
					  isNickChecked = false;
					  alert("닉네임을 입력해주세요!");
				  }else{
					  isNickChecked = false;
					  alert("사용 중인 닉네임입니다!");
				  }
			  },error : function(req,status,err){
				  
			  }
				
			}); //ajax
			
		});//nickcheck
		
		$("button[type=submit]").on("click", function(e){
			e.preventDefault();
				if(isNickChecked){
					alert("네이버 간편가입이 완료되었습니다!");		
					 $("form").submit();
				}else{
					alert("닉네임 중복체크를 해주세요!");
				}
			
		}); //join 눌렀을때
		
		
		
	});//ready

</script>

</html>