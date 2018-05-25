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
	<form id="frmGu" name="frmGu" method="post">
		단 : <input type="text" id="txtDan" name="txtDan"/><br/>
		끝 : <input type="text" id="txtEnd" name="txtEnd"/>
		
			<input type="submit" value="전송"/>
	</form>
	
	<!-- 결과값을 돌리는 forEach -->
	<!-- varStatus="변수명" : 현재의 상태를 저장함  -->
	<c:forEach var="gugudan" items="${gugudanResult}" varStatus="status">
		<c:out value="${txtDanGet}"/> X 
		<c:out value="${status.count}"/> =
		<c:out value="${gugudan}"/><br/>
	</c:forEach>
	
	<br/>
	
	<!-- 결과값으로 -->
	<c:forEach var="gugudan" items="${gugudanResult}" varStatus="status">
		<!-- 1~입력한까지 -->
		<c:forEach var="gugudanfor" items="${listTxtEnd}">
			<c:if test="${status.count eq gugudanfor}">
				<c:out value="${txtDanGet}"/> X 
				<c:out value="${gugudanfor}"/> =
				<c:out value="${gugudan}"/><br/>
			</c:if>
		</c:forEach>		
	</c:forEach>	
	
	<c:forEach var="gugudan" items="${gugudanResult}" varStatus="status">
		<!-- 1~입력한까지 -->
		<c:forEach var="gugudanfor" items="${listTxtEnd}">
			<c:if test="${status.count eq gugudanfor}">
				<c:out value="${txtDanGet}"/> X 
				<c:out value="${gugudanfor}"/> =
				<c:out value="${gugudan}"/>
				
				<!-- status.count 인덱스값을 가진다. -->
				<c:if test="${status.count%2 eq 0}">
					<br/>
				</c:if>
			</c:if>
		</c:forEach>		
	</c:forEach>		
	
</body>
</html>