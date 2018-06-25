package egovframework.ntt.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.lctre.login.service.LctreLoginVO;
import egovframework.ntt.service.NttService;
import egovframework.ntt.service.NttVO;

@Controller
public class NttController {

	@Resource(name = "NttService")
	private NttService nttService;
	
	// 질의응답 목록
	@RequestMapping("/edu/ntt/selectNttList.do")
	public String selectNttList(HttpSession session
			, HttpServletRequest request
			, @ModelAttribute(value="paramVO") LctreLoginVO paramVO
			, ModelMap model) throws Exception{
		try{
			String user_id = (String) session.getAttribute("user_id");
			
			// 로그인한 아이디의 글 조회 (본인 글 조회)
			if(user_id != null){				
				paramVO.setUser_id(user_id);
				List<NttVO> nttList = nttService.selectNttList(paramVO);
				model.addAttribute("nttList", nttList);
				
			}else{
				return "/edu/lctre/login/selectLctreLogin.do";
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/edu/ntt/nttList";
	}
	
	// 질의응답 등록폼
	@RequestMapping("/edu/ntt/selectNttForm.do")
	public String selectNttForm(HttpServletRequest request
			, @ModelAttribute(value="paramVO") NttVO paramVO
			, ModelMap model) throws Exception{
		try{
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/edu/ntt/nttForm";
	}
	
	// 질의응답 등록
	@RequestMapping("/edu/ntt/insertNttForm.do")
	public String insertNttForm(HttpServletRequest request
			, @ModelAttribute(value="paramVO") NttVO paramVO
			, ModelMap model) throws Exception{
		try{
			
			nttService.insertNttForm(paramVO);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/edu/ntt/selectNttList.do";
	}
	
	// 질의응답 상세
	@RequestMapping("/edu/ntt/selectNttDetail.do")
	public String selectNttDetail(HttpServletRequest request
			, @ModelAttribute(value="paramVO") NttVO paramVO
			, ModelMap model) throws Exception{
		try{
			// 상세 클릭시 조회수 증가
			nttService.modNttCnt(paramVO);
			
			// list에서 넘어온 글번호에 해당하는 글 가져오기
			NttVO nttDetail = nttService.selectNttDetail(paramVO);
			model.addAttribute("nttDetail", nttDetail);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/edu/ntt/nttDetail";
	}
	
	// 질문 수정
	@RequestMapping("/edu/ntt/modNttForm.do")
	public String modNttForm(HttpServletRequest request
			, @ModelAttribute(value="paramVO") NttVO paramVO
			, ModelMap model) throws Exception{
		try{			
			// 강의상세페이지에서 넘어온 글번호에 해당하는 글 가져오기
			NttVO nttDetail = nttService.selectNttDetail(paramVO);
			model.addAttribute("nttDetail", nttDetail);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/edu/ntt/nttModForm";
	}
	
	// 질문 수정
	@RequestMapping("/edu/ntt/modNtt.do")
	public String modNtt(HttpServletRequest request
			, @ModelAttribute(value="paramVO") NttVO paramVO
			, ModelMap model) throws Exception{
		try{
			
			nttService.modNtt(paramVO);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "forward:/edu/ntt/selectNttDetail.do";
	}
	
	// 질문 수정
	@RequestMapping("/edu/ntt/deleteNtt.do")
	public String deleteNtt(HttpServletRequest request
			, @ModelAttribute(value="paramVO") NttVO paramVO
			, ModelMap model) throws Exception{
		try{
			
			nttService.deleteNtt(paramVO);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "forward:/edu/ntt/selectNttList.do";
	}
	
}
