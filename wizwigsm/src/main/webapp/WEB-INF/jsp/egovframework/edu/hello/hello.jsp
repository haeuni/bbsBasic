<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	hello page
	<br/>
	<c:out value="${req_name}"/>
	<br/>
	<c:out value="${model_name}"/>
	<br/>
	<c:out value="${model_list}"/>
	<br/>
	<c:forEach var="gugudanResult" items="${model_gugudanList3}">
		<c:out value="${gugudanResult}"/>
	</c:forEach>
	
	<br/>
</body>
</html>