<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	table{
		text-align: center;	
	}
	h3{
		color : #4c4a4a;
	}
	th{
		background-color: #cecece;
	}
	#lctreBtnC{
		background-color : blue;
		color : white; 		
		font-weight: bold;	
		
	}
	#lctreBtnR{
		background-color : green;
		color : white; 		
		font-weight: bold;	
	}
	#lctreBtnN{
		background-color : red;
		color : white; 		
		font-weight: bold;	
	}
	.formBtn{
		width:100%; 
		background-color: #4c4a4a; 
		color: white;
	}
</style>
<script type="text/javascript">
/* 접수가능 버튼 */
function fnReqstForm(lctre_seq){	
	var frm = document.frm;	
	frm.lctre_seq.value = lctre_seq;
	frm.action= "/edu/lctre/selectReqstForm.do";
	frm.submit();
}
/* 접수중 버튼 */
function fnReqstList(lctre_seq){	
	var frm = document.frm;
	frm.lctre_seq.value = lctre_seq;
	frm.action= "/edu/lctre/selectReqstList.do";
	frm.submit();
}

/* 강의등록버튼 */
function fnLctreForm(){	
	var frm = document.frm;
	frm.action = "/edu/lctre/selectLctreForm.do";
	frm.submit();
}

/* 상세보기 */
function fnDetail(lctre_seq){
	var frm = document.frm;
	frm.lctre_seq.value = lctre_seq;
	frm.action = "/edu/lctre/selectLctreDetail.do";
	frm.submit();
}

</script>
</head>
<body>
	<!-- 오늘날짜 -->
	<c:set var="today" value="<%=new java.util.Date()%>" />	
	<!-- 현재날짜타입을 해당패턴으로 변환 -->
	<fmt:formatDate var="now" type="date" value="${today}" pattern="yyyyMMdd"/>	
	Today Date :  ${now}<br>

	<form id="frm" name="frm" method="post">		
		<input type="hidden" id="lctre_seq" name="lctre_seq" />	
	
	<h3>강의목록</h3>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>강의명</th>
			<th>강사명</th>
			<th>조회수</th>
			<th>모집인원</th>
			<th>비고</th>
			<th>등록일</th>			
		</tr>		
		<c:forEach var="result" items="${lctreList}" >
			<!-- 강의번호 -->
			<td><c:out value="${result.lctre_seq}"/></td>
			
			<!-- 강의명 -->
			<td><a href="javascript:void(0);" onclick="fnDetail('${result.lctre_seq}');"><c:out value="${result.lctre_nm}"/></a></td>
			
			<!-- 강사명 -->
			<td><c:out value="${result.instrctr_nm}"/></td>
			
			<!-- 조회수 -->
			<td><c:out value="${result.rdcnt}"/></td>
			
			<!-- 모집 (현재신청자수/모집인원수)-->
			<td><c:out value="${result.reqst_cnt}"/>/<c:out value="${result.rcrundt}"/></td>							
			
			<!-- 비고 -->
			<td>					
				<c:if test="${result.lctre_sttus eq 'R' && now lt result.lctre_begin}">				
					<button onclick="fnReqstForm('${result.lctre_seq}');" id="lctreBtnC">접수가능</button>
				</c:if>
				<c:if test="${result.lctre_sttus eq 'R' && now ge result.lctre_begin && now le result.lctre_endde}">		
					<button onclick="fnReqstList('${result.lctre_seq}');" id="lctreBtnR">접수중</button>
				</c:if>
				<c:if test="${result.lctre_sttus eq 'N' && now lt result.lctre_begin}">
					<button onclick="fnReqstList('${result.lctre_seq}');"  id="lctreBtnN">접수종료</button>
				</c:if>		
			</td>
			
			<!-- 등록일 -->
			<td id="date"><c:out value="${result.frst_regist_pnttm}"/></td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="5"></td>
			<td colspan="2"><button onclick="fnLctreForm();" class="formBtn">강의등록</button></td>
			<!-- <td colspan="2"><a href="javascript:void(0);" onclick="fnForm();">등록</a></td> -->
		</tr>
	</table>
	
	</form>
</body>
</html>