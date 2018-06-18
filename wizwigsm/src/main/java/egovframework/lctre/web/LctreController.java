package egovframework.lctre.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.lctre.service.LctreService;
import egovframework.lctre.service.LctreVO;
import egovframework.lctre.service.PageVO;
import egovframework.lctre.service.ReqstVO;

// @Controller : 컨트롤러 선언 _ 해당 클래스가 Controller임을 나타내기 위한 어노테이션
// 대부분 service를 통한 DB 데이터 호출을 위한 클래스다.
@Controller
public class LctreController {	

	@Resource(name = "LctreService")
	private LctreService lctreService;
	
	// 강의목록
	@RequestMapping("/edu/lctre/selectLctreList.do")
	public String selectLctreList(HttpServletRequest request	
			, @ModelAttribute(value="paramVO") PageVO paramVO
			, ModelMap model) throws Exception{
				
		try{		  		                                             
			// 현재페이지 ( 처음 접속시 무조건 1 페이지)
			int nowPage = 1;	   
			// 페이지당 보여줄 게시물 개수 
			int listLimit = 10;	  
			
			// 클릭한 페이지가 있으면, 현재페이지에 저장                                                          
			if(request.getParameter("nowPage") != null) {                                                     
				nowPage = Integer.parseInt(request.getParameter("nowPage"));                       
			}
			// 게시물 개수를 지정하는 select에대한 값이 넘어오면, 저장
			if(request.getParameter("listLimit") != null) {                                                     
				listLimit = Integer.parseInt(request.getParameter("listLimit"));                       
			}
			
			// 게시글 총 개수를 가져오는 메소드
			int listCount = lctreService.selectListTotalCount();   			
			
			// 전체 페이지중 마지막 페이지                                                                      
			// ((총목록개수-1) / listLimit) +1;
			// (ex) ((112-1) / 10 ) +1 = 12 페이지
			int maxPage = ((listCount-1) / listLimit) +1;
			
			// starPage를 구하기 위한 공식.                                                                  
			// 만약 페이지의 일의 자리 수가 0이 아니면 십의자리수가 -1이 되는 페이지가 되어버린다.  
			// 이를 방지 하기 위해 페이지는 0.1~ 0.9 까지의 결과값이 나올 때 더해서 1이 올라가게 하는 숫자인 0.9를 더하여  
			// 한자리를 높여주게 되면 모든 결과가 동일한 십의 자리 수를 갖게 된다.                                                                                                                                                         
			int startPage = (((int)((double) nowPage / 10 + 0.9 )) -1) * listLimit + 1 ;  
			int endPage = startPage + 9;      			
			
			// #startRow# = (현재페이지-1) * 목록수 +1 
			// #endRow# = 시작번호 + 목록수 -1
			int startRow = (nowPage - 1) * listLimit + 1;
			int endRow = startRow + listLimit -1;
			
			// 전체페이지에서 가장 마지막 페이지인 maxPage보다 보여줄 페이지의 마지막번호를 나타내는 endPage가 더 크면 
			// 그 마지막페이지가 포함되어 보여지는 부분에 보여줄 endPage에 maxPage를 대입
			if(endPage > maxPage) {                                                                            
			    endPage = maxPage;                                                                               
			}                                                                                           	
			
			paramVO.setNowPage(nowPage);
			paramVO.setStartPage(startPage);
			paramVO.setEndPage(endPage);
			paramVO.setMaxPage(maxPage);
			paramVO.setListLimit(listLimit);
			paramVO.setStartRow(startRow);
			paramVO.setEndRow(endRow);
			
			System.out.println("현재페이지: " + paramVO.getNowPage());
			System.out.println("시작페이지: " + paramVO.getStartPage());
			System.out.println("마지막페이지: " + paramVO.getEndPage());
			System.out.println("맨끝페이지: " + paramVO.getMaxPage());
			System.out.println("목록 Limit: " + paramVO.getListLimit());
			System.out.println("시작글번호: " + paramVO.getStartRow());
			System.out.println("마지막글번호: " + paramVO.getEndRow());
			
			// 해당 페이지에 출력될 게시글을 listLimit 만큼만 가져오기 위한 메소드                                                      
			List<LctreVO> lctreList = lctreService.selectLctreList(paramVO);                                                
			
			//페이징 처리 정보와 게시글 목록 정보 model에 담아 포워드.	
			model.addAttribute("lctreList", lctreList);
			model.addAttribute("pageVO", paramVO);		
		
		}catch(Exception e){
			e.printStackTrace();
		} 
		return "/edu/lctre/lctreList";
	}	
	// 강의목록_체크삭제버튼
	@RequestMapping("/edu/lctre/deleteLctreList.do")
	public String deleteLctreList(HttpServletRequest request			
			, @ModelAttribute(value="paramVO") LctreVO paramVO
			, ModelMap model) throws Exception{
		
		try{					
			String[] chkInfoArr = request.getParameter("chkInfoArr").split("/");		
			
			for(int i=0; i<chkInfoArr.length; i++){					
				paramVO.setLctre_seq(chkInfoArr[i]);
				lctreService.deleteLctre(paramVO);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "forward:/edu/lctre/selectLctreList.do";
	}	
	
	// 강의목록_신청등록폼_강의명 select (접수가능 버튼 클릭시)
	@RequestMapping("/edu/lctre/selectReqstForm.do")
	public String selectReqstForm(HttpServletRequest request	
			, @ModelAttribute(value="paramVO") LctreVO paramVO
			, ModelMap model) throws Exception{
		
		try{					
			// 해당 강의번호를 파라미터값으로 넘겨 그에 해당하는 강의명 select 해서 폼에 뿌려주기
			LctreVO ReqstLctreNm = lctreService.selectReqstForm(paramVO);
			model.addAttribute("ReqstLctreNm", ReqstLctreNm);
			model.addAttribute("lctreVO", paramVO);			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/edu/lctre/reqstForm";
	}
	
	// 강의목록_신청등록폼 --> 등록처리
	@RequestMapping("/edu/lctre/insertReqstForm.do")
	public String insertReqstForm(HttpServletRequest request
			, @ModelAttribute(value="paramVO") ReqstVO paramVO
			, ModelMap model) throws Exception{
		
		try{			
			System.out.println("################## 신청자명: " + paramVO.getApplcnt_nm());
									
			// 파라미터에 담긴 등록폼에서 작성한 값들을 넘기기		
			int result = lctreService.insertReqstForm(paramVO);		
			model.addAttribute("result", result);
			model.addAttribute("lctreVO", paramVO);
						
		}catch(Exception e){
			e.printStackTrace();
		}
		//return "redirect:/edu/lctre/selectLctreList.do";
		return "/edu/lctre/reqstForm";
	}
	
	// 강의목록_신청자목록 (강의중/접수종료 버튼 클릭시)
	@RequestMapping("/edu/lctre/selectReqstBtnList.do")
	public String selectReqstBtnList(HttpServletRequest request			
			, @RequestParam(value="lctre_seq" , required = false) String lctre_seq
			, @ModelAttribute(value="paramVO") LctreVO paramVO
			, ModelMap model) throws Exception{
		
		try{		
			System.out.println("################## 강의번호: "+ lctre_seq);
			paramVO.setLctre_seq(lctre_seq);
			// 신청자 목록리스트
			List<ReqstVO> ReqstBtnList = lctreService.selectReqstBtnList(paramVO);
			model.addAttribute("ReqstBtnList", ReqstBtnList);
			model.addAttribute("lctreVO", paramVO);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/edu/lctre/reqstList";
	}
	
	// 신청자목록_삭제 (신청상태 'C' -> 'N')
	@RequestMapping("/edu/lctre/modReqstBtnList.do")
	public String modReqstBtnList(HttpServletRequest request
			, @RequestParam(value="reqst_seq" , required = false) String reqst_seq
			, @ModelAttribute(value="paramVO") ReqstVO paramVO
			, ModelMap model) throws Exception{
		
		try{		
			paramVO.setReqst_seq(reqst_seq);
			int result = lctreService.modReqstBtnList(paramVO);	
			
			model.addAttribute("result", result);
			model.addAttribute("lctreVO", paramVO);	
			
		}catch(Exception e){
			e.printStackTrace();
		}		
		//return "/edu/lctre/selectReqstBtnList.do";
		return "/edu/lctre/reqstList";
	}
	
	// 강의등록_Form
	@RequestMapping("/edu/lctre/selectLctreForm.do")
	public String selectLctreForm(HttpServletRequest request			
			, @ModelAttribute(value="paramVO") LctreVO paramVO
			, ModelMap model) throws Exception{
		
		try{
			// 강사 comboBox
			List<LctreVO> lnstrctrCobList = lctreService.selectInstrctrNmCobList(paramVO);			
			model.addAttribute("lnstrctrCobList", lnstrctrCobList);		
			model.addAttribute("lctreVO", paramVO);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/edu/lctre/lctreForm";
	}
	
	// 강의등록_insert
	@RequestMapping("/edu/lctre/insertLctreForm.do")
	public String insertLctreForm(HttpServletRequest request
			, @ModelAttribute(value="paramVO") LctreVO paramVO
			, ModelMap model) throws Exception{
		
		try{
			lctreService.insertLctreForm(paramVO);			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "forward:/edu/lctre/selectLctreList.do";
	}
	
	// 강의상세
	@RequestMapping("/edu/lctre/selectLctreDetail.do")
	public String selectLctreDetail(HttpServletRequest request
			, @ModelAttribute(value="paramVO") LctreVO paramVO
			, ModelMap model) throws Exception{
		
		try{
			// 조회수 조회 
			/*LctreVO lctreRdcnt = lctreService.selectLctreRdcnt(paramVO);
			paramVO.setRdcnt(lctreRdcnt.getRdcnt());*/
			
			// 조회수 증가처리
			lctreService.updateLctreRdcnt(paramVO);
			
			// 상세정보 
			LctreVO lctreDetail = lctreService.selectLctreDetail(paramVO);		
			model.addAttribute("lctreDetail", lctreDetail);
			
			// 신청목록
			List<ReqstVO> reqstDetail = lctreService.selectReqstList(paramVO);
			model.addAttribute("reqstDetail", reqstDetail);
		
			model.addAttribute("lctreVO", paramVO);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/edu/lctre/lctreDetail";
	}
		
	// 강의상세_신청목록_신청상태 저장
	@RequestMapping("/edu/lctre/modReqstForm.do")
	public String modReqstForm(HttpServletRequest request
			, @ModelAttribute(value="paramVO") ReqstVO paramVO
			, ModelMap model) throws Exception{
		
		try{
			System.out.println("#########################################"+request.getParameter("reqstNumArr"));
			System.out.println("#########################################"+request.getParameter("reqstSttusArr"));
			
			// 예상되는 데이터 값 {"26","25","24","23","22"}
			// 				{"C","C","C","C","C"}
			String[] reqstNumArr = request.getParameter("reqstNumArr").split("/");
			String[] reqstSttusArr = request.getParameter("reqstSttusArr").split("/");					
			
			for(int i=0; i<reqstNumArr.length; i++){
				paramVO.setReqst_seq(reqstNumArr[i]);
				paramVO.setLctre_sttus(reqstSttusArr[i]);
				
				lctreService.modReqstSttus(paramVO);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "forward:/edu/lctre/selectLctreList.do";
	}
	
	// 강의수정_Form
	@RequestMapping("/edu/lctre/updateLctreForm.do")
	public String updateLctreForm(HttpServletRequest request
			, @ModelAttribute(value="paramVO") LctreVO paramVO
			, ModelMap model) throws Exception{
		
		try{							
			// 강사 comboBox
			// 넘겨받은 paramVO에 담겨있는 값. = 강의번호 / 강사번호 / 강의명 / 모집인원 
			// 매핑시켜온 값들이 담겨있는 InstrctrCobList에 담겨있는 값. = 강사테이블의 강사번호 / 강의번호
			List<LctreVO> lnstrctrCobList = lctreService.selectInstrctrNmCobList(paramVO);	
			model.addAttribute("lnstrctrCobList", lnstrctrCobList);
			
			// 수정
			// 매핑시켜온 값들이 담겨있는 InctrDetail에 담겨있는 값. 
			// 		= 강의테이블의 강의번호 / 강의명 / 모집인원
			// 		= 강사테이블의 강사번호 / 강사명
			LctreVO lctreDetail = lctreService.selectLctreDetail(paramVO);
			model.addAttribute("lctreDetail", lctreDetail);
			
			model.addAttribute("lctreVO", paramVO);
		
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		return "/edu/lctre/lctreUpdateForm";
	}	
	
	// 강의수정_update
	@RequestMapping("/edu/lctre/updateLctre.do")
	public String updateLctre(HttpServletRequest request	
			, @ModelAttribute(value="paramVO") LctreVO paramVO
			, ModelMap model) throws Exception{
		
		try{			
			lctreService.updateLctre(paramVO);			
			model.addAttribute("lctreVO", paramVO);
			
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		return "forward:/edu/lctre/selectLctreDetail.do";
	}
	
	// 강의삭제
	@RequestMapping("/edu/lctre/deleteLctre.do")
	public String deleteLctre(HttpServletRequest request	
			, @ModelAttribute(value="paramVO") LctreVO paramVO
			, ModelMap model) throws Exception{
		
		try{			
			lctreService.deleteLctre(paramVO);
			model.addAttribute("lctreVO", paramVO);
			
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		return "forward:/edu/lctre/selectLctreList.do";
	}		
}
	










