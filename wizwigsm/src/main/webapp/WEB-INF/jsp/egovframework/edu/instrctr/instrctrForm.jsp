<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
function fnList(){
	var frmList = document.frmList;
	frmList.action = "/edu/instrctr/selectInstrctrList.do"
	frmList.submit();
}
function fnSubmit(){
	var frm = document.frmInfo;
	frm.action = "/edu/instrctr/insertInstrctrForm.do"
	frm.submit();
}
</script>
</head>
<body>	
	<!-- 목록으로 이동폼 -->
	<form id="frmList" name="frmList" method="post"></form>

	<h3>강사등록</h3>
	<form id="frmInfo" name="frmInfo" method="post">
		<table border="1">
			<tr>
				<th>강사명</th>
				<td><input type="text" id="instrctr_nm" name="instrctr_nm"/></td>	
			</tr>
			<tr>
				<th>학력</th>
				<td><input type="text" id="acdmcr" name="acdmcr"/></td>	
			</tr>
			<tr>
				<th>전공</th>
				<td><input type="text" id="major" name="major"/></td>	
			</tr>
			<tr>
				<th></th>
				<td>
					<a href="javascript:void(0)" onclick="fnSubmit()">저장</a>
					<a href="javascript:void(0)" onclick="fnList()">목록</a>				
				</td>
			</tr>
		</table>	
	</form>
</body>
</html>