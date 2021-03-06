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
function fnLogOut(){	
	var frm = document.frm;
	frm.action = "/edu/lctre/login/selectLctreLogOut.do";
	frm.submit();
}
/* 질문 답변 */
function fnNttRepl(){
	var frm = document.frm;
	frm.action = "/edu/ntt/selectReplForm.do";
	frm.submit();
}
/* 질문 수정 */
function fnNttMod(){
	var frm = document.frm;		
	frm.action = "/edu/ntt/modNttForm.do";
	frm.submit();		
}

/* 질문 삭제 */
function fnNttDel(){
	var frm = document.frm;		
	frm.action = "/edu/ntt/modNttForm.do";
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
		<!-- 답변 폼에 부모글 번호 가져감 -->
		<input type="hidden" id="ntt_seq" name="ntt_seq" value="${nttDetail.ntt_seq}"/>	
		<!-- 답변 폼에 보여줄 질문 제목 -->
		<input type="hidden" id="ntt_sj" name="ntt_sj" value="${nttDetail.ntt_sj}"/>
	
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
		
		<h3>질문 상세</h3>	
		<table border="1">
			<tr>
				<th style="width: 100px;">질문제목</th>
				<td colspan="3"><c:out value="${nttDetail.ntt_sj}"/></td>				
			</tr>					
			<tr>
				<th>질문내용</th>
				<td colspan="3"><c:out value="${nttDetail.ntt_cn}"/></td>
			</tr>			
		</table>
		<table id="table">
			<!-- 답변 / 수정 / 삭제 / 목록 -->
			<tr id="btn">
			<!-- 해당글의 답변글 없을때, 답변, 수정, 삭제 버튼 활성  -->
			<c:if test="${nttDetail.parntscnt eq 0}">
				<c:if test="${user_id eq 'admin'}">
					<td style="background-color: yellow;"><a href="javascript:void(0);" onclick="fnNttRepl();">답변</a></td>
				</c:if>	
				<!-- 글 작성자 일때만 수정, 삭제 가능 -->
				<c:if test="${user_id eq nttDetail.frst_register_id}">			
					<td style="background-color: #cecece;"><a href="javascript:void(0);" onclick="fnNttMod();">수정</a></td>
					<td style="background-color: #cecece;"><a href="javascript:void(0);" onclick="fnNttDel();">삭제</a></td>
				</c:if>
			</c:if>
			<td style="background-color: #cecece;"><a href="javascript:void(0);" onclick="fnNttList();">목록</a></td>
			</tr>
		</table>
	</form>	
</body>
</html>