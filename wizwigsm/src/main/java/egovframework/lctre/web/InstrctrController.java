package egovframework.lctre.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.lctre.service.InstrctrService;
import egovframework.lctre.service.InstrctrVO;

// Controller = service를 통한 DB 데이터 호출을 위한 클래스
@Controller
public class InstrctrController {	

	@Resource(name = "InstrctrService")
	private InstrctrService instrctrService;
	
	// 목록
	@RequestMapping("/edu/instrctr/selectInstrctrList.do")
	public String selectInstrctrList(HttpServletRequest request	
			, @ModelAttribute(value="paramVO") InstrctrVO paramVO
			, ModelMap model) throws Exception{
		
		try{
			// 서비스로 호출된 VO를 bbsList에 담는다.
			List<InstrctrVO> instrctrList = instrctrService.selectInstrctrList(paramVO);
			
			model.addAttribute("instrctrList", instrctrList);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/edu/instrctr/instrctrList";
	}
	
	// 강사등록폼
	@RequestMapping("/edu/instrctr/selectInstrctrForm.do")
	public String selectInstrctrForm(HttpServletRequest request
			, @ModelAttribute(value="paramVO") InstrctrVO paramVO
			, ModelMap model) throws Exception{
		
		try{
			
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/edu/instrctr/instrctrForm";
	}
	
	// 강사등록폼 --> 등록
	@RequestMapping("/edu/instrctr/insertInstrctrForm.do")
	public String insertInstrctrForm(HttpServletRequest request
			, @ModelAttribute(value="paramVO") InstrctrVO paramVO
			, ModelMap model) throws Exception{
		
		try{
			
			instrctrService.insertInstrctrForm(paramVO);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		// 등록 후, 바로 강사목록리스트 페이지로 redirect
		return "redirect:/edu/instrctr/selectInstrctrList.do";
	}
		
	// 강사상세
	@RequestMapping("/edu/instrctr/selectInstrctrDetail.do")
	public String selectInstrctrDetail(HttpServletRequest request
			, @ModelAttribute(value="paramVO") InstrctrVO paramVO
			, ModelMap model) throws Exception{
		
		try{
			
			InstrctrVO instrctrDetail = (InstrctrVO)instrctrService.selectInstrctrDetail(paramVO);
			model.addAttribute("instrctrDetail", instrctrDetail);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		// 등록 후, 바로 강사목록리스트 페이지로 redirect
		return "/edu/instrctr/instrctrDetail";
	}
	
	// 강사수정폼
	@RequestMapping("/edu/instrctr/updateInstrctrForm.do")
	public String updateInstrctrForm(HttpServletRequest request
			, @ModelAttribute(value="paramVO") InstrctrVO paramVO
			, ModelMap model) throws Exception{
		
		try{
			
			InstrctrVO instrctrDetail = (InstrctrVO)instrctrService.selectInstrctrDetail(paramVO);
			model.addAttribute("instrctrDetail", instrctrDetail);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "/edu/instrctr/instrctrUpdateForm";
	}
	
	// 강사수정처리
	@RequestMapping("/edu/instrctr/updateInstrctr.do")
	public String updateInstrctr(HttpServletRequest request
			, @ModelAttribute(value="paramVO") InstrctrVO paramVO
			, ModelMap model) throws Exception{
		
		try{
			
			instrctrService.updateInstrctr(paramVO);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "forward:/edu/instrctr/selectInstrctrDetail.do";
	}
	
	// 강사삭제처리
	@RequestMapping("/edu/instrctr/deleteInstrctr.do")
	public String deleteInstrctr(HttpServletRequest request
			, @ModelAttribute(value="paramVO") InstrctrVO paramVO
			, ModelMap model) throws Exception{
		
		try{
			
			instrctrService.deleteInstrctr(paramVO);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		// 삭제후 목록이동
		return "redirect:/edu/instrctr/selectInstrctrList.do";
	}
		
}
	










