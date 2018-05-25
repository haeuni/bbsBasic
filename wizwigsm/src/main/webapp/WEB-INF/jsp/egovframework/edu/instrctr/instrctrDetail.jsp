<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>instrctrDetail</title>
<script type="text/javascript">
/* 수정페이지이동 */
function fnUpdate(instrctr_seq){
	var frmUpdate = document.frmUpdate;
	frmUpdate.instrctr_seq.value = instrctr_seq;
	frmUpdate.action = "/edu/instrctr/updateInstrctrForm.do";
	frmUpdate.submit();
}
/* for 강의목록 */
function fnList(){
	var frmList = document.frmList;
	frmList.action = "/edu/instrctr/selectInstrctrList.do";
	frmList.submit();
}
</script>
</head>
<body>
	<form id="frmList" name="frmList" method="post">	
	</form>
	
	<form id="frmUpdate" name="frmUpdate" method="post">
	<input type="hidden" id="instrctr_seq" name="instrctr_seq"/>	
		<h3>강사상세보기</h3>
		<table border="1">
			<tr>
				<th>강사명</th>
				<td><c:out value="${instrctrDetail.instrctr_nm}"/></td>
			</tr>
			<tr>
				<th>학력</th>
				<td><c:out value="${instrctrDetail.acdmcr}"/></td>				
			</tr>
			<tr>
				<th>전공</th>
				<td><c:out value="${instrctrDetail.major}"/></td>
			</tr>
			<tr>
				<td><a href="javascript:void(0)" onclick="fnUpdate('${instrctrDetail.instrctr_seq}')">수정</a></td>
				<td><a href="javascript:void(0)" onclick="fnList()">목록</a></td>
			</tr>
		</table>
	</form>
	
</body>
</html>