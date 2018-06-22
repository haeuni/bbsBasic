<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">	

/* 폼 전송전 로그인 체크 */
function fnLoginChk() {    	
   	var frm = document.frm;
   	
    if (frm.user_id.value == "") {
    	frm.user_id.focus();
        alert("아이디를 입력하세요");
        return;
    } else if (frm.user_pw.value == "") {
    	frm.user_pw.focus();
    	alert("비밀번호를 입력하세요");
    	return;
    } else {
    	frm.action = "/edu/lctre/login/selectLctreLoginForm.do";
    	frm.submit();
    }
   }
    
</script>
</head>
<body>
	<c:if test="${getSession eq null}">세션정보없음</c:if>
	<c:if test="${getSession ne null}">세션정보있음</c:if>
	<h1>로그인</h1>		
	<form id="frm" name="frm" method="post">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" id="user_id" name="user_id"/></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="text" id="user_pw" name="user_pw"/></td>
		</tr>
		<tr>
			<td></td>
			<td><a href="javascript:void(0);" onclick="fnLoginChk();">로그인</a></td>
		</tr>
	</table>		
	</form>
</body>
</html>
