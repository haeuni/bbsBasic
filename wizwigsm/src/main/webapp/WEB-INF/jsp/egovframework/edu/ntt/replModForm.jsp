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
	a{
		text-decoration: none;
	}
	#table{
		margin-top: 20px;
	}
</style>
</style>
<script type="text/javascript">
/* 로그아웃 */
function fnLogOut(){	
	var frm = document.frm;
	frm.action = "/edu/lctre/login/selectLctreLogOut.do";
	frm.submit();
}
/* 답변 수정 */
function fnRepl(user_id){
	var frm = document.frm;
	frm.last_updusr_id.value = user_id;
	frm.action = "/edu/ntt/modRepl.do";
	frm.submit();
}
/* 질문 목록 */
function fnNttList(){
	var frm = document.frm;
	frm.action = "/edu/ntt/selectNttList.do";
	frm.submit();
}
</script>
</head>
<body>	
	<form id="frm" name="frm" method="post">		
		<input type="hidden" id="frst_register_id" name="frst_register_id" value="${user_id}"/>		
		<input type="hidden" id="last_updusr_id" name="last_updusr_id"/>	<!-- 수정시 최종 등록자 변경 -->	
		<input type="hidden" id="ntt_seq" name="ntt_seq" value="${reqlDetail.ntt_seq}"/>	
	
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
		
		<h3>답변 수정</h3>	
		<table border="1">
			<tr>
				<th>질문제목</th>
				<td colspan="2"><c:out value="${reqlDetail.repl_sj}"/></td>				
			</tr>
			<tr>
				<th>답변제목</th>
				<td colspan="2"><input type="text" id="ntt_sj" name="ntt_sj" value="${reqlDetail.ntt_sj}" style="width:95%;"/></td>				
			</tr>					
			<tr>
				<th>답변내용</th>
				<td colspan="2">
					<input type="text" id="ntt_cn" name="ntt_cn" value="${reqlDetail.ntt_cn}" style="width:95%;"/>
				</td>
			</tr>
		</table>	
		<table id="table">
			<!-- 질문 등록 -->
			<tr>
				<td style="background-color: yellow;"><a href="javascript:void(0);" onclick="fnRepl('${user_id}');">수정</a></td>
				<td style="background-color: #cecece;"><a href="javascript:void(0);" onclick="fnNttList();">목록</a></td>
			</tr>
		</table>
	</form>	
</body>
</html>