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
	}
	a{
		text-decoration: none;
	}
	#btn{
		text-align: center;
		margin-top: 100px;
	}
	#table{
		margin-top: 20px;
	}
</style>
<script type="text/javascript">
/* 로그아웃 */
function fnLogOut(){	
	var frm = document.frm;
	frm.action = "/edu/lctre/login/selectLctreLogOut.do";
	frm.submit();
}
/* 질문 목록 */
function fnNttList(){
	var frm = document.frm;
	frm.action = "/edu/ntt/selectNttList.do";
	frm.submit();
}
/* 답변 등록 */
function fnReplForm(){			
	var frm = document.frm;
	var ntt_sj = frm.ntt_sj.value;	// 답변제목
	var ntt_cn = frm.ntt_cn.value;	// 답변내용
	
	if(ntt_sj == ""){
		confirm("제목을 입력해주세요.");
		return
	}else if(ntt_cn == ""){
		confirm("내용을 입력해주세요.");
		return
	}else{
		if(confirm("답변을 등록 합니다.") == true){
			frm.action = "/edu/ntt/insertReplForm.do?parnts_ntt_seq=${nttVO.ntt_seq}";
			frm.submit();
		}else{
			return
		}
	}
}

</script>
</head>
<body>	
	<form id="frm" name="frm" method="post">		
		<input type="hidden" id="frst_register_id" name="frst_register_id" value="${user_id}"/>
		<!-- 답변 등록시 해당하는 부모글 -->
		<input type="hidden" id="ntt_seq" name="ntt_seq" value="${nttVO.ntt_seq}"/>
	
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
		
		<h3>답변 등록</h3>	
		<table border="1">
			<tr>
				<th>질문 제목</th>
				<td colspan="2"><c:out value="${nttVO.ntt_sj}"/></td>				
			</tr>	
			<tr>
				<th>답변 제목</th>
				<td colspan="2"><input type="text" id="ntt_sj" name="ntt_sj" size="20" style="width:100%; border: 0;"/></td>
			</tr>					
			<tr>
				<th>답변 내용</th>
				<td colspan="2">
					<textarea type="text" id="ntt_cn" name="ntt_cn" rows="10" style="width:100%; border: 0; resize: none;"/></textarea>
				</td>
			</tr>
		</table>	
		<table id="table">
			<!-- 질문 등록 -->
			<tr id="btn">
				<td style="background-color: yellow;"><a href="javascript:void(0);" onclick="fnReplForm();">등록</a></td>
				<td style="background-color: #cecece;"><a href="javascript:void(0);" onclick="fnNttList();">목록</a></td>
			</tr>
		</table>
	</form>	
</body>
</html>