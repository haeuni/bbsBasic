<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
alert("게시판글번호 : " + "${lctreDetail.lctre_seq}");

function fnList(){	
	var frm = document.frm;
	frm.action = "/edu/lctre/selectLctreList.do";
	frm.submit();
}
function fnSubmit(){
	var frm = document.frm;
	frm.action = "/edu/lctre/insertLctreForm.do";
	frm.submit();
}
function fnSelValue(){
	var frm = document.frm;
	frm.instrctr_seq.value = frm.sel.options[frm.sel.selectedIndex].value;
}
</script>
</head>
<body>
	<h3>강의등록</h3>
	<!--  -->
	<form id="frm" name="frm" method="post">
		<!--  -->
		<input type="hidden" id="instrctr_seq" name="instrctr_seq" />
		<table border="1">
			<tr>
				<th id="th">강사명</th>
				<td>				
				<!-- <input type="text" id="instrctr_nm" name="instrctr_nm"/> -->					
					<select name="sel" onChange="fnSelValue(this.frm);" style="width:160px;">	
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
				<th class="th">모집인원</th>
				<td><input type="number" id="rcrundt" name="rcrundt" min="5"/></td>	
			</tr>
			<tr>
				<th class="th"></th>
				<td>
					<a href="javascript:void(0);" onclick="fnSubmit();">저장</a>
					<a href="javascript:void(0);" onclick="fnList();">목록</a>				
				</td>
			</tr>
		</table>	
	</form>
</body>
</html>