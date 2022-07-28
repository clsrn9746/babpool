<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <title>밥풀</title> 
        <link rel="stylesheet" href="${path}/resources/css/pwchange.css">
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
        
    </head>
    <body>
        <section class="pwfind_form">
            <div class="pwfind_logo">비밀번호 변경</div>
            <form class="pwfindform" action="">
                <div class ="int-area">
                    <input type="password" id="oldpass" name="mem_id" value="" placeholder="현재 비밀번호 입력" autocomplete="off"
                    required>
                </div>
                <div class ="int-area">
                    <input type="password" id="newpass" name="memPass" value="" placeholder="변경할 비밀번호 입력" autocomplete="off"
                    required>
                </div>
                <div class ="int-area">
                    <input type="password" id="newpasscheck" name="mem_id" value="" placeholder="변경할 비밀번호 확인" autocomplete="off"
                    required>
                </div>
            </form>   
            <div class="btn-area">
                <button type="button" id="btn_id">CHANGE</button>
            </div>               
        </section>
    </body>
<script type="text/javascript">

	$("#btn_id").on("click", function(e){
		let thispass = "${member.memPass}";
		let oldpass = $("#oldpass").val();
		let newpass = $("#newpass").val();
		let newpasscheck = $("#newpasscheck").val();
		
		if(thispass == oldpass){
			if(newpass == newpasscheck){
				$.ajax({
					url : "<c:url value='pwchange.do'/>"
				  ,data : {"newpass" : newpass, "id" : "${member.memId}"}
				  ,type : "POST"
				  ,success : function(data){
					  if(data == "success"){
						  alert("비밀번호가 변경되었습니다!");
						  history.back();
					  }else{
						  alert("비밀번호 변경에 실패하였습니다!");
					  }
				  },error : function(req){
					  alert("에러");
				  }
				});//ajax
			}else{
				alert("변경할 비밀번호가 서로 동일하지 않습니다!")
				return false;
			}
		}else{
			alert("현재 비밀번호가 맞지 않습니다!");
			return false;
		}
		
		
		
		
	})// CHANGE 클릭	
	
	
	
	


</script>

</html>