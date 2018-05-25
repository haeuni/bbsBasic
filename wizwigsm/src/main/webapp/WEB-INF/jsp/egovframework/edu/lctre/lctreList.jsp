<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function fnForm(){	
	var frm = document.frm;
	frm.action = "/edu/lctre/selectLctreForm.do";
	frm.submit();
}
function fnDetail(lctre_seq){
	var frm = document.frm;
	frm.lctre_seq.value = lctre_seq;
	frm.action = "/edu/lctre/selectLctreDetail.do";
	frm.submit();
}
</script>
</head>
<body>
	<form id="frm" name="frm" method="post">		
		<input type="hidden" id="lctre_seq" name="lctre_seq" />
	
	
	<h3>강의목록</h3>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>강의명</th>
			<th>강사명</th>
			<th>조회수</th>
			<th>모집인원</th>
			<th>등록일</th>			
		</tr>		
		<c:forEach var="result" items="${lctreList}" >
		<tr>
			<td><c:out value="${result.lctre_seq}"/></td>
			<td><a href="javascript:void(0);" onclick="fnDetail('${result.lctre_seq}');"><c:out value="${result.lctre_nm}"/></a></td>
			<td><c:out value="${result.instrctr_nm}"/></td>
			<td><c:out value="${result.rdcnt}"/></td>
			<td><c:out value="${result.rcrundt}"/></td>			
			<td id="date"><c:out value="${result.frst_regist_pnttm}"/></td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="6"><a href="javascript:void(0);" onclick="fnForm();">등록</a></td>
		</tr>
	</table>
	
	</form>
</body>
</html>