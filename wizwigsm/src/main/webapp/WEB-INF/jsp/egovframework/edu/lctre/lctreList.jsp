<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
function fnReqstList(lctre_seq, lctre_nm){	
	var frm = document.frm;
	/* var popUrl = "/edu/lctre/selectReqstBtnList.do";
	var Top = (window.screen.height - 250)/2;
    var Left = (window.screen.width - 300)/2;

	window.open(popUrl,"", width=600, height=400, left='+Left+',top='+Top+'); */
	frm.lctre_seq.value = lctre_seq;
	frm.action= "/edu/lctre/selectReqstBtnList.do";
	frm.submit();
}
/* 강의등록버튼 */
function fnLctreForm(){	
	var frm = document.frm;
	frm.action = "/edu/lctre/selectLctreForm.do";
	frm.submit();
}
/* 선택삭제버튼 */
function fnChkDel(){
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
				
				/* if(i == checkLast){		체크된 체크박스중 마지막 체크박스일때 
					rowInfo += checkRow ;	 마지막 체크박스라면, 뒤에 '/'문자열을 붙이지 않는다.
				}else{	
					rowInfo += checkRow + "/";	
				}		 */	
			}
			checkRow = '';    //checkRow초기화.
		}		
	}
	//alert(rowInfo);
	
	frm.chkInfoArr.value = rowInfo;
	frm.action = "/edu/lctre/deleteLctreList.do";
	frm.submit();
}
/* 상세보기 */
function fnDetail(lctre_seq){
	var frm = document.frm;
	frm.lctre_seq.value = lctre_seq;
	frm.action = "/edu/lctre/selectLctreDetail.do";
	frm.submit();
}

/* 페이징 */
function fnPage(page){
	var frm = document.frm;
	frm.nowPage.value = page;
	frm.action = "/edu/lctre/deleteLctreList.do";
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
		<input type="hidden" id="chkInfoArr" name="chkInfoArr" />
		<input type="hidden" id="nowPage" name="nowPage" />
		
		<h3>강의목록</h3>
		<table border="1">
			<tr>
				<th></th>	
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
				<td id="ckbox"><input type="checkbox"  name="chkInfo" value="${result.lctre_seq}"/></td>
				
				<!-- 강의번호 -->
				<<td><c:out value="${result.lctre_seq}"/></td>
				<%-- <td><c:out value="${pageVO.totRow-((pageVO.page-1)*pageVO.rowCount + status.index)}"/></td> --%>			
				
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
					<c:choose>		
						<c:when test="${now lt result.lctre_begin 
										and result.lctre_sttus eq 'R' 
										and result.reqst_cnt+0 lt result.rcrundt+0}">				
						<button onclick="fnReqstForm('${result.lctre_seq}');" id="lctreBtnC">접수가능</button>
						</c:when>
						<c:when test="${now ge result.lctre_begin 
										and now le result.lctre_endde}">		
						<button onclick="fnReqstList('${result.lctre_seq}');" id="lctreBtnR">강의중</button>
						</c:when>
						<c:when test="${now gt result.lctre_endde 
										or (now lt result.lctre_begin 
										and result.lctre_sttus eq 'N' 
										or result.reqst_cnt+0 eq result.rcrundt+0)}">
						<button onclick="fnReqstList('${result.lctre_seq}');"  id="lctreBtnN">접수종료</button>
						</c:when>		
						<c:otherwise>-</c:otherwise>
					</c:choose>
				</td>
							
				<!-- 등록일 -->
				<td id="date"><c:out value="${result.frst_regist_pnttm}"/></td>			
			</tr>
			</c:forEach>
			<tr>
				<td colspan="1"><button onclick="fnChkDel();" class="formBtn">선택삭제</button></td>
				<td colspan="5"></td>
				<td colspan="2"><button onclick="fnLctreForm();" class="formBtn">강의등록</button></td>			
				<!-- <td colspan="2"><a href="javascript:void(0);" onclick="fnForm();">등록</a></td> -->
			</tr>
		</table>
			
		<!-- 이전 페이지 표시 -->                                                                 
		<c:choose>                                                                         
		    <c:when test="${pageVO.nowPage eq 1}"></c:when>                                                                      
		    <c:otherwise>                                                                  
		        <a href="/edu/lctre/selectLctreList.do?nowPage=${pageVO.nowPage-1}">[이전]</a> 
		    </c:otherwise>                                                                 
		</c:choose>                                                                        
		                                                                                   
		<!-- 페이지 숫자 표시 -->                                                                 
		<c:forEach var="page" begin="${pageVO.startPage}" end="${pageVO.endPage}" >  		                                                                                   
		    <c:choose >                                                                    
		        <c:when test="${pageVO.nowPage eq page}">${page}</c:when>                                                                                                                             
		        <c:otherwise>                                                       
		            <a href="/edu/lctre/selectLctreList.do?nowPage=${page}" onclick="fnPage('${page}');" style="color:#cecece;">${page}</a>      
		        </c:otherwise>                                                             
		    </c:choose>                                                                    
		</c:forEach>                                                                             
		<c:choose>                                                                         
		    <c:when test="${pageVO.endPage eq pageVO.maxPage}">[다음]</c:when>                                                                       
		    <c:otherwise>                                                                   
		        <a href="/edu/lctre/selectLctreList.do?nowPage=${pageVO.nowPage+1}">[다음]</a>
		    </c:otherwise>                                                                 
		</c:choose> 
	</form>
</body>
</html>