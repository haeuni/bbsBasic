<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>eduUsrInfo.jsp</title>
	<style>
		.tdstyle1{
			width: 50px;
		}
		.tdstyle2{
			width: 100px;
		}
	</style>
	<script>
		alert("Login success");
	</script>
</head>
<body>
	
	<h3>LOGIN</h3>
	<table border="1">
		<tr>
			<td class="tdstyle1">ID</td>
			<!-- 컨트롤러에서 넘겨받은 attribute c:out 으로 바로 출력  -->
			<td class="tdstyle2"><c:out value="${usrInfo.usrId}"/></td>	
		</tr>
		<tr>
			<td class="tdstyle1">PW</td>
			<td class="tdstyle2"><c:out value="${usrInfo.usrPw}"/></td>	
		</tr>		
		<tr>
			<td class="tdstyle1">NM</td>
			<td class="tdstyle2"><c:out value="${usrInfo.usrNm}"/></td>	
		</tr>
	</table>
	
</body>
</html>

