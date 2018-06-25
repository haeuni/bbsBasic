<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>instrctrList</title>
<style>
	table {
		width: 700px;
		text-align: center;
	}
</style>
<script type="text/javascript">
/* 로그아웃 */
function fnNttForm(){	
	var frm = document.frm;
	frm.action = "/edu/ntt/insertNttForm.do";
	frm.submit();
}
/* 질의응답 목록 */
function fnNttList(){
	var frm = document.frm;
	frm.action = "/edu/ntt/selectNttList.do";
	frm.submit();
}
</script>
</head>
<body>
	<!-- 상세 이동에 쓰일폼 -->
	<form id="frm" name="frm" method="post">		
		<input type="hidden" id="frst_register_id" name="frst_register_id" value="${user_id}"/>
	
		<h4 style="color: blue; display: inline; margin-left: 500px;">
			<c:choose>
				<c:when test="${user_id eq 'admin'}">
					로그인 : 관리자
				</c:when>
				<c:when test="${user_id ne 'admin'}">
					로그인 : ${user_id}
				</c:when>
			</c:choose>
		</h4>
		<input type="button" value="로그아웃" onclick="fnLogOut();"/>
		
		<h3>질문 등록</h3>	
		<table border="1">
			<tr>
				<th>질문제목</th>
				<td colspan="2"><input type="text" id="ntt_sj" name="ntt_sj" size="20" style="width:100%; border: 0;"/></td>
				
			</tr>					
			<tr>
				<th>질문내용</th>
				<td colspan="2">
					<textarea type="text" id="ntt_cn" name="ntt_cn" rows="10" style="width:100%; border: 0; resize: none;"/></textarea>
				</td>
			</tr>
			
			<!-- 질문 등록 -->
			<tr>
				<td colspan="1"></td>
				<td style="background-color: yellow;"><a href="javascript:void(0);" onclick="fnNttForm();">등록</a></td>
				<td style="background-color: #cecece;"><a href="javascript:void(0);" onclick="fnNttList();">목록</a></td>
			</tr>
		</table>
	</form>	
</body>
</html>