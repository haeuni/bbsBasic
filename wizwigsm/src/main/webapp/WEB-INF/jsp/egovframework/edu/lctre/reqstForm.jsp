<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
function fnList(){	
	var frm = document.frm;
	frm.action = "/edu/lctre/selectLctreList.do";
	frm.submit();
}
function fnSubmit(lctre_seq){
	var frm = document.frm;
	frm.lctre_seq.value = lctre_seq;
	frm.action = "/edu/lctre/insertReqstForm.do";
	frm.submit();
}
</script>
</head>
<body>
	<h3>강의신청</h3>
	<form id="frm" name="frm" method="post">
		<input type="hidden" id="lctre_seq" name="lctre_seq" />
		<table border="1">
			<tr>
				<th>강의명</th>
				<td>		
					<c:out value="${ReqstLctreNm.lctre_nm}"/>				
				</td>	
			</tr>			
			<tr>
				<th>신청자</th>
				<td><input type="text" id="applcnt_nm" name="applcnt_nm"/></td>	
			</tr>
			<tr>
				<th></th>
				<td>
					<a href="javascript:void(0);" onclick="fnSubmit('${ReqstLctreNm.lctre_seq}');">저장</a>
					<a href="javascript:void(0);" onclick="fnList();">목록</a>				
				</td>
			</tr>
		</table>	
	</form>
</body>
</html>