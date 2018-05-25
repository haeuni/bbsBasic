<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bbsDetail</title>
<link href="/css/egovframework/edu/bbs/table.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
/* 수정페이지이동 */
function fnUpdate(){
	var frmUpdate = document.frmUpdate;
	
	frmUpdate.action = "/edu/bbs/updateBbsForm.do";
	frmUpdate.submit();
}
/* 목록페이지이동 */
function fnList(){
	var frmList = document.frmList;
	frmList.action = "/edu/bbs/selectBbsList.do";
	frmList.submit();
}
</script>
</head>
<body>	
	<form id="frmUpdate" name="frmUpdate" method="post">
		<input type="text" id="id" name="id" value="${bbsDetail.id}"/>		
	</form>

	<form id="frmList" name="frmList" method="post">
	</form>
	
	<h3>게시판상세보기</h3>
	<table border="1">
		<tr>
			<th class="tdstyle">제목</th>
			<td colspan="5"><c:out value="${bbsDetail.title}"/></td>
		</tr>
		<tr>
			<th class="tdstyle">작성자</th>
			<td><c:out value="${bbsDetail.usr_nm}"/></td>
			<th class="tdstyle">작성일</th>
			<td><c:out value="${bbsDetail.reg_date}"/></td>
			<th class="tdstyle">조회수</th>
			<td><c:out value="${bbsDetail.cnt}"/></td>
		</tr>
		<tr>
			<th class="tdstyle">내용</th>
			<td colspan="5" id="tdstyle_cn"><c:out value="${bbsDetail.cn}"/></td>
		</tr>
		<tr class="aColor">
			<td colspan="3"><a href="javascript:void(0)" onclick="fnUpdate()">수정</a></td>
			<td colspan="3"><a href="javascript:void(0)" onclick="fnList()">목록</a></td>
		</tr>
	</table>
</body>
</html>