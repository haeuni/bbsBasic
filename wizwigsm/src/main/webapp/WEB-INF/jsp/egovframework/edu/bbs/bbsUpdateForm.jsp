<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bbsUpdateForm</title>
<link href="/css/egovframework/edu/bbs/table.css" rel="stylesheet" type="text/css">
<script>
function fnCancle(){
	var frmCancle = document.frmCancle;
	frmCancle.action ="/edu/bbs/selectBbsList.do";
	frmCancle.submit();
}
function fnUpdate(){
	var frmUpdate = document.frmUpdate;
	frmUpdate.action ="/edu/bbs/updateBbs.do";
	frmUpdate.submit();	
}
function fnDelete(){
	var frmDelete = document.frmDelete;
	frmDelete.action ="/edu/bbs/deleteBbs.do";
	frmDelete.submit();
}
</script>
</head>
<body>	
	<form id="frmCancle" name="frmCancle" method="post">
	</form>
	
	<form id="frmDelete" name="frmDelete" method="post">
		<input type="text" id="id" name="id" value="${bbsDetail.id}"/>
	</form>	
	
	<form id="frmUpdate" name="frmUpdate" method="post">
		<input type="text" id="id" name="id" value="${bbsDetail.id}"/>	
	
	<h3>게시판수정</h3>
	<table border="1">
		<tr>
			<th class="tdstyle">제목</th>
			<td colspan="2">
				<input type="text" id="title" name="title" value="${bbsDetail.title}" class="inputBack"/>
			</td>
		</tr>
		<tr>
			<th class="tdstyle">작성자</th>
			<td colspan="2">
				<input type="text" id="usr_nm" name="usr_nm" value="${bbsDetail.usr_nm}" class="inputBack"/>
			</td>
		</tr>
		<tr>
			<th class="tdstyle">내용</th>
			<td colspan="2">
				<input type="text" id="cn" name="cn" value="${bbsDetail.cn}" class="inputBackCn"/>
			</td>
		</tr>
		<tr class="aColor">
			<td><a href="javascript:void(0)" onclick="fnDelete()">삭제</a></td>
			<td><a href="javascript:void(0)" onclick="fnUpdate()">저장</a></td>
			<td><a href="javascript:void(0)" onclick="fnCancle()">취소</a></td>
		</tr>
	</table>
	</form>
</body>
</html>