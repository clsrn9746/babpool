<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밥풀</title>
<%request.setCharacterEncoding("UTF-8"); %>
</head>
<body>
수정 완료
<%
	out.println("<script>alert('수정 완료');</script>");
	out.println("<script>location.href='marketList.do';</script>");
%>
</body>
</html>