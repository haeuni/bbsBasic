<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
alert("게시판글번호 : " + "${lctreDetail.lctre_seq}");

/* for 강의목록 */
function fnList(){
	var frm = document.frm;
	frm.action = "/edu/lctre/selectLctreList.do";
	frm.submit();
}
/* 수정페이지이동 */
function fnUpdate(lctre_seq){
	var frm = document.frm;
	frm.lctre_seq.value = lctre_seq;
	frm.action = "/edu/lctre/updateLctreForm.do";
	frm.submit();
}
</script>
</head>
<body>	
	<form id="frm" name="frm" method="post">
	<input type="hidden" id="lctre_seq" name="lctre_seq"/>
		<h3>강의상세보기</h3>
		<table border="1">
			<tr>
				<th>강사명</th>
				<td colspan="3"><c:out value="${lctreDetail.instrctr_nm}"/></td>
			</tr>
			<tr>
				<th>강의명</th>
				<td colspan="3"><c:out value="${lctreDetail.lctre_nm}"/></td>
			</tr>
			<tr>	
				<th>모집인원</th>
				<td><c:out value="${lctreDetail.rcrundt}"/></td>
				<th>조회수</th>
				<td><c:out value="${lctreDetail.rdcnt}"/></td>
			</tr>
			<tr>
				<td colspan="2"><a href="javascript:void(0);" onclick="fnUpdate('${lctreDetail.lctre_seq}');">수정</a></td>
				<td colspan="2"><a href="javascript:void(0);" onclick="fnList();">목록</a></td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>