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
	<h4>Post Test</h4>
	
	<form id="frmGu" name="frmGu" method="post">
		단 : <input type="text" id="txtDan" name="txtDan"/>
			<input type="submit" value="전송"/>
	</form>
	<br/>
	
	<c:forEach var="gugudan" items="${listGugudan}">
		 <c:out value="${strDan}"/> X 
		 <c:out value="${gugudan}"/> = 
		 <c:out value="${strDan*gugudan}"/>
		 <br/>
	</c:forEach>
	
	<c:out value="${strDan}"/>
	<br/>
	
	<c:forEach var="guguResult" items="${listGugudanResult}">
		<c:out value="${guguResult}"/><br/>
	</c:forEach>

</body>
</html>