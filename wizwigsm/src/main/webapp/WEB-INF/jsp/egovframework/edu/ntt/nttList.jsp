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
	#sj{		
		text-align: left;
	}
	a{
		font-weight: bold;
		text-decoration: none;
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
/* 답변상세 */
function fnReplDetail(ntt_seq, parnts_ntt_seq){
	var frm = document.frm;	
	frm.ntt_seq.value = ntt_seq;	// 답글번호
	frm.parnts_ntt_seq.value = parnts_ntt_seq;	// 부모글번호(질묵제목 가져오기 위함)
	frm.action = "/edu/ntt/selectReplDetail.do";
	frm.submit();
}
</script>
</head>
<body>
	<form id="frm" name="frm" method="post">	
		<input type="hidden" id="frst_register_id" name="frst_register_id" value="${user_id}"/>
		<!-- 답변 상세 -->
		<input type="hidden" id="ntt_seq" name="ntt_seq"/>	
		<input type="hidden" id="parnts_ntt_seq" name="parnts_ntt_seq"/>	
		
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
		<table border="1" cellpadding="10px;">
			<tr>				
				<th colspan="2">No</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일자</th>
			</tr>	
				
			<!-- 질문 리스트  -->
			<c:forEach var="result" items="${nttList}" >			
				<c:if test="${result.frst_register_id ne 'admin'}" >			
				<tr>
					<td colspan="2"><c:out value="${result.ntt_seq}"/></td>
					<td id="sj"><a href="javascript:void(0);" onclick="fnNttDetail('${result.ntt_seq}');"><c:out value="${result.ntt_sj}"></c:out></a></td>
					<td><c:out value="${result.frst_register_id}"/></td>
					<td><c:out value="${result.inqire_cnt}"/></td>
					<td><c:out value="${result.frst_regist_pnttm}"/></td>
				</tr>							
				</c:if>
				<!-- 답변 리스트 -->
				<c:forEach var="repl" items="${replList}" >		
					<!-- 질문리스트의 글 번호가 답변리스트의 부모글번호가 같은 조건 -->
					<c:if test="${result.ntt_seq eq repl.parnts_ntt_seq}">																
						<tr>
							<td style="padding-left: 20px; background-color: yellow;"></td>
							<td><c:out value="${repl.ntt_seq}"/></td>
							<td id="sj"> [답변] <a href="javascript:void(0);" onclick="fnReplDetail('${repl.ntt_seq}','${repl.parnts_ntt_seq}');"><c:out value="${repl.ntt_sj}"></c:out></a>
							</td>
							<td><c:out value="${repl.frst_register_id}"/></td>
							<td><c:out value="${repl.inqire_cnt}"/></td>
							<td><c:out value="${repl.frst_regist_pnttm}"/></td>
						</tr>					
					</c:if>					
				</c:forEach><!-- 답변 end -->
			</c:forEach><!-- 질문 end -->
		</table>	
		<table style="margin-top: 20px;">	
			<!-- 질문 등록 -->
			<c:if test="${user_id ne 'admin'}">
			<tr>
				<td style="width: 555px;"></td>
				<td style="background-color: #cecece;"><a href="javascript:void(0);" onclick="fnNttForm();">질문등록</a></td>
			</tr>
			</c:if>
		</table>
	</form>	
</body>
</html>