<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>학교</td>
		</tr>
		<c:forEach var="result" items="${voMap.voList}">
		<tr>			
			<td><c:out value="${result.no}"/></td>
			<td><c:out value="${result.name}" /></td>
			<td><c:out value="${result.school}"/></td>			
		</tr>
		</c:forEach>
	</table>
</body>
</html>