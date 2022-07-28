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

<script type="text/javascript">
	$(document).ready(function(){
		if(${getmember == null}){
			alert("탈퇴한 회원입니다.");
			window.close();
		}
	});
</script>

<body>
	<div class="summaryContainer">
              <div class="profiles">
                  	<div class="title">
							<div class="box" style="background: #BDBDBD;">
	                	 	<c:if test="${getmember.memProfile == '프사'}">
	                    		<img class="profile" src="${path}/resources/images/profile/profiledefault.png">
	                    	</c:if>
	                    	<c:if test="${getmember.memProfile != '프사'}">
								<img class="profile" src="/profileimg/${getmember.memProfile}">
							</c:if>
                		</div>
					</div>
                  <table class="table">
                    <tr>
                      <td><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;${secretId }
                      </td>
                    </tr>
                    <tr>
                      <td> <span class="glyphicon glyphicon-comment" aria-hidden="true"></span>&nbsp;&nbsp;${getmember.memNickname }
                      </td>
                    </tr>
                    <tr>
                      <td>밥풀&nbsp;${getmember.memLevel }개 
                      </td>
                    </tr>
                    <tr>
                    	<c:choose>
	                    	<c:when test="${getmember.memRole == 'N' }">
	                      <td><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>&nbsp;&nbsp;활동 계정</td>
	                     </c:when>
                     	<c:otherwise>
	                      <td><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>&nbsp;&nbsp;정지 계정</td>
                     	</c:otherwise>
                     </c:choose>
                    </tr>
                    <tr>
                        <td>
                        		<button type="button" class="btn btn-danger" id="block" onclick="block()">차단</button>&nbsp;&nbsp;<button type="button" class="btn btn-success" id="favorite" onclick="favorite()">관심</button>
                        </td>
                    </tr>
                  </table>
                </div>
            </div>  
</body>
<script type="text/javascript">
	let thisRow = "${getmember.memNickname }";
	
	function favorite() {
		console.log(thisRow);

		if (!confirm("[" + thisRow + "]" + "회원을 관심회원으로 등록하시겠습니까?")) {
			return false;
		} else {
			$.ajax({
				url : "<c:url value='favorite.do'/>",
				type : "POST",
				data : {
					"nick" : thisRow
				},
				success : function(data) {
					if (data == "success") {
						alert("[" + thisRow + "]" + "회원을 관심회원으로 등록했습니다!");
						location.reload();
					} else if (data == "toomany") {
						alert("관심 회원 등록은 5명까지 가능합니다!");
						return false;
					} else if (data == "overlap") {
						alert("이미 관심회원으로 등록된 회원입니다!");
						return false;
					} else if (data == "loginplz") {
						alert("로그인이 필요합니다!");
						$(location).attr('href', 'loginPage.do');
					} else if (data == "itsme") {
						alert("자기 자신을 관심 등록할 수 없습니다!");
						return false;
					} else {
						alert("에러!");
						return false;
					}
				},
				error : function(req) {
					alert("에러");
					return false;
				}
			});//ajax

		}//else
	}//favorite

	function block() {

		if (!confirm("[" + thisRow + "]" + "회원을 차단하시겠습니까?")) {
			return false;
		} else {
			$.ajax({
				url : "<c:url value='block.do'/>",
				type : "POST",
				data : {
					"nick" : thisRow
				},
				success : function(data) {
					if (data == "success") {
						alert("[" + thisRow + "]" + "회원을 차단하였습니다.");
						location.reload();
					} else if (data == "toomany") {
						alert("차단은 5명까지 가능합니다!");
						return false;
					} else if (data == "overlap") {
						alert("이미 차단된 회원입니다!");
						return false;
					} else if (data == "loginplz") {
						alert("로그인이 필요합니다!");
						$(location).attr('href', 'loginPage.do');
					} else if (data == "itsme") {
						alert("자기 자신을 차단 할 수 없습니다!");
						return false;
					} else {
						alert("에러!");
						return false;
					}
				},
				error : function(req) {
					alert("에러");
					return false;
				}
			});//ajax

		}//else

	}//block





</script>
</html>