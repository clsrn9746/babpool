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
	<link rel="stylesheet" href="${path}/resources/css/login.css">
        <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		 <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>     
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>

<body>





	<form action="loginCheck.do" method="post">
	<%
	String msg = request.getParameter("msg");
	if(msg != null){%>
	<script>
	alert("<%=msg%>")
	</script>
	<%} %>	
		<section class="login_form">
            <div class="login_logo">밥풀</div>
            	<div class="loginform">
                <div class ="int-area">
                    <input type="text" id="mem_id" name="memId" value="" placeholder="ID" autocomplete="off"
                    required>
                </div>
                <div class="int-area" id="pw_area">
                    <input type="password" id="mem_pw" name="memPass" placeholder="PASSWORD" autocomplete="off"
                    required>
                </div>
               </div>
            <div class="btn-area">
                <button type="submit" id="btn_id">LOGIN</button>
            </div>               
            <div class="caption">
                <h3>
                    <a href="join.do" id="join" onclick="">회원가입</a>
                    <a href="pwfindPage.do" id="find_pw" onclick="">비밀번호 찾기</a>
                </h3>
        </div>
        	<div id="naver_id_login">
        	<a href="${naverLoginurl }"><img width="300" height=auto; src="${path}/resources/images/naver_login.png"></a>
        	</div>
        </section>
	</form>
</body>
</html>