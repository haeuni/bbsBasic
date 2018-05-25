<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bbsForm</title>
<link href="/css/egovframework/edu/bbs/table.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function fnSubmit(){
	var frm = document.frmInfo;
	frm.action = "/edu/bbs/insertBbs.do";
	frm.submit();
}
</script>
</head>
<body>
	<h3>게시판등록</h3>	
	<form id="frmInfo" name="frmInfo" method="post">
		<table border="1">
			<tr>
				<th class="tdstyle">제목</td>
				<td><input type="text" id="title" name="title" class="inputBack"/></td>
			</tr>
			<tr>
				<th class="tdstyle">작성자</td>
				<td><input type="text" id="usr_nm" name="usr_nm" class="inputBack"/></td>
			</tr>
			<tr>
				<th class="tdstyle">내용</td>
				<td><input type="text" id="cn" name="cn" class="inputBackCn"/></td>
			</tr>
			<tr class="aColor">
				<td colspan="2">
					<a href="javascript:void(0)" onclick="fnSubmit()">저장</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>