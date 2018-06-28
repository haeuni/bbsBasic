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
	}
	a{
		text-decoration: none;
	}
	#btn{
		text-align: center;
		margin-top: 100px;
	}
	#table{
		margin-top: 20px;
	}
</style>
<script type="text/javascript">
/* 로그아웃 */
function fnLogOut(){	
	var frm = document.frm;
	frm.action = "/edu/lctre/login/selectLctreLogOut.do";
	frm.submit();
}
/* 답변 수정 */
function fnReplMod(ntt_seq,parnts_ntt_seq){
	var frm = document.frm;	
	frm.ntt_seq.value = ntt_seq;
	frm.parnts_ntt_seq.value = parnts_ntt_seq;
	frm.action = "/edu/ntt/modReplForm.do";
	frm.submit();
}
/* 답변 삭제 */
function fnReplDel(ntt_seq){
	var frm = document.frm;
	
	//확인
	if (confirm("정말 삭제하시겠습니까??") == true){    
		frm.ntt_seq.value = ntt_seq;
		frm.action = "/edu/ntt/deleteNtt.do";
		frm.submit();
	}else{   //취소
	    return;
	}	
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
		
		<!-- 질문 제목 -->
		<input type="hidden" id="parnts_ntt_seq" name="parnts_ntt_seq"/>
		<!-- 답변 제목, 내용 -->
		<input type="hidden" id="ntt_seq" name="ntt_seq" />	
	
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
		
		<c:out value="${replDetail.ntt_sj}"/>
		
		<h3>답변 상세</h3>	
		<table border="1">
			<tr>
				<th style="width: 100px;">질문제목</th>
				<td colspan="3"><c:out value="${reqlDetail.repl_sj}"/></td>				
			</tr>					
			<tr>
				<th>답변 제목</th>
				<td colspan="3"><c:out value="${reqlDetail.ntt_sj}"/></td>
			</tr>
			<tr>
				<th>답변 내용</th>
				<td colspan="3"><c:out value="${reqlDetail.ntt_cn}"/></td>
			</tr>				
		</table>
		<table id="table">
			<!-- 답변 / 수정 / 삭제 / 목록 -->
			<tr id="btn">
				<!-- 글 작성자 일때만 수정, 삭제 가능 -->
				<c:if test="${user_id eq reqlDetail.frst_register_id}">			
					<td style="background-color: #cecece;"><a href="javascript:void(0);" onclick="fnReplMod('${reqlDetail.ntt_seq}','${reqlDetail.parnts_ntt_seq}');">수정</a></td>
					<td style="background-color: #cecece;"><a href="javascript:void(0);" onclick="fnReplDel('${reqlDetail.ntt_seq}');">삭제</a></td>
				</c:if>
				<td style="background-color: #cecece;"><a href="javascript:void(0);" onclick="fnNttList();">목록</a></td>
			</tr>
		</table>
	</form>	
</body>
</html>