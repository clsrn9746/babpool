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
<%-- 	<link href="<%=request.getContextPath() %>/resources/css/notice2.css" rel="stylesheet"> --%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://kit.fontawesome.com/94aab5b4e0.js"
	crossorigin="anonymous"></script>
<head>
<meta charset="UTF-8">
<title>밥풀</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" href="${path}/resources/css/recommend.css">
<link href="<%=request.getContextPath()%>/resources/css/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/footer.css" rel="stylesheet">
</head>
<%
	request.setCharacterEncoding("utf-8");
%>

<body>
		<%@include file="/WEB-INF/inc/header.jsp"%>
	<div id="wrap">

		<div class="wordCloud">
			<div class="wordCloudWrap">
				<h3>오늘의 키워드 메뉴</h3>
				<div class="menu_img">
					<img class="profile" src="/profileimg/${keywoards}"  style="margine:0 auto; width:500px; height: 400px;"/>
				</div>
			</div>
		</div>
		

		<div class="recommendWrap">
			<h3>가장 선호하는 메뉴를 차례대로 선택해주세요</h3>

			<div class="recommendList">
				<c:forEach items="${recommendList }" var="recommend">
						<div class="recommendItem" data-memid="${member.memId }"
							data-foodno="${recommend.foodNo  }">
							<p class="re_content">${recommend.foodTitle}<br>
								${recommend.foodScore}<br>
								${recommend.foodCategory}
							</p>
							<img src="${recommend.foodImg}">
						</div>
				
				</c:forEach>
	  	</div>

				<div class="button_tag">
					<a href="recommend.do">취소 |</a>
					<button type="button" class="btn_regist">등록</button>
				</div>
			</div>

		</div>
		<%@include file="/WEB-INF/inc/footer.jsp"%>
</body>
<script type="text/javascript">

$(document).ready(function() {
//      let scoreList = [];
//      let foodNoList = [];
//      let idList = [];
     var paramData = new Array();
	  var aJson = new Object();
     $(".recommendItem").on("click", function() {
    	 
	 		let memberId = $(this).closest(".recommendItem").data("memid");
	 		console.log("memberId", memberId);
	 		
			if(memberId != ""){
		    	$(this).remove();
		    	$(".recommendItem").css({"margin" : "0 auto","height": "260px"});
					
		 		let length = $(".recommendItem").children().length;
		 		let recommendScore = ((length + 2) / 10);
		 		let foodNo = $(this).closest(".recommendItem").data("foodno");
	 	 		memberId = $(this).closest(".recommendItem").data("memid");
		 		
		 		aJson.memberId = memberId;
		 		aJson.foodNo = foodNo;
		 		aJson.recommendScore = recommendScore;
		 		paramData.push(aJson);
		 		
		 		aJson = new Object();
	
		 		
	 			console.log(paramData);
			}else if (memberId == ""){
				alert("로그인이 필요합니다.");	
				location.href = "<c:url value='/loginPage.do'/>";
			}
	      });
	     
	  $(".btn_regist").on("click", function() {
		  	let memberID = (paramData)[0].memberId;
// 	    	console.log(JSON.stringify(paramData));
			console.log(memberID);
		  	
			$.ajax({
				type: 'POST',
				url : "<c:url value ='/recommendRegist.do'/>",
				data : JSON.stringify(paramData),
				contentType :"application/json; charset=UTF-8",
				dataType : "json",
				async : false,
				success : function(data) {
					if (data.flag == "success") {
						alert("등록이 되었습니다.");
						$("div .recommendWrap > h3").remove();
						$(".recommendWrap").prepend("<h3>비슷한 성향을 가진 밥풀이들</h3>");

						let memberId = memberID;
						console.log("data",data);
						console.log(data.result);
						var list_data = data.result;
						var html = "";
						for(var i= 0 ; i < list_data.length; i++){
							
							console.log(list_data[i].id);
							console.log(list_data[i].score);
							html += "<div class='recommendItem'>";
							html += "<p class='re_content'>" + list_data[i].id + "<br>"
										+'Ninkname:'+list_data[i].nickname+"<br>"
										+'유사도:'+((list_data[i].score)*100)+'%'+"<br>";
							if(list_data[i].profile == '프사'){
								html += "<img class='profile' src='${path}/resources/images/profile/profiledefault.png'>"+"</p>"
								
							}else if (list_data[i].profile != '프사'){
								html += "<img class='profile' src='profileimg/"+(list_data[i].profile)+"'>"+"</p>"

							}
										
							html += "</div>";
						}
						$("div .recommendList").append(html);
						$(".button_tag").remove();
					} else	if (data.flag == "false") {
						alert("로그인이 필요합니다");
						location.href = "<c:url value='/loginPage.do'/>";
					} else if (data.flag == "duple"){
						alert("오늘은 선택 완료");
						location.href = "<c:url value='/main.do'/>";
					} else if(data.flag == "first"){
						alert("오늘 처음으로 등록 한 밥풀이 입니다");
						location.href = "<c:url value='/main.do'/>";
					}
				}
				,error :function(request,status,error){  
						      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					
							console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				
// 				error : function(req) {
// 					alert("로그인이 필요합니다1111");
// 					location.href = "<c:url value='/loginPage.do'/>";
				
			    }
	 	 });
	});
  
});




</script>
</html>