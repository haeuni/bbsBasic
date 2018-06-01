<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	table{
		width : 350px;
		text-align: center;
	}
	.formBtn{
		width:100%; 
		background-color: #4c4a4a; 
		color: white;
	}
</style>
<script type="text/javascript">
/* 삭제버튼(신청상태 'c'를 'n'으로 바꿈) */
function fnUpdate(reqst_seq){
	var frm = document.frm;
	frm.reqst_seq.value = reqst_seq;
	frm.action = "/edu/lctre/modReqstBtnList.do";
	frm.submit();
}

/* 강의목록 */
function fnList(){
	var frm = document.frm;
	frm.action = "/edu/lctre/selectLctreList.do";
	frm.submit();
}
</script>
</head>
<body>	
	<form id="frm" name="frm" method="post">		
		<input type="hidden" id="reqst_seq" name="reqst_seq"/>		
		
		<h3>신청자 목록</h3>
		<table border="1">	
			<tr>
				<th>번호</th>
				<th>신청자</th>
				<th>신청일</th>
				<th>비고</th>
			</tr>
			<c:forEach var="result" items="${ReqstBtnList}">				
				<tr>
					<td><c:out value="${result.reqst_seq}"/></td>
					<td><c:out value="${result.applcnt_nm}"/></td>
					<td><c:out value="${result.frst_regist_pnttm}"/></td>
					<td><input type="button" onclick="fnUpdate('${result.reqst_seq}');" value="삭제" class="formBtn"/></td>
				</tr>
			</c:forEach>						
		</table>
		<button onclick="fnList();">목록</button>
	</form>
</body>
</html>