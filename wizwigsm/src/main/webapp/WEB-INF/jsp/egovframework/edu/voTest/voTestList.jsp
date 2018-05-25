<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function fnSubmit() {
	var frm = document.frmInfo;
	frm.action = "/edu/test/selectVoTestList.do";
	frm.submit();
}	
</script>
</head>
<body>	
	<form  id="frmInfo" name="frmInfo" mothod="post">	
	<table border="1">
		<tr>
			<td>이름 </td>
			<td><input type="text" id="name" name="name"/></td>
		</tr>
		<tr>
			<td>학교</td>
			<td><input type="text" id="school" name="school"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="#" onclick="fnSubmit()">전송</a>
			</td>
		</tr>
	</table>		
	</form>		
	
	<table border="1">	
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>학교</td>
		</tr>
		<!-- empty 아무값이 없으면 true -->
		<c:if test="${!empty voList}">
		<c:forEach var="result" items="${voList}">
		<tr>
			<td><c:out value="${result.no}"/></td>
			<td><c:out value="${result.name}"/></td>
			<td><c:out value="${result.school}"/></td>
		</tr>		
		</c:forEach>
		</c:if>		
	</table>	
	
	
	
	
</body>
</html>