<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>밥풀</title>
	<%request.setCharacterEncoding("utf-8"); %>
</head>
<body>
	<div>찬웅쌤의 게시판입니다.</div>
	<table>
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${boardList }" var="board">
				<tr class="text-center">
					<td>${board.boardNo }</td>
					<td>${board.boardTitle }</td>
					<td>${board.boardAuthor }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<script type="text/javascript">
	</script>
</body>
</html>