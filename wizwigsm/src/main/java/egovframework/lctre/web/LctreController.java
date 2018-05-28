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
	
	// 목록
	@RequestMapping("/edu/lctre/selectLctreList.do")
	public String selectLctreList(HttpServletRequest request			
			, @ModelAttribute(value="paramVO") LctreVO paramVO
			, ModelMap model) throws Exception{
		
		try{		
			
			// 모집 COUNT
			// reqstCntList에는 신청자수가 담긴다.
			/*List<LctreVO> reqstCntList = lctreService.selectReqstCnt(paramVO);
			model.addAttribute("reqstCntList", reqstCntList);*/
			
			// 목록리스트
			List<LctreVO> lctreList = lctreService.selectLctreList(paramVO);
			model.addAttribute("lctreList", lctreList);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/edu/lctre/lctreList";
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
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/edu/lctre/lctreDetail";
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
	
	
}
	










