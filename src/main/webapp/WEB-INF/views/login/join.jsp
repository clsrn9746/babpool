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
	<link rel="stylesheet" href="${path}/resources/css/join.css">
        <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>

<body>
	<form action="regist.do" method="post">
		<div class="join">
        <div class="join_form">
            <div class="join_logo">밥풀</div>
            <div class="joinFrom">
                <div class="int-area">
                    <input type="text" id="mem_id" name="memId" value="" placeholder="아이디" autocomplete="off" required>
                    <button onclick="return false;" type="button" id="idCheck">확인</button>   
                </div>
                <div class="int-area">
                    <input type="text" id="mem_name" name="memName" value="" placeholder="이름" autocomplete="off"
                        required>
                    <select name="memGender" id="memGender" required>
                        <option value="">성별</option>
                        <option value="남자">남</option>
                        <option value="여자">여</option>
                    </select>
                    
                </div>
                <div class="int-area">
                    <input type="text" id="mem_nick_name" name="memNickname" value="" placeholder="닉네임" autocomplete="off"
                        maxlength="6" required>
                    <button onclick="return false;" type="button" id="nickCheck">확인</button>
                </div>
                <div class="int-area">
                    <input type="password" id="mem_pw" name="memPass" value="" placeholder="비밀번호" autocomplete="off"
                        required>
                </div>
                <div class="int-area">
                    <input type="password" id="mem_pw_check" name="memPassCheck" value="" placeholder="비밀번호 확인"
                        autocomplete="off" required>
                </div>
                <div class="int-area">
                    <input type="text" id="mem_phone" name="memPhone" autocomplete="off" value="" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" placeholder="휴대폰"
                         maxlength="13" required>
                </div>
                <div class="int-area">
                    <input type="date" id="mem_birth" name="memBirth" autocomplete="off" value="" placeholder="생년월일"
                        required>
                </div>
                <div class="int-area">
                    <input type="text" id="mem_email" name="memEmail" autocomplete="off" value="" placeholder="이메일"
                        required>
                    <button onclick="return false;" type="button" id="mailAuth">발송</button>
                </div>
                <div class="int-area">
                    <input type="text" id="mem_email_check" name="memEmailCheck" placeholder="인증번호" autocomplete="off" value="" readonly
                        required>
                    <button onclick="mailmsg()" type="button" id="mailCheck">인증</button>           
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

function mailmsg(){
	alert("발송 버튼을 눌러주세요!")
}

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
$(document).ready(function(){
	let isIdChecked = false;
	let isMailAuthed = false;
	let isNickChecked = false;
	
	$("input[name='memId']").on("change", function(e){
		isIdChecked=false;
	});//memId값 바뀔 때마다
	
	$("input[name='memNickname']").on("change", function(e){
		isNickChecked=false;
	});//memId값 바뀔 때마다
	
	
	
	$("#idCheck").on("click", function(e){
		e.preventDefault();
		$.ajax({
			url : "<c:url value='idCheck.do'/>"
		  ,data : {"id" : $("input[name='memId']").val()}
		  ,success : function(data){
			  if(data == "사용가능"){
				  isIdChecked = true;
				  alert("사용 가능한 아이디입니다!");
			  }else if(data == "공백"){
				  isIdChecked = false;
				  alert("아이디를 입력해주세요!");
			  }else{
				  isIdChecked = false;
				  alert("아이디가 중복됩니다!");
			  }
		  },error : function(req,status,err){
			  
		  }
			
		}); //ajax
		
	});//idcheck
	
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
	
	//mail인증하기 버튼 클릭 
	$("#mailAuth").on("click",function(e){
	    isMailAuthed=true;
	    if($("input[name='memEmail']").val() == ""){
	    	alert("메일주소를 입력 후 발송 버튼을 눌러주세요!")
	    }else{
		    $.ajax({
		        url : "<c:url value='mailAuth.do' />" 
		        ,data : {"mail" : $("input[name='memEmail']").val()}
		        ,success: function(data){
		        	if(data != 'false'){
			           alert("메일이 전송되었습니다!");
			           document.getElementById("mailCheck").onclick = null;
			           $("#mem_email_check").removeAttr("readonly");
			           $("#mem_email").attr("readonly", true);
			           document.querySelector("input[name=memEmailCheck]").focus();
		        	}else{
		        		alert("사용중인 이메일입니다!");
		        		return false;
		        	}
		        },error : function(data){
		            alert("메일 전송에 실패했습니다!")
		        }
		    });//ajax
	    }
	});//mailCheck
	
	$("#mailCheck").on("click",function(e){
		let mail = $("input[name='memEmail']").val();
		$.ajax({
			url : "<c:url value = 'mailCheck.do'/>"
		  ,type : "POST"
		  ,data : {"mail" : mail, "authKey" : $("input[name='memEmailCheck']").val()}
		  ,success : function(data){
			  if(data == "인증"){
				  isMailAuthed = true;
				  alert("이메일 인증이 완료되었습니다!")
			  }else{
				  isMailAuthed = false;
				  alert("인증번호가 다릅니다!")
			  }
		  },error : function(req,status,err){
			  console.log(req);
		  }
			
		});//ajax
		
	}); //이메일 인증
	
	
	$("button[type=submit]").on("click", function(e){
		e.preventDefault();
		if(isIdChecked){
			if(isMailAuthed){
				if(isNickChecked){
				//email 인증 확인
				$.ajax({
					url : "<c:url value ='authKeyCompare.do'/>"
				  ,type : "POST"
				  ,data : {"mail" : $("input[name='memEmail']").val()}
				  ,success : function(data){
					  if(data == "success"){
						  if($("input[name='memPass']").val() == $("input[name='memPassCheck']").val()){
							  alert("회원가입이 완료되었습니다!");
							  $("form").submit();
						  }else{
							  alert("비밀번호와 비밀번호 확인란이 같지 않습니다!")
						  }
					  }else{
						  alert("메일을 인증해주세요!");
					  }
				  },error : function(req,st,err){
					  alert("에러");
				  }
				}); //ajax
				
				}else{
					alert("닉네임 중복체크를 해주세요!");
				}
			}else{
				alert("메일을 인증해주세요!");
			}
		}else{
			alert("ID 중복체크를 해주세요!");
		}
		
	}); //join 눌렀을때
	
});//ready

$('#mem_phone').keyup(function (event) {
	  event = event || window.event;
	  var _val = this.value.trim();
	  this.value = autoHypenTel(_val);
	});


</script>
</html>