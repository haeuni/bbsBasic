package egovframework.lctre.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.lctre.service.LctreService;
import egovframework.lctre.service.LctreVO;
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
			, @ModelAttribute(value="paramVO") LctreVO paramVO
			, ModelMap model) throws Exception{
		
		try{							
			// 목록리스트
			List<LctreVO> lctreList = lctreService.selectLctreList(paramVO);
			model.addAttribute("lctreList", lctreList);
			
			//lctreService.selectLctreList(paramVO);
			
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
			
			System.out.println("#########################################"+request.getParameter("chkInfoArr"));			
			String[] chkInfoArr = request.getParameter("chkInfoArr").split("/");		
			
			for(int i=0; i<chkInfoArr.length; i++){		
				
				paramVO.setLctre_seq(chkInfoArr[i]);
				lctreService.deleteLctre(paramVO);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/edu/lctre/selectLctreList.do";
	}	
	
	// 강의목록_신청자목록 (접수중/접수종료 버튼 클릭시)
	@RequestMapping("/edu/lctre/selectReqstBtnList.do")
	public String selectReqstBtnList(HttpServletRequest request			
			, @ModelAttribute(value="paramVO") LctreVO paramVO
			, ModelMap model) throws Exception{
		
		try{							
			// 신청자 목록리스트
			List<ReqstVO> ReqstBtnList = lctreService.selectReqstBtnList(paramVO);
			model.addAttribute("ReqstBtnList", ReqstBtnList);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/edu/lctre/reqstList";
	}
	
	// 신청자목록_삭제버튼 (신청상태 'C' -> 'N')
	@RequestMapping("/edu/lctre/modReqstBtnList.do")
	public String modReqstBtnList(HttpServletRequest request
			, @ModelAttribute(value="paramVO") ReqstVO paramVO
			, ModelMap model) throws Exception{
		
		try{			
				lctreService.modReqstBtnList(paramVO);							
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/edu/lctre/selectLctreList.do";
	}
	
	// 강의등록폼
	@RequestMapping("/edu/lctre/selectLctreForm.do")
	public String selectLctreForm(HttpServletRequest request			
			, @ModelAttribute(value="paramVO") LctreVO paramVO
			, ModelMap model) throws Exception{
		
		try{
			// 강사 comboBox
			List<LctreVO> lnstrctrCobList = lctreService.selectInstrctrNmCobList(paramVO);			
			model.addAttribute("lnstrctrCobList", lnstrctrCobList);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/edu/lctre/lctreForm";
	}
	
	// 강의등록폼 --> 등록
	@RequestMapping("/edu/lctre/insertLctreForm.do")
	public String insertLctreForm(HttpServletRequest request
			, @ModelAttribute(value="paramVO") LctreVO paramVO
			, ModelMap model) throws Exception{
		
		try{
			
			lctreService.insertLctreForm(paramVO);		
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/edu/lctre/selectLctreList.do";
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
			
			// 상세 
			LctreVO lctreDetail = lctreService.selectLctreDetail(paramVO);		
			model.addAttribute("lctreDetail", lctreDetail);
			
			// 상세_신청목록
			List<ReqstVO> reqstDetail = lctreService.selectReqstList(paramVO);
			model.addAttribute("reqstDetail", reqstDetail);
			
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
	
	// 강의수정폼
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
			
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		return "/edu/lctre/lctreUpdateForm";
	}	
	
	// 강의수정처리
	@RequestMapping("/edu/lctre/updateLctre.do")
	public String updateLctre(HttpServletRequest request	
			, @ModelAttribute(value="paramVO") LctreVO paramVO
			, ModelMap model) throws Exception{
		
		try{
			
			lctreService.updateLctre(paramVO);			
			
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
			
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		return "redirect:/edu/lctre/selectLctreList.do";
	}
	
	// 수강신청등록폼_강의명(select)
	@RequestMapping("/edu/lctre/selectReqstForm.do")
	public String selectReqstForm(HttpServletRequest request			
			, @ModelAttribute(value="paramVO") LctreVO paramVO
			, ModelMap model) throws Exception{
		
		try{
			// 해당 강의번호를 파라미터값으로 넘겨 그에 해당하는 강의명 select 해서 폼에 뿌려주기
			LctreVO ReqstLctreNm = lctreService.selectReqstForm(paramVO);
			model.addAttribute("ReqstLctreNm", ReqstLctreNm);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/edu/lctre/reqstForm";
	}
	
	// 수강신청등록폼 --> 등록
	@RequestMapping("/edu/lctre/insertReqstForm.do")
	public String insertReqstForm(HttpServletRequest request
			, @ModelAttribute(value="paramVO") ReqstVO paramVO
			, ModelMap model) throws Exception{
		
		try{
			// 파라미터에 담긴 등록폼에서 작성한 값들을 넘기기		
			lctreService.insertReqstForm(paramVO);		
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/edu/lctre/selectLctreList.do";
	}
	
}
	










