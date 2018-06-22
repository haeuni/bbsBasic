<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<style>
	.aTd{
		text-align: right;
	}
</style>  
<script>
$(function(){
	$("#lctre_begin").datepicker({
		  changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
		  changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
		  minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
		  nextText: '다음 달', // next 아이콘의 툴팁.
		  prevText: '이전 달', // prev 아이콘의 툴팁.
		  numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.		
		  yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
		  showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
		  currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
		  closeText: '닫기',  // 닫기 버튼 패널
		  dateFormat: "yymmdd", // 텍스트 필드에 입력되는 날짜 형식.
		  showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
		  dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
		  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식.
	})            
});
$(function(){
	$("#lctre_endde").datepicker({
		  changeMonth: true,
		  changeYear: true, 
		  minDate: '-100y',
		  nextText: '다음 달',
		  prevText: '이전 달',
		  numberOfMonths: [1,1],
		  yearRange: 'c-100:c+10',
		  showButtonPanel: true,
		  currentText: '오늘 날짜' ,
		  closeText: '닫기',
		  dateFormat: "yymmdd", 		
		  showMonthAfterYear: true ,
		  dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
		  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	})            
});
function fnList(){	
	var frm = document.frm;
	frm.listLimit.value = '${lctreVO.listLimit}';
	frm.action = "/edu/lctre/selectLctreList.do";
	frm.submit();
}

function fnSubmit(){
	var frm = document.frm;
	var sttus = document.getElementsByName('sttus');	/* 강의상태(radio) */
	
	for(var i=0; i<sttus.length; i++){
		if(sttus[i].checked){
			frm.lctre_sttus.value = sttus[i].value;
			//alert(sttus[i].value);
		}
	}
	frm.listLimit.value = '${lctreVO.listLimit}';
	frm.action = "/edu/lctre/insertLctreForm.do";
	frm.submit(); 
}
/* 강사명에 선택된 값  */
function fnSelInstrctrNm(){
	var frm = document.frm;
	frm.instrctr_seq.value = frm.selInstrctr_nm.options[frm.selInstrctr_nm.selectedIndex].value;
}

</script>
</head>
<body>
	<h3>강의등록</h3>
	<!-- 파일등록을 위한 속성 : enctype="multipart/form-data" -->
	<form id="frm" name="frm" method="post" enctype="multipart/form-data">
		<input type="hidden" id="instrctr_seq" name="instrctr_seq" /> <!-- 강사번호(selectbox) -->
		<input type="hidden" id="lctre_sttus" name="lctre_sttus" />	<!-- 강의상태(radio) -->
		<input type="hidden" id="listLimit" name="listLimit" />
		
		<table border="1">
			<tr>
				<th id="th">강사명</th>
				<td>				
				<!-- <input type="text" id="instrctr_nm" name="instrctr_nm"/> -->					
					<select name="selInstrctr_nm" onChange="fnSelInstrctrNm();" style="width:160px;">	
						<c:if test="${!empty lnstrctrCobList}">				
							<option value="">강사 선택하기</option>
							<c:forEach var="result" items="${lnstrctrCobList}">							
								<option value="${result.instrctr_seq}">${result.instrctr_nm}</option>
							</c:forEach>
						</c:if>
					</select>
				</td>	
			</tr>
			<tr>
				<th class="th">강의명</th>
				<td><input type="text" id="lctre_nm" name="lctre_nm"/></td>	
			</tr>
			<tr>
				<th>강의기간</th>
				<td class="lctreTerm">
					<input type="text" id="lctre_begin" name="lctre_begin" value="강의시작일 선택"/> ~
					<input type="text" id="lctre_endde" name="lctre_endde" value="강의종료일 선택"/>
				</td>	
			</tr>
			<tr>
				<th class="th">모집인원</th>
				<td><input type="number" id="rcrundt" name="rcrundt" min="5"/></td>	
			</tr>
			<tr>
				<th>강의상태</th>
				<td>
					<input type="radio" name="sttus" value="R" checked="checked"/>접수중
					<input type="radio" name="sttus" value="N" />접수종료 
				</td>	
			</tr>
			<tr>
				<th class="th"></th>
				<td class="aTd">
					<a href="javascript:void(0);" onclick="fnSubmit();">저장</a>
					<a href="javascript:void(0);" onclick="fnList();">목록</a>				
				</td>
			</tr>
		</table>	
	</form>
</body>
</html>