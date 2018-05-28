<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	h3{
		color : #4c4a4a;
	}
	th{
		background-color: #cecece;
	}
	#lctreBtn{
		background-color : #e91e63;
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
alert(reqstCntList);	// test

/* 신청등록버튼 */
function fnReqstForm(lctre_seq){	
	var frm = document.frm;
	frm.lctre_seq.value = lctre_seq;
	frm.action= "/edu/lctre/selectReqstForm.do";
	frm.submit();
}

/* 강의등록버튼 */
function fnLctreForm(){	
	var frm = document.frm;
	frm.action = "/edu/lctre/selectLctreForm.do";
	frm.submit();
}

function fnDetail(lctre_seq){
	var frm = document.frm;
	frm.lctre_seq.value = lctre_seq;
	frm.action = "/edu/lctre/selectLctreDetail.do";
	frm.submit();
}
</script>
</head>
<body>
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
		<tr>
			<!-- 강의번호 -->
			<td>
				<c:out value="${result.lctre_seq}"/>
			</td>
			
			<!-- 강의명 -->
			<td>
				<a href="javascript:void(0);" onclick="fnDetail('${result.lctre_seq}');"><c:out value="${result.lctre_nm}"/></a>
			</td>
			
			<!-- 강사명 -->
			<td>
				<c:out value="${result.instrctr_nm}"/>
			</td>
			
			<!-- 조회수 -->
			<td>
				<c:out value="${result.rdcnt}"/>
			</td>
			
			<!-- 모집 -->
			<td>			
				<c:out value="${result.reqst_cnt}"/> / <c:out value="${result.rcrundt}"/>
			</td>			
			
			<!-- 비고 -->
			<td>
				<button onclick="fnReqstForm('${result.lctre_seq}');" id="lctreBtn">수강신청</button>
			</td>
			
			<!-- 등록일 -->
			<td id="date">
				<c:out value="${result.frst_regist_pnttm}"/>
			</td>
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