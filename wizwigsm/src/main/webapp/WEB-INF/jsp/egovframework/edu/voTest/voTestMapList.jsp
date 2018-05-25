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
	<!-- map -->
	<table border="1">
		<tr>
			<td>번호</td>
			<td><c:out value="${resultMap.no}"/></td>			
		</tr>
		<tr>
			<td>이름</td>
			<td><c:out value="${resultMap.name}"/></td>			
		</tr>
		<tr>
			<td>학교</td>
			<td><c:out value="${resultMap.school}"/></td>
		</tr>
	</table>
	<!-- List -->
	<table border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>학교</td>
		</tr>
		<c:forEach var="mapListfor" items="${mapList}">
		<tr>
			<td><c:out value="${mapListfor.no}"/></td>
			<td><c:out value="${mapListfor.name}"/></td>
			<td><c:out value="${mapListfor.school}"/></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>