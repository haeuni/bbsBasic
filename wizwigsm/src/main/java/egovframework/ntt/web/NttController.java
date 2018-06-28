package egovframework.ntt.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mchange.v2.lang.ObjectUtils;

import egovframework.lctre.login.service.LctreLoginVO;
import egovframework.lctre.service.ReqstVO;
import egovframework.ntt.service.NttService;
import egovframework.ntt.service.NttVO;
import oracle.net.aso.s;

@Controller
public class NttController {

	@Resource(name = "NttService")
	private NttService nttService;
	
	// Q&A 메인 목록
	@RequestMapping("/edu/ntt/selectNttList.do")
	public String selectNttList(HttpSession session
			, HttpServletRequest request
			, @ModelAttribute(value="lctreLoginVO") LctreLoginVO lctreLoginVO
			, @ModelAttribute(value="nttVO") NttVO nttVO
			, ModelMap model) throws Exception{
		try{
			String user_id = (String) session.getAttribute("user_id");			
			
			if(user_id != null){				
				// 로그인한 아이디
				lctreLoginVO.setUser_id(user_id);
				// 로그인한 아이디의 글 조회 (본인 글 조회, 단 관리자는 모든 글 조회(쿼리 처리))
				List<NttVO> nttList = nttService.selectNttList(lctreLoginVO);
				model.addAttribute("nttList", nttList);
				
				// 답글 조회
				List<NttVO> replList = nttService.selectReplList(nttVO);
				model.addAttribute("replList" , replList);
				
			}else{
				return "/edu/lctre/login/selectLctreLogin.do";
			}
						
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/edu/ntt/nttList";
	}
	
	// 질문 등록폼
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
	
	// 질문 등록
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
	
	// 질문 상세 
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
			
			System.out.println("\n\n\n");
			System.out.println(nttDetail.getParnts_ntt_seq());		
			System.out.println(nttDetail.getParntscnt());
			System.out.println("\n\n\n");
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/edu/ntt/nttDetail";
	}
	
	// 질문 수정폼
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
	
	// 질문 삭제
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
	
	// 답변 등록폼
	@RequestMapping("/edu/ntt/selectReplForm.do")
	public String selectReplyForm(HttpServletRequest request
			, @ModelAttribute(value="paramVO") NttVO paramVO
			, ModelMap model) throws Exception{
		try{
			// 부모글번호, 폼에 보여줄 제목			
			model.addAttribute("nttVO", paramVO);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/edu/ntt/nttReplForm";
	}
	
	// 답변 등록
	@RequestMapping("/edu/ntt/insertReplForm.do")
	public String insertReplForm(HttpSession session
			, HttpServletRequest request
			, @ModelAttribute(value="paramVO") NttVO paramVO
			, ModelMap model) throws Exception{
		try{			
			
			String ntt_seq = request.getParameter("ntt_seq");
			paramVO.setParnts_ntt_seq(ntt_seq);			
			
			System.out.println("\n\n\n");
			System.out.println("답변 등록");
			System.out.println("\n\n\n");
				
			nttService.insertReplForm(paramVO);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/edu/ntt/selectNttList.do";
	}
	
	// 답변 상세
	@RequestMapping("/edu/ntt/selectReplDetail.do")
	public String selectReplDetail(HttpServletRequest request
			, @ModelAttribute(value="paramVO") NttVO paramVO
			, ModelMap model) throws Exception{
		try{
			// 상세 클릭시 조회수 증가
			nttService.modNttCnt(paramVO);
				
			System.out.println("\n\n\n");
			System.out.println(paramVO.getParnts_ntt_seq()+"########################(매핑전)부모글번호");			
			System.out.println(paramVO.getNtt_seq()+"########################(매핑전)질문글번호");
			System.out.println("\n\n\n");
			
			// list에서 넘어온 글번호에 해당하는 글 가져오기
			NttVO reqlDetail = nttService.selectReplDetail(paramVO);
			
			System.out.println("\n\n\n");
			System.out.println(reqlDetail.getRepl_sj()+"########################(매핑후)부모글제목");			
			System.out.println(reqlDetail.getNtt_seq()+"########################(매핑후)질문글번호");
			System.out.println("\n\n\n");
			
			model.addAttribute("reqlDetail", reqlDetail);						
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/edu/ntt/replDetail";
	}
	
	// 답변 수정폼
	@RequestMapping("/edu/ntt/modReplForm.do")
	public String modReplForm(HttpServletRequest request
			, @ModelAttribute(value="paramVO") NttVO paramVO
			, ModelMap model) throws Exception{
		try{
			// list에서 넘어온 글번호에 해당하는 글 가져오기
			NttVO reqlDetail = nttService.selectReplDetail(paramVO);
			model.addAttribute("reqlDetail", reqlDetail);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/edu/ntt/replModForm";
	}
	
	// 답변 수정
	@RequestMapping("/edu/ntt/modRepl.do")
	public String modRepl(HttpServletRequest request
			, @ModelAttribute(value="paramVO") NttVO paramVO
			, ModelMap model) throws Exception{
		try{
			
			nttService.modRepl(paramVO);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/edu/ntt/selectNttList.do";
	}
	
	// 답변 삭제 (질문삭제 동일사용)
	
}
