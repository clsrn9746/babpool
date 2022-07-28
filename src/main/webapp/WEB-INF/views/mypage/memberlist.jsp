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
	<link href="<%=request.getContextPath() %>/resources/css/notice2.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
<head>
	<meta charset="UTF-8">
    <title>밥풀</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" href="${path}/resources/css/freeBoardList.css">
<link rel="stylesheet" href="${path}/resources/css/memberList.css">
</head>
<%
	request.setCharacterEncoding("utf-8");
%>

<body>
	<section class="notice">
            <div class="page-title">
              </div>
                  <div>
                      
                  </div>
        
                <!-- board search area -->
                <div id="board-search">
                    <div class="container">
                        <div class="search-window">
                            <form name="search" action="memberlist.do" method="post">
                                <input type="hidden" name="curPage" value="${searchVO.curPage }">
                                <input type="hidden" name="rowSizePerPage" value="${searchVO.rowSizePerPage }">
                                <div class="search-wrap">
                                    <label for="search" class="blind">자유게시판 내용 검색</label> <input
                                        id="search" type="search" name="searchWord" placeholder="검색할 회원의 아이디 또는 닉네임을 입력해주세요."
                                        value="${searchVO.searchWord }">
                                    <button type="submit" class="btn btn-dark">검색</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
        
        
            <!-- board list area -->
            <div id="board-list">
                <div class="container">
        
                    <table class="board-table">
                        <thead>
                            <tr>
                                <th scope="col" class="th-num">아이디</th>
                                <th scope="col" class="th-title">상태</th>
                                <th scope="col" class="th-auth">권한</th>
                                <th scope="col" class="th-date">관리</th>
                            </tr>
                        </thead>
                        
                        <tbody>
                        <c:forEach items="${memberList }" var="mem">
                            <tr>
                                <td class="th-num" id="listid"> ${mem.memId }</td>
                                <c:choose>
                                	  <c:when test="${mem.memRole == 'N' }">
                                			<td class="th-title" id="th-title"> 활동 중</td>
                                	  </c:when>
                               	  	  <c:otherwise>
                                			<td class="th-title" id="th-title"> 활동 정지</td>
                              		  </c:otherwise>
                                </c:choose>
                               	<c:choose>
                               		<c:when test="${mem.memManager == 'y' }">
                               			 <td>관리자</td>
                               		</c:when>
                               		<c:otherwise>
                               			 <td>회원</td>
                               		</c:otherwise>
                               	</c:choose>
                                <td class="th-date"> <a href="memberview.do?memid=${mem.memId }" onclick="window.open(this.href, '_blank', 'width=480, height=500'); return false;" 
                                class="btn btn-dark" id="managebtn">관리</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="page_wrap">
							<div class="page_nation">
				
								<!-- 첫 페이지  -->
								<a class="arrow pprev" href="memberlist.do?curPage=1" data-page="1"></a>
					
								<!-- 이전 페이지 -->
								<c:if test="${searchVO.firstPage != 1 }">
									<a class="arrow prev" href="memberlist.do?curPage=${searchVO.firstPage -1 }" data-page="${searchVO.firstPage -1 }"></a>
								</c:if>
				
								<!-- 페이지 넘버링  -->
								<c:forEach  begin="${searchVO.firstPage }" end="${searchVO.lastPage }" var="i">
									<c:if test="${searchVO.curPage eq i}">
										<a href="#" style="font-weight: bold">${i }</a>
									</c:if>
									<c:if test="${searchVO.curPage ne i }">  
										<a href="memberlist.do?curPage=${i }" data-page="${i }">${i }</a>
									</c:if>
								</c:forEach>
								<!-- 다음  페이지  -->
								<c:if test="${searchVO.lastPage ne searchVO.totalPageCount }">
									<a class="arrow next" href="memberlist.do?curPage=${searchVO.lastPage + 1 }" data-page="${searchVO.lastPage + 1 }"></a>
								</c:if>
				
								<!-- 마지막 페이지 -->
								<a class="arrow nnext" href="memberlist.do?curPage=${searchVO.totalPageCount }" data-page="${searchVO.totalPageCount }"></a>
							</div>
						</div>
                </div>
            </div>		
        </section>
</body>

<script type="text/javascript">
		// 변수 정의
		$form=$("form[name='search']");
		$curPage=$form.find("input[name='curPage']");

		// 각 이벤트 등록
		// 페이지 링크 클릭, event전파방지, data속성값읽고 form태그 내의 input name=curPage값 바꾸기 
		//submit
		$('.page_nation a[data-page]').click(function(e) {
			e.preventDefault();
			
			$curPage.val( $(this).data("page") );
			$form.submit();
		}); // ul.pagination li a[data-page]
		
		//form태그내의 버튼 클릭
		//이벤트전파방지, curPage 값 1로
		//submit
		$form.find("button[type=submit]").click(function(e) {
			e.preventDefault();
			$curPage.val(1);
			$form.submit();
		});
		
		// 목록 갯수 변경
		// id_rowSizePerPage 변경되었을 때
		// 페이지 1, 목록수 = 현재값 으로 변경 후 서브밋
		$('#id_rowSizePerPage').change(function(e) {
// 			e.preventDefault();
			$form.find("input[name='rowSizePerPage']").val($(this).val());
			$form.submit();
		}); // '#id_rowSizePerPage'.change

	</script>
	
</html>