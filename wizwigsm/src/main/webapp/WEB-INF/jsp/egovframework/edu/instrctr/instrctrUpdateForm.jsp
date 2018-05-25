<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>instrctrUpdateForm</title>
<link href="/css/egovframework/edu/bbs/table.css" rel="stylesheet" type="text/css">
<script>
function fnList(){
	var frmList = document.frmList;
	frmList.action ="/edu/instrctr/selectInstrctrList.do";
	frmList.submit();
}
function fnUpdate(){
	var frmUpdate = document.frmUpdate;
	frmUpdate.action ="/edu/instrctr/updateInstrctr.do";
	frmUpdate.submit();	
}
function fnDelete(){
	var frmDelete = document.frmDelete;
	frmDelete.action ="/edu/instrctr/deleteInstrctr.do";
	frmDelete.submit();
}
</script>
</head>
<body>	
	<form id="frmList" name="frmList" method="post">
	</form>
	
	<form id="frmDelete" name="frmDelete" method="post">
		<input type="hidden" id="instrctr_seq" name="instrctr_seq" value="${instrctrDetail.instrctr_seq}"/>
	</form>	
	
	<form id="frmUpdate" name="frmUpdate" method="post">
		<input type="hidden" id="instrctr_seq" name="instrctr_seq" value="${instrctrDetail.instrctr_seq}"/>	
	
		<h3>강사수정</h3>
		<table border="1">
			<tr>
				<th>강사명</th>
				<td colspan="5">
					<input type="text" id="instrctr_nm" name="instrctr_nm" value="${instrctrDetail.instrctr_nm}"/>
				</td>
			</tr>
			<tr>
				<th>학력</th>
				<td colspan="5">
					<input type="text" id="acdmcr" name="acdmcr" value="${instrctrDetail.acdmcr}"/>
				</td>
			</tr>
			<tr>
				<th>전공</th>
				<td colspan="5">
					<input type="text" id="major" name="major" value="${instrctrDetail.major}"/>
				</td>
			</tr>
			<tr>
				<td colspan="2"><a href="javascript:void(0)" onclick="fnDelete()">삭제</a></td>
				<td colspan="2"><a href="javascript:void(0)" onclick="fnUpdate()">저장</a></td>
				<td colspan="2"><a href="javascript:void(0)" onclick="fnList()">목록</a></td>
			</tr>
		</table>
	</form>
</body>
</html>