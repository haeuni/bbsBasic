<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	table{
		width: 750px;
		text-align: center;	
	}
	h3{
		color : #4c4a4a;
	}
	th{
		background-color: #cecece;
	}
	a{
	 	text-decoration: none;
	}
	#tdBtn{
		background-color : #f3f3f0;
	}
	#lctreBtnC{		
		color : blue; 		
		font-weight: bold;			
	}
	#lctreBtnR{
		color : green; 		
		font-weight: bold;	
	}
	#lctreBtnN{
		color : red; 		
		font-weight: bold;	
	}
	.formBtn{
		width:100%; 
		background-color: #4c4a4a; 
		color: white;
	}
</style>
<script type="text/javascript">

/* 로그아웃 */
function fnLogOut(){	
	var frm = document.frm;
	frm.action = "/edu/lctre/login/selectLctreLogOut.do";
	frm.submit();
}
/* Q&A 게시판 */
function fnNttList(){
	var frm = document.frm;
	frm.action = "/edu/ntt/selectNttList.do";
	frm.submit();
}

/* 접수가능 버튼 (일반 user만 사용 가능) */
function fnReqstForm(lctre_seq){	
	var frm = document.frm;	
	
	if('${user_id}' == 'admin'){
		alert("관리자는 사용불가 ");
		return
	}
	
	var url = "/edu/lctre/selectReqstForm.do?lctre_seq="+ lctre_seq + "&listLimit=${pageVO.listLimit}";	
	window.open(url,"", "width=500, height=700"); 
}
/* 강의중,접수종료 버튼 (관리자 admin만 사용 가능) */
function fnReqstList(lctre_seq, lctre_nm){	
	var frm = document.frm;
	
	if('${user_id}' != 'admin'){
		alert("관리자만 사용하는 곳입니다.");
		return
	}
	
	var url = "/edu/lctre/selectReqstBtnList.do?lctre_seq="+ lctre_seq + "&listLimit=${pageVO.listLimit}";	 
	window.open(url,"", "width=500, height=700");   
}
/* 강사목록버튼 */
function fnInstrctrList(){
	var frm = document.frm;
	frm.action = "/edu/instrctr/selectInstrctrList.do";
	frm.submit();
}
/* 강의등록버튼 */
function fnLctreForm(){	
	var frm = document.frm;
	frm.listLimit.value = '${pageVO.listLimit}';
	
	if('${user_id}' != 'admin'){
		alert("관리자만 사용하는 곳입니다.");
		return
	}
	
	frm.action = "/edu/lctre/selectLctreForm.do";
	frm.submit();
}
/* 선택삭제버튼 */
function fnChkDel(){
	if('${user_id}' != 'admin'){
		alert("관리자만 사용하는 곳입니다.");
		return
	}
	var frm = document.frm;
	var chk = document.getElementsByName("chkInfo") /* 체크박스 객체  */
	var checkRow = ""; 		/* 체크된 체크박스 value 담기위한 변수 */
	var checkCnt = 0; 		/* 체크된 체크박스의 개수 */
	var checkLast = "";		/* 체크된 체크박스중 마지막 체크박스 인덱스 담음 */
	var rowInfo = ""; 		/* 체크된 체크박스의 모든 value값을 담음 */

	for(var i=0; i<chk.length; i++){
		checkCnt++;		/* 체크된 체크박스 갯수 +1 */
		checkLast = i;	/* 체크된 체크박스 인덱스 */
	}	
	for(var i=0; i<chk.length; i++){	/* 체크박스의 크기만큼 돌면서 */
		if(chk[i].checked == true){		/* 체크된 인덱스의 값이 true면(선택되면) */			
			
			checkRow = chk[i].value;	/* 체크된 체크박스의 value을 대입 */
		
			if(checkCnt == 1){	
				rowInfo += checkRow + "";	// 체크된 체크박스 개수 한개 일때,
			}else{
				rowInfo += checkRow + "/";	// 체크된 체크박스 개수 한개 이상일때,	
			}
			checkRow = '';    //checkRow초기화.
		}		
	}
	frm.listLimit.value = '${pageVO.listLimit}';
	frm.chkInfoArr.value = rowInfo;
	frm.action = "/edu/lctre/deleteLctreList.do";
	frm.submit();
}
/* 상세보기 */
function fnDetail(lctre_seq){
	var frm = document.frm;
	frm.lctre_seq.value = lctre_seq;
	frm.listLimit.value = '${pageVO.listLimit}';
	frm.action = "/edu/lctre/selectLctreDetail.do";
	frm.submit();
}
/* 목록 갯수 select */
function fnSelListLimit(){
	var frm = document.frm;	
	/* 선택한 select값을 얻어옴 */
	frm.listLimit.value  = frm.selListLimit.options[frm.selListLimit.selectedIndex].value;
		alert("새로 선택한값 : " + frm.listLimit.value);
	frm.action = "/edu/lctre/selectLctreList.do";
	frm.submit(); 
}

/* 검색 */
function fnListSearch(){
	var frm = document.frm;
	var search = frm.listSearchText.value;	//검색창에 입력한 테스트 확인.
	if(search == ""){
		alert("검색어를 입력해주세요.");
		return;
	}		
	frm.action = "/edu/lctre/selectLctreList.do";
	frm.submit();	
} 
/* 검색 전체보기 */
function fnSelListSearch(){
	var frm = document.frm;
	var sel = frm.selListSearchField.options[frm.selListSearchField.selectedIndex].value; // 검색필드 선택값
	if(sel == 'all'){
		alert("전체보기");
		
		frm.listSearchText.value = "";
	}
	frm.action = "/edu/lctre/selectLctreList.do";
	frm.submit();
}

</script>
</head>
<body>
		오늘날짜 :	<c:set var="today" value="<%=new java.util.Date()%>" />			 
		<!-- 현재날짜타입을 해당패턴으로 변환 --> 
		<fmt:formatDate var="now" type="date" value="${today}" pattern="yyyyMMdd HH:mm:ss"/>			
		현재시각 :  ${now} </br>		
		로그인시각 : ${login_pnttm}

	
	<!-- 로그인 / Q&A 게시판 이동-->
	<h4 style="color: blue; display: inline; margin-left: 200px;">
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
	<input type="button" value="Q&A 게시판" onclick="fnNttList();"/>

	<!-- 강의목록 frm -->
	<form id="frm" name="frm" method="post">		
		<input type="hidden" id="lctre_seq" name="lctre_seq" />	
		<input type="hidden" id="chkInfoArr" name="chkInfoArr" />
		<input type="hidden" id="listLimit" name="listLimit" value="${pageVO.listLimit}" /> 	
	
		<h3>강의목록</h3>
		<!-- 목록개수 선택 -->				
		<select id="selListLimit" name="selListLimit" onchange="fnSelListLimit();">
			<option value="10"  selected="selected" <c:if test="${pageVO.listLimit eq 10}">selected</c:if>>10개씩</option>
			<option value="20" <c:if test="${pageVO.listLimit eq 20}">selected</c:if>>20개씩</option>
			<option value="30" <c:if test="${pageVO.listLimit eq 30}">selected</c:if>>30개씩</option>
		</select>
		<!-- 검색필드 -->
		<select id="selListSearchField" name="selListSearchField" onchange="fnSelListSearch();">
			<option value="all" selected="selected" <c:if test="${pageVO.selListSearchField eq 'all'}">selected</c:if>>전체보기</option>
			<option value="lctre_nm" <c:if test="${pageVO.selListSearchField eq 'lctre_nm'}">selected</c:if>>강의명</option>
			<option value="instrctr_nm" <c:if test="${pageVO.selListSearchField eq 'instrctr_nm'}">selected</c:if>>강사명</option>
		</select>
		<!-- 검색/버튼 -->
		<input type="text" id="listSearchText" name="listSearchText" value="${pageVO.listSearchText}" style="margin-bottom: 7px;"/>
		<input type="button" value="검색" onclick="fnListSearch();"/>
		
		<table border="1">
			<tr>
				<c:if test="${user_id eq 'admin'}">
					<th></th>	
				</c:if>
				<th>번호</th>
				<th>강의명</th>
				<th>강사명</th>
				<th>조회수</th>
				<th>모집인원</th>
				<th>비고</th>
				<th>등록일</th>				 
			</tr>		
			<c:forEach var="result" items="${lctreList}" varStatus="status" >		
				<!-- 체크박스 -->
				<c:if test="${user_id eq 'admin'}">
					<td id="ckbox"><input type="checkbox"  name="chkInfo" value="${result.lctre_seq}"/></td>
				</c:if>
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
				<td id="tdBtn">		
				<c:choose>		
					<c:when test="${now lt result.lctre_begin 
									and result.lctre_sttus eq 'R' 
									and result.reqst_cnt+0 lt result.rcrundt+0}">				
					<a href="javascript:void(0);" onclick="fnReqstForm('${result.lctre_seq}');" id="lctreBtnC">접수가능</a>
					</c:when>
					<c:when test="${now ge result.lctre_begin 
									and now le result.lctre_endde}">		
					<a href="javascript:void(0);" onclick="fnReqstList('${result.lctre_seq}');" id="lctreBtnR">강의중</a>
					</c:when>
					<c:when test="${now gt result.lctre_endde 
									or (now lt result.lctre_begin 
									and result.lctre_sttus eq 'N' 
									or result.reqst_cnt+0 eq result.rcrundt+0)}">
					<a href="javascript:void(0);" onclick="fnReqstList('${result.lctre_seq}');"  id="lctreBtnN">접수종료</a>
					</c:when>		
				</c:choose>
				</td>
					
				<!-- 등록일 -->
				<td id="date"><c:out value="${result.frst_regist_pnttm}"/></td>		
			</tr>
			</c:forEach>
			<tr>
				<c:if test="${user_id eq 'admin'}">
						<td colspan="1"><button onclick="fnChkDel();" class="formBtn">선택삭제</button></td>	
						<td colspan="2"></td>
						<td colspan="3"><button onclick="fnInstrctrList();" class="formBtn">강사목록</button></td>		
						<td colspan="2"><button onclick="fnLctreForm();" class="formBtn">강의등록</button></td>	
				</c:if>				
			</tr>
		</table>
			
		<!-- 이전 페이지 표시 -->                                                                 
		<c:choose>                                                                       
		    <c:when test="${pageVO.nowPage eq 1}"></c:when>                                                                      
		    <c:otherwise>                                                                  
		        <a href="/edu/lctre/selectLctreList.do?nowPage=${pageVO.nowPage-1}&listLimit=${pageVO.listLimit}">[이전]</a> 
		    </c:otherwise>                                                                 
		</c:choose>                                                                        
		                                                                                   
		<!-- 페이지 숫자 표시 -->                                                                 
		<c:forEach var="page" begin="${pageVO.startPage}" end="${pageVO.endPage}">  		                                                                                   
		    <c:choose >                                                                    
		        <c:when test="${pageVO.nowPage eq page}">${page}</c:when>                                                                                                                             
		        <c:otherwise>                                                       
		            <a href="/edu/lctre/selectLctreList.do?nowPage=${page}&listLimit=${pageVO.listLimit}&selListSearchField=${pageVO.selListSearchField}&listSearchText=${pageVO.listSearchText}" style="color:#cecece;">${page}</a>      
		        </c:otherwise>                                                             
		    </c:choose>                                                                    
		</c:forEach>                                                                             
		<c:choose>                                                                         
		    <c:when test="${pageVO.endPage eq pageVO.maxPage}"></c:when>                                                                       
		    <c:otherwise>                                                                   
		        <a href="/edu/lctre/selectLctreList.do?nowPage=${pageVO.nowPage+1}&listLimit=${pageVO.listLimit}">[다음]</a>
		    </c:otherwise>                                                                 
		</c:choose> 
	</form>
</body>
</html>