<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
		<link rel="stylesheet" type="text/css" href="${path}/resources/css/memberview.css">
        <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
        <!-- 합쳐지고 최소화된 최신 CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> 
<head>
	<meta charset="UTF-8">
    <title>밥풀</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<%
	request.setCharacterEncoding("utf-8");
%>

<body>
	<div class="summaryContainer">
              <div class="profiles">
                  <div class="title">회원 관리</div>
                  <table class="table">
                    <tr>
                      <td> <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;${getmember.memName }
                      </td>
                    </tr>
                    <tr>
                      <td> <span class="glyphicon glyphicon-comment" aria-hidden="true"></span>&nbsp;&nbsp;${getmember.memNickname }
                      </td>
                    </tr>
                    <tr>
                      <td><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;&nbsp;${getmember.memId }
                      </td>
                    </tr>
                    <tr>
                      <td><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>&nbsp;&nbsp;${getmember.memEmail }</td>
                    </tr>
                    <tr>
                    	<c:choose>
	                    	<c:when test="${getmember.memRole == 'N' }">
	                      <td><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>&nbsp;&nbsp;활동 중</td>
	                     </c:when>
                     	<c:otherwise>
	                      <td><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>&nbsp;&nbsp;활동 정지</td>
                     	</c:otherwise>
                     </c:choose>
                    </tr>
                    <tr>
                        <td>
                        	<c:choose>
                        		<c:when test="${getmember.memRole == 'N' }">
                        			<button type="button" class="btn btn-danger" id="black">활동 정지</button>
                        		</c:when>
                        		<c:otherwise>
                        			<button type="button" class="btn btn-success" id="white">정지 해제</button>
                        		</c:otherwise>
                        	</c:choose>
                        </td>
                    </tr>
                  </table>
                </div>
            </div>  
</body>
<script type="text/javascript">
	let memid = "${getmember.memId }";
	
	$("#black").on("click", function(e){
		$.ajax({
			url : "<c:url value = 'memberban.do'/>"
		  ,type : "POST"
		  ,data : {"memid" : memid}
		  ,success : function(data){
			  if(data == "success"){
				  alert("[" + memid + "]" + " 회원을 정지 처리했습니다!")
				  opener.document.location.reload();
				  self.close();
			  }else if(data == "auth"){
				  alert("관리자는 정지 처리할 수 없습니다.");
				  return false;
			  }	else{
				alert("실패");  
			  }
		  }	,error : function(req){
			  console.log(req);
		  }
			
		});//ajax
		
	});// ban
		
	$("#white").on("click", function(e){
		$.ajax({
			url : "<c:url value = 'memberpermit.do'/>"
		  ,type : "POST"
		  ,data : {"memid" : memid}
		  ,success : function(data){
			  if(data == "success"){
				  alert("[" + memid + "]" + " 정지 해제 처리 했습니다!")
				  opener.document.location.reload();
				  self.close();
			  }else{
				alert("실패");  
			  }
		  }	,error : function(req){
			  console.log(req);
		  }
			
		});//ajax
		
	});	//white





</script>
</html>