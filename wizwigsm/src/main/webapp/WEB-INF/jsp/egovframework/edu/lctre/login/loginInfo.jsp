<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	if('${user_id}' != ""){
		alert('${user_id}' + "님이로그인");
		document.location.href="/edu/lctre/selectLctreList.do";
	}else{
		alert("아이디와 패스워드를 확인해주세요.");	
		document.location.href="/edu/lctre/login/selectLctreLogin.do";
	}
</script>
<body>  

</body>
</html>
