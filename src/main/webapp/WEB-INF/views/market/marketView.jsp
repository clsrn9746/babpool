<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='${path}/resources/css/marketView.css' rel='stylesheet' />
<link href="<%=request.getContextPath()%>/resources/css/header.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/footer.css"
	rel="stylesheet">
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/94aab5b4e0.js"
	crossorigin="anonymous"></script>
<title>밥풀</title>
<%
	request.setCharacterEncoding("UTF-8");
%>
</head>

<script type="text/javascript">
	var getMarketNo = '${market.marketNo}';
	var memIn = '${member }';
	function oneByOne() {
		if(memIn == null || memIn == 'null' || memIn == ""){
			alert("로그인 후 이용가능합니다.");
			location.href = "loginPage.do";
		}else{
			var width = 800;
			var height = 900;
			var left = 560;
			var top = 50;
			
			var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+ top;

			const url = 'one.do?marketNo=' + getMarketNo;

			window.open(url, "_blank", windowStatus);
		}
		

	}
	
	function heartGo(){
		if(memIn == null || memIn == 'null' || memIn == ""){
			alert("로그인 후 이용가능합니다.");
			location.href = "loginPage.do";
		}
	}
</script>

<body>

	<%@include file="/WEB-INF/inc/header.jsp"%>
	<div id="wrap">

		<div class="content">
			<div class="content_title"></div>
			<div class="market_frame">
				<div class="market_image">
					<c:if test="${market.attaches[0] ne null }">
						<c:if test="${market.marketCategory eq '판매완료' }">
							<img src="${path }/resources/images/sell.png" width="428"
								height="428">
						</c:if>
						<c:if
							test="${market.marketCategory eq '삽니다' or market.marketCategory eq '팝니다'}">
							<c:forEach items="${market.attaches }" var="attaches">
								<img src="${path}/marketImage.do?fileName=${attaches.atchName}"
									width="428" height="428" alt="서버로 연결하셈">
							</c:forEach>
						</c:if>
					</c:if>
				</div>
				<div class="market_intro">
					<div class="market_content">
						<div class="market_title">${market.marketTitle }</div>
						<div class="market_price">${market.marketPrice }원</div>
						<hr>
					</div>
					<div class="market_view">
						<i class="fa-solid fa-heart" id="market_param">
							${market.marketLike } </i> <i class="fa-solid fa-eye">
							${market.marketHit } </i> <i class="fa-solid fa-clock">
							${market.marketRegDate } </i>
					</div>
					<div class="market_profile">
						<p class="market_nickname">
							판매자 <a href="marketMemberView.do?nick=${market.marketNickname }"
								onclick="window.open(this.href, '_blank', 'width=480, height=500'); return false;">${market.marketNickname }</a>
						</p>
						<p class="market_babpool_count">
							밥풀 갯수 <a href="#">${market.memLevel }</a>
						</p>
					</div>
					<div class="market_like">
						<button id="like" onclick="heartGo()">
							<i class="fa-solid fa-heart"></i> 찜
						</button>
						<c:if test="${member ne null }">
							<button class="talk" onclick="oneByOne()">
								<i class="fa-solid fa-comment"></i> 연락하기
							</button>
						</c:if>
						<c:if test="${member.memId eq market.marketId }">
							<button class="hate"
								onclick="location.href='marketEdit.do?marketNo=${market.marketNo }'">
								<i class="fa-solid fa-pen-to-square"></i> 관리하기
							</button>
						</c:if>
					</div>
				</div>

			</div>
			<hr>
			<div class="market_information">
				<p>상품 정보</p>
				<pre>${market.marketContent }
      </pre>
			</div>
			<hr>
		</div>
	</div>
	<div id="div_button">
		<a class="attach-button" href="marketList.do"><i>목록</i></a>
	</div>

	<%@include file="/WEB-INF/inc/footer.jsp"%>
</body>

<script>
	$("#like").on('click', function() {
		var marketNo = "${market.marketNo}";
		var marketLike = "${market.marketLike}";
		$.ajax({
			type : "GET",
			url : "marketLike.do",
			data : {
				"marketNo" : marketNo,
				"marketLike" : marketLike
			},
			error : function(error) {
				console.log("error");
			},
			success : function(data) {
				alert("찜 하셨습니다.");
				location.reload();
				$("#market_param").html(" " + data.market.marketLike);
			}
		});
	});
</script>

</html>