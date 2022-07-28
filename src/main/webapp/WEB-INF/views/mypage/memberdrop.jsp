<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <title>밥풀</title> 
        <link rel="stylesheet" href="${path}/resources/css/memberdrop.css">
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
        
    </head>
   <script type="text/javascript">
$(document).ready(function(){
	alert("네이버 계정은 비밀번호란에 'naver'입력하고 탈퇴버튼을 누르셔야 탈퇴가 진행이 됩니다.");
});
</script>
    
    <body>
        <section class="pwfind_form">
            <div class="pwfind_logo">회원 탈퇴</div>
            <form class="pwfindform" action="">
                <div class ="int-area">
                    <input type="password" id="pass" name="memPass" value="" placeholder="비밀번호 입력" autocomplete="off"
                    required>
                </div>
                <div class ="int-area">
                    <input type="password" id="passcheck" name="mem_id" value="" placeholder="비밀번호 확인" autocomplete="off"
                    required>
                </div>
            </form>   
            <div class="btn-area">
                <button type="button" id="btn_id">탈퇴</button>
            </div>               
        </section>
    </body>
<script type="text/javascript">

	$("#btn_id").on("click", function(e){
		let thispass = "";
		let pass = $("#pass").val();
		let passcheck = $("#passcheck").val();
		let registType = "${member.registType }";
		
		if("${member.registType}" == 'naver'){
			thispass = "naver";
		}else{
			thispass = "${member.memPass}";
		}
		
		
		if(pass == passcheck){
			if(pass == thispass){
				$.ajax({
					url : "<c:url value='memberdrop.do'/>"
				  ,data : {"id" : "${member.memId}"}
				  ,type : "POST"
				  ,success : function(data){
					  if(data == "success"){
						  alert("회원 탈퇴가 완료되었습니다!");
						  location.replace('loginPage.do');
					  }
				  },error : function(req){
					  alert("에러");
				  }
				});//ajax
			}else{
				alert("비밀번호가 맞지 않습니다!");
			}
			
		}else{
			alert("입력한 비밀번호가 서로 동일하지 않습니다!");
			return false;
		}
		
		
	})// 탈퇴 클릭	
	
	
	
	


</script>

</html>