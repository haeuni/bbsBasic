package egovframework.edu.bbs.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.edu.bbs.service.BbsService;
import egovframework.edu.bbs.service.BbsVO;

// @Controller : 컨트롤러 선언 _ 해당 클래스가 Controller임을 나타내기 위한 어노테이션
// 대부분 service를 통한 DB 데이터 호출을 위한 클래스다.
@Controller
public class BbsController {	

	@Resource(name = "BbsService")
	private BbsService bbsService;
	
	// 목록
	@RequestMapping("/edu/bbs/selectBbsList.do")
	public String selectBbsList(HttpServletRequest request	
			, @ModelAttribute(value="paramVO") BbsVO paramVO
			, ModelMap model) throws Exception{
		
		try{
			// 서비스로 호출된 VO를 bbsList에 담는다.
			List<BbsVO> bbsList = bbsService.selectBbsList(paramVO);
			
			model.addAttribute("bbsList", bbsList);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/edu/bbs/bbsList";
	}
	
	// 등록폼
	@RequestMapping("/edu/bbs/selectBbsForm.do")
	public String selectBbsForm(HttpServletRequest request	
			, @ModelAttribute(value="paramVO") BbsVO paramVO
			, ModelMap model) throws Exception{
		
		try{
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/edu/bbs/bbsForm";
	}
	
	// 등록폼전송
	@RequestMapping("/edu/bbs/insertBbs.do")
	public String insertBbs(HttpServletRequest request	
			, @ModelAttribute(value="paramVO") BbsVO paramVO
			, ModelMap model) throws Exception{
		
		try{
			bbsService.insertBbs(paramVO);
			
		}catch(Exception e){
			
			e.printStackTrace();
		}
		// 최종적으로 이 url로 직접 호출 (주소창확인)
		return "redirect:/edu/bbs/selectBbsList.do";
	}
	
	// 상세
	@RequestMapping("/edu/bbs/selectBbsDetail.do")
	public String selectBbsDetail(HttpServletRequest request	
			, @ModelAttribute(value="paramVO") BbsVO paramVO
			, ModelMap model) throws Exception{
		
		try{			
			//현재조회수 증가
			BbsVO bbsCnt = bbsService.selectBbsCnt(paramVO);
			paramVO.setCnt(bbsCnt.getCnt());
			
			// 조회수 증가
			bbsService.updateBbsCnt(paramVO);
			
			// 상세
			BbsVO bbsDetail = bbsService.selectBbsDetail(paramVO);
			model.addAttribute("bbsDetail",bbsDetail);
			
		}catch(Exception e){
			
			e.printStackTrace();
		}
		// 최종적으로 이 url로 직접 호출 (주소창확인)
		return "/edu/bbs/bbsDetail";
	}
	
	// 수정 폼
	@RequestMapping("/edu/bbs/updateBbsForm.do")
	public String updateBbsForm(HttpServletRequest request	
			, @ModelAttribute(value="paramVO") BbsVO paramVO
			, ModelMap model) throws Exception{
		
		try{
			BbsVO bbsDetail = bbsService.selectBbsDetail(paramVO);
			
			model.addAttribute("bbsDetail",bbsDetail);
			
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		return "/edu/bbs/bbsUpdateForm";
	}
	
	// 수정 처리
	@RequestMapping("/edu/bbs/updateBbs.do")
	public String updateBbs(HttpServletRequest request	
			, @ModelAttribute(value="paramVO") BbsVO paramVO
			, ModelMap model) throws Exception{
		
		try{
			
			bbsService.updateBbs(paramVO);
			
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		return "forward:/edu/bbs/selectBbsDetail.do";
	}
	
	// 삭제
	@RequestMapping("/edu/bbs/deleteBbs.do")
	public String deleteBbs(HttpServletRequest request	
			, @ModelAttribute(value="paramVO") BbsVO paramVO
			, ModelMap model) throws Exception{
		
		try{
			
			bbsService.deleteBbs(paramVO);
			
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		return "redirect:/edu/bbs/selectBbsList.do";
	}
}










