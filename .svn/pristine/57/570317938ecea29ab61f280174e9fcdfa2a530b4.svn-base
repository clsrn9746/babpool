<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <title>밥풀</title> 
        <link rel="stylesheet" href="${path}/resources/css/pwfind.css">
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
        
    </head>
    <body>
    	<form action="pwFindSuccess.do" method="post">
	        <section class="pwfind_form">
	            <div class="pwfind_logo">비밀번호 찾기</div>
	            <div class="pwfindform">
	                <div class ="int-area">
	                    <input type="text" id="inputEmail" name="memEmail" value="" placeholder="가입시 입력했던 이메일" autocomplete="off"
	                    required>
	                    <button onclick="" type="button" id="emailAuth">확인</button>
	                </div>
	            </div>   
	            <div class="btn-area">
	                <button type="button" id="btn_id">FIND</button>
	            </div>               
	        </section>
	    </form>
    </body>


<script type="text/javascript">

$(document).ready(function(){
	let emailChecked = false;
	
	$("#inputEmail").on("change", function(e){
		emailChecked = false;
	});// 바뀔때마다 false
	
	$("#emailAuth").on("click", function(e){
		$.ajax({
			url : "<c:url value = 'mailConfirm.do'/>"
		  ,data : {"email" : $("input[name='memEmail']").val()}
		  ,success : function(data){
			  if(data == "있음"){
				  emailChecked = true;
				  alert("존재하는 이메일입니다! FIND를 눌러주세요");
			  }else if(data == "공백"){
				  emailChecked = false;
				  alert("이메일을 입력 후 확인을 눌러주세요!");
				  
			  }else{
				  emailChecked = false;
				  alert("존재하지 않는 이메일입니다!");
			  }
		  },error : function(req,status,err){
			  console.log(req);
		  }
			
			
		})//ajax
		
	});//확인버튼
	
	
	$("#btn_id").on("click", function(e){
		if(emailChecked){
			$.ajax({
				url : "<c:url value = 'pwfindSubmit.do'/>"
			  ,data : {"mail" : $("input[name='memEmail']").val()}
			  ,success : function(data){
				  if(data == "success"){
					  alert("임시 비밀번호가 발급되었습니다. 메일을 확인해주세요!");
					  $("form").submit();
				  }else{
					  alert("발급에 실패하였습니다.");
				  }
			  },error : function(req,st,err){
				  alert("에러");
			  }
				
				
			});//ajax
			
			
			
			
		}else{
			alert("메일 확인 버튼을 눌러주세요!")
		}
	}); // submit 누를시
	
	
});//ready



</script>
</html>