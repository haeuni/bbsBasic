<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>instrctrList</title>
<style>
	#btn{
		background-color : #cecece;
		font-weight: bold;	
	}
	#btn > a{
		color : black; 
		text-decoration: none;
	}
</style>
<script type="text/javascript">
function fnForm(){
	var frmForm = document.frmForm;
	frmForm.action = "/edu/instrctr/selectInstrctrForm.do";
	frmForm.submit();
}
function fnDetail(instrctr_seq){
	var frmDetail = document.frmDetail;
	frmDetail.instrctr_seq.value = instrctr_seq;
	frmDetail.action = "/edu/instrctr/selectInstrctrDetail.do";
	frmDetail.submit();
}
function fnLctreList(){	
	var frmForm = document.frmForm;
	frmForm.action = "/edu/lctre/selectLctreList.do";
	frmForm.submit();
}
</script>
</head>
<body>
	<!-- 등록 이동에 쓰일폼 -->
	<form id="frmForm" name="frmForm" method="post">		
	</form>

	<!-- 상세 이동에 쓰일폼 -->
	<form id="frmDetail" name="frmDetail" method="post">		
		<input type="hidden" id="instrctr_seq" name="instrctr_seq" />
	</form>
	
	<h3>강사목록</h3>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>강사명</th>
			<th>학력</th>
			<th>전공</th>
			<th>등록일</th>
		</tr>		
		<c:forEach var="result" items="${instrctrList}" >
		<tr>
			<td><c:out value="${result.instrctr_seq}"/></td>
			<td><a href="javascript:void(0)" onclick="fnDetail('${result.instrctr_seq}')"><c:out value="${result.instrctr_nm}"/></a></td>
			<td><c:out value="${result.acdmcr}"/></td>
			<td><c:out value="${result.major}"/></td>
			<td><c:out value="${result.frst_regist_pnttm}"/></td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="1" id="btn"><a href="javascript:void(0)" onclick="fnForm();">등록</a></td>
			<td colspan="1" id="btn"><a href="javascript:void(0)" onclick="fnLctreList();">강의목록</a></td>
			<td colspan="3"></td>
		</tr>
	</table>
</body>
</html>