<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<style>
	table{
		width : 500px;
		text-align: center;
	}
	button{
		width : 100%;
	}
	.formBtn{
		width:100%; 
		background-color: #4c4a4a; 
		color: white;
	}
</style>
<script type="text/javascript">
/* 신청인원 버튼
	function fnCnt(lctre_seq){
	var frm = document.frm;
	var reqstListDiv = document.getElementById("reqstListDiv")

	if(reqstListDiv.style.display == ""){
		reqstListDiv.style.display = "none";
	}
	else if(reqstListDiv.style.display == "none"){
		reqstListDiv.style.display = "";
	}
	
	/* frm.lctre_seq.value = lctre_seq;
	frm.action = "/edu/lctre/selectReqstBtnList.do";
	frm.submit();
} */
/* 강의목록 */
function fnList(){
	var frm = document.frm;
	frm.action = "/edu/lctre/selectLctreList.do";
	frm.submit();
}
/* 수정페이지이동 */
function fnUpdate(lctre_seq){
	var frm = document.frm;
	frm.lctre_seq.value = lctre_seq;
	frm.action = "/edu/lctre/updateLctreForm.do";
	frm.submit();
}
/* selectbox 선택한 option value 구하기 */
function fnSttus(){
	var frm = document.frm;
	var target = document.getElementById("selLctreSttus");
	frm.lctre_sttus.value = target.options[target.selectedIndex].value;
}
/* 신청상태저장 */
function fnSubmit(){
	var frm = document.frm;  	/* 폼 */
	var target = document.getElementById("selLctreSttus");	/* selectbox */
	var reqstNumArr = "";
	var reqstSttusArr = "";	
	var reqstLen = '${fn:length(reqstDetail)}';
	var reqstC = 0;
	
	/* 데이터 하나가 들어갈때는 배열로 인식되는 오류 처리 */
	if(reqstLen == 1){
		reqstNumArr = frm.reqst_seq.value;
		reqstSttusArr = frm.selLctreSttus.value;
	}else{
		/* 슬래시로 구분지어 하나의 문자열로 넘겨주기위함 */
		for(var i=0; i<reqstLen; i++){			
	 		reqstNumArr += frm.reqst_seq[i].value + "/";	/* (ex) 26/25/24/23 */
	 		reqstSttusArr += frm.selLctreSttus[i].value + "/"; 		/* (ex) C/R/C/N/C */    
	 		/*  만약에 'C'면 모집인원수와 비교하기위한 배열에 값을 count  */
	 		if(frm.selLctreSttus[i].value == 'C'){
	 			reqstC++;
	 		}
		}
	}	
	
	/* 만약 신청상태 값이 'C'인  count값이 저장된 reqstC가 모집인원수보다 많으면 저장 X */ 	
 	if(reqstC > '${lctreDetail.rcrundt}'){
 		alert('모집인원을 초과했습니다.');
 		return
 	}else{	
	 	frm.reqstNumArr.value = reqstNumArr;
	 	frm.reqstSttusArr.value = reqstSttusArr; 
	 	frm.action = "/edu/lctre/modReqstForm.do";
		frm.submit();
 	}	
}
</script>
</head>
<body>	
	<form id="frm" name="frm" method="post">	
		<input type="hidden" id="lctre_seq" name="lctre_seq"/>		
		<input type="hidden" id="lctre_sttus" name="lctre_sttus"/>
		<input type="hidden" id="reqstNumArr" name="reqstNumArr"/>
		<input type="hidden" id="reqstSttusArr" name="reqstSttusArr"/>
		
		<h3>강의상세</h3>
		<table border="1">
			<tr>
				<th>강사명</th>
				<td colspan="3"><c:out value="${lctreDetail.instrctr_nm}"/></td>
			</tr>
			<tr>
				<th>강의명</th>
				<td colspan="3"><c:out value="${lctreDetail.lctre_nm}"/></td>
			</tr>
			<tr>	
				<th>모집인원</th>
				<td>
					<c:out value="${lctreDetail.rcrundt}"/>
				</td>
				<th>조회수</th>
				<td><c:out value="${lctreDetail.rdcnt}"/></td>
			</tr>
			<tr>	
				<th>강의상태</th>
				<td>
					<c:choose>	
					    <c:when test="${lctreDetail.lctre_sttus eq 'R'}">접수중</c:when>	
					    <c:otherwise>접수종료</c:otherwise>	
					</c:choose>
				</td>
				<th>신청인원</th>
				<%-- <td><input type="button" id="reqst_cnt" name="reqst_cnt" value="${lctreDetail.reqst_cnt}" onclick="javascript:fnCnt();"/></td> --%>
				<td><c:out value="${lctreDetail.reqst_cnt}"/></td>
			</tr>
			<tr>
				<th>강의시작일</th>
				<td><c:out value="${lctreDetail.lctre_begin}"/></td>	
				<th>강의종료일</th>
				<td><c:out value="${lctreDetail.lctre_endde}"/></td>		
			</tr>
			<tr>
				<td colspan="2"></td>
				<td colspan="1"><button onclick="fnUpdate('${lctreDetail.lctre_seq}');" class="formBtn">수정</button></td>
				<td colspan="1"><button onclick="fnList();" class="formBtn">목록</button></td>
			</tr>
		</table>
		
		
		<h3>신청목록</h3>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>신청자</th>
				<th>신청일</th>
				<th>신청상태</th>
			</tr>
			<c:forEach var="result" items="${reqstDetail}">
				
				<input type="hidden" id="reqst_seq" name="reqst_seq" value="${result.reqst_seq}"/>
				<tr>
					<td><c:out value="${result.reqst_seq}"/></td>
					<td><c:out value="${result.applcnt_nm}"/></td>
					<td><c:out value="${result.frst_regist_pnttm}"/></td>
					<!-- 신청상태 (완료:C / 신청중:R / 취소:N) -->
					<td>
					${result.lctre_sttus} 
						<select name="selLctreSttus" id="selLctreSttus" onchange="fnSttus();">
								<option value="C" <c:if test="${result.lctre_sttus eq 'C'}" >selected</c:if>>신청완료</option>
								<option value="R" <c:if test="${result.lctre_sttus eq 'R'}" >selected</c:if>>신청중</option>
								<option value="N" <c:if test="${result.lctre_sttus eq 'N'}" >selected</c:if>>신청취소</option>
						</select>				
					</td>
				</tr>
			</c:forEach>	
			<tr>		
				<td colspan="3"></td>
				<td colspan="1">
					<input type="button" onclick="fnSubmit();" value="저장" class="formBtn"/>
				</td>
			</tr>			
		</table>
	</form>
</body>
</html>