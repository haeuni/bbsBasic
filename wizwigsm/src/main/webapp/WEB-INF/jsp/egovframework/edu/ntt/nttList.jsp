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
function fnLogOut(){	
	var frm = document.frm;
	frm.action = "/edu/lctre/login/selectLctreLogOut.do";
	frm.submit();
}
/* 질문등록*/
function fnNttForm(){
	var frm = document.frm;
	frm.action = "/edu/ntt/selectNttForm.do";
	frm.submit();
}
/* 질문상세 */
function fnNttDetail(ntt_seq){
	var frm = document.frm;
	frm.ntt_seq.value = ntt_seq;	// 질문글번호
	frm.action = "/edu/ntt/selectNttDetail.do";
	frm.submit();
}
</script>
</head>
<body>
	<!-- 질의응답 frm -->
	<form id="frm" name="frm" method="post">	
		<input type="hidden" id="ntt_seq" name="ntt_seq"/>	
		
		<!-- 로그인 -->
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
		
		<!-- 질의응답 list -->
		<h3>Q&A 게시판</h3>	
		<table border="1">
			<tr>
				<th>No</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일자</th>
			</tr>		
			<c:forEach var="result" items="${nttList}" >
			<tr>
				<td><c:out value="${result.ntt_seq}"/></td>
				<td><a href="javascript:void(0);" onclick="fnNttDetail('${result.ntt_seq}');"><c:out value="${result.ntt_sj}"></c:out></a></td>
				<td><c:out value="${result.frst_register_id}"/></td>
				<td><c:out value="${result.inqire_cnt}"/></td>
				<td><c:out value="${result.frst_regist_pnttm}"/></td>
			</tr>
			</c:forEach>
			
			<!-- 질의응답 등록 -->
			<c:if test="${user_id ne 'admin'}">
			<tr>
				<td colspan="4"></td>
				<td style="background-color: #cecece;"><a href="javascript:void(0);" onclick="fnNttForm();">질문등록</a></td>
			</tr>
			</c:if>
		</table>
	</form>	
</body>
</html>