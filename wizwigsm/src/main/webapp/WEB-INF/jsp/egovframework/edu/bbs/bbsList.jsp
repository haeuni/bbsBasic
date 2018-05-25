<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bbsList</title>
<link href="/css/egovframework/edu/bbs/table.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function fnForm(){
	/* 이동에 쓰일 폼을 찾기 */
	var frmForm = document.frmForm;
	frmForm.action = "/edu/bbs/selectBbsForm.do";
	frmForm.submit();
}

function fnDetail(id){
	var frmDetail = document.frmDetail;
	frmDetail.id.value = id;
	frmDetail.action = "/edu/bbs/selectBbsDetail.do";
	frmDetail.submit();
}
</script>
</head>
<body>
	<form id="frmForm" name="frmForm" method="post">		
	</form>

	<form id="frmDetail" name="frmDetail" method="post">		
		<input type="text" id="id" name="id" />	
	</form>
	
	<h3>게시판목록</h3>
	<table border="1">
		<tr>
			<th class="tdstyle">제목</th>
			<th class="tdstyle">작성자</th>
			<th class="tdstyle">조회수</th>
			<th class="tdstyle">작성일</th>
		</tr>
		<!-- title, cn, usr_nm, cnt, reg_date-->
		<c:forEach var="result" items="${bbsList}" >
		<tr>
			<td class="tdtitle">
				<a href="javascript:void(0)" onclick="fnDetail('${result.id}')"><c:out value="${result.title}"/></a>
			</td>
			<td><c:out value="${result.usr_nm}"/></td>
			<td><c:out value="${result.cnt}"/></td>
			<td><c:out value="${result.reg_date }"/></td>
		</tr>
		</c:forEach>
		<tr class="aColor">
			<td colspan="4"><a href="javascript:void(0)" onclick="fnForm()">등록</a></td>
		</tr>
	</table>
</body>
</html>