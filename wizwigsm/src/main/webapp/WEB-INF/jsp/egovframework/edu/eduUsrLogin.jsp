<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>eduUsrLogin.jsp</title>
</head>
<body>
	<h3>LOGIN</h3>
	<form method="get" action="<c:url value='/edu/eduUsrInfo.do'/>">
		ID : <input type="text" name="usrId"/>
		PW : <input type="text" name="usrPw"/>
		
		<input type="submit" value="전송">
	</form>	
	
	<script>
		alert("아이디와 비밀번호를 확인하세요.");
	</script>
</body>
</html>
