<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
alert("게시판글번호 : " + "${lctreDetail.lctre_seq}");

/* 목록으로 넘겨줄 스크립트 */
function fnList(){	
	var frm = document.frm;
	frm.action ="/edu/lctre/selectLctreList.do";
	frm.submit();
}
/* 삭제로 넘겨줄 스크립트 */
function fnDelete(){	
	var frm = document.frm;
	frm.action ="/edu/lctre/deleteLctre.do";
	frm.submit();
}
/* select 에서 선택한값 지정해주는 스크립트 */
function fnSelValue(){
	var frm = document.frm;
	/* select 에서 선택한 옵션값을 강의테이블의 instrctr_seq을 넘겨주기위한 input에 값을 대입.  */
	frm.instrctr_seq.value = frm.sel.options[frm.sel.selectedIndex].value;
}
/* 수정으로 넘겨줄 스크립트 */
function fnUpdate(){
	var frm = document.frm;
	frm.action ="/edu/lctre/updateLctre.do";
	frm.submit();	
}
</script>
</head>
<body>	
	<!-- 전송할 정보가 담겨있는 폼 선언(frm) -->
	<form id="frm" name="frm" method="post">
	
		<!-- 상세보기에서 원하는 내용을 보기위해 선택한 강의번호를 넘겨주기 위한 input  -->
		<input type="hidden" id="lctre_seq" name="lctre_seq" value="${lctreDetail.lctre_seq}"/>	
		
		<!-- 상세보기에서 수정한 강사번호를 넘기기 위한 input -->
		<input type="hidden" id="instrctr_seq" name="instrctr_seq" value="${lctreDetail.instrctr_seq}"/>

		<h3>게시판수정</h3>
		<table border="1">
			<tr>
				<th>강사명</th>
				<td colspan="5">
				<%-- <input type="text" id="instrctr_nm" name="instrctr_nm" value="${lctreDetail.instrctr_nm}"/> --%>
					
					<!-- 강사테이블에 있는 강사명을 불러오기위한 select 태그  -->
					<select name="sel" onChange="fnSelValue(this.frm);" style="width:160px;">	
					
						<!-- 불러온 강사 리스트(InstrctrConList)가 비어있지 않으면 수행되는 조건   -->
						<c:if test="${!empty lnstrctrCobList}">
						
							<!-- 불러온 강사 리스트(InstrctrConList)를 옵션으로 하나씩 보여주기위한 반복문 -->			
							<c:forEach var="result" items="${lnstrctrCobList}">			
							
								<!-- 변수 'result'에 넘겨진 강사리스트를 옵션의 value값으로 출력한다. / items에 담겨진 강사번호(instrctr_seq)를 넘긴다. -->				
								<option value="${result.instrctr_seq}"
								
									<%--  옵션에 보여줄 강사를 조건을 걸어준다. / 불러온 강사의 seq와 강사테이블의 강사seq와 같은 강사
									사용자 view에서는 강사명을 보여준다.--%>
									<c:if test="${result.instrctr_seq eq lctreDetail.instrctr_seq}">selected</c:if>>${result.instrctr_nm}
								</option>
							</c:forEach>
						</c:if>
					</select>					
				</td>
			</tr>
			<tr>
				<th>강의명</th>
				<td colspan="5">
					<!-- 넘겨받은 lctreDetail의 강의명을 input에 뿌려준다. -->
					<input type="text" id="lctre_nm" name="lctre_nm" value="${lctreDetail.lctre_nm}"/>
				</td>
			</tr>
			<tr>
				<th>모집인원</th>
				<td colspan="5">
					<!-- 넘겨받은 lctreDatail의 모집인원을 input에 뿌여준다. -->
					<input type="text" id="rcrundt" name="rcrundt" value="${lctreDetail.rcrundt}"/>
				</td>
			</tr>
			<tr>
				<!-- 각각 삭제, 저장, 목록을 클릭시 실행할 스크립트 , 함수 지정. -->
				<td colspan="2"><a href="javascript:void(0);" onclick="fnDelete();">삭제</a></td>
				<td colspan="2"><a href="javascript:void(0);" onclick="fnUpdate();">저장</a></td>
				<td colspan="2"><a href="javascript:void(0);" onclick="fnList();">목록</a></td>
			</tr>
		</table>
	</form>
</body>
</html>