package egovframework.edu.web;

/*
  	@param vo - 아이디, 비밀번호가 담긴  EduLoginVO
  	@param request - 세션처리위한 HttpServletRequest
	@return result - 로그인 결과 세션정보
*/

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.edu.service.EduLoginService;
import egovframework.edu.service.EduLoginVO;

// @Controller : 컨트롤러 선언 _ 해당 클래스가 Controller임을 나타내기 위한 어노테이션
// 대부분 service를 통한 DB 데이터 호출을 위한 클래스다.
@Controller
public class EduLoginController {
	
	// Service 매핑	
	@Resource(name = "EduLoginService")
	private EduLoginService eduLoginService;	

	//RequestMapping : 중복 X, .do호출 (web.xml --> 이 요청이 들어왔을 때 결과를 가지고 return을 시킨다.)
	//요청에 대한 어떤 Controller , 어떤 메소드가 처리할지를 맵핑하기위한 어노테이션
	@RequestMapping("/edu/eduUsrLogin.do")
	public String UserLogin(
			
	) throws Exception{
		return "/edu/eduUsrLogin";
	}	
	
	@RequestMapping("/edu/eduUsrInfo.do")
	public String getUserInfo(
			
			//ModelAttribute : post 방식
			//RequestParam : get 방식 
			//String usrId를 매핑
			@RequestParam(value="usrId", required=false) String usrId, //required : null값이 들어가게 할 것인지
			@RequestParam(value="usrPw", required=false) String usrPw,
			ModelMap model
				
	) throws Exception {
			
		// 일반로그인처리
		EduLoginVO vo = new EduLoginVO();
		vo = eduLoginService.getUserInfo(usrId, usrPw);
		
		if(vo != null){
			// 화면에 사용할 값을 ModelMap에 담음_여기서는 usrId의 data
			// data 전달	
			model.addAttribute("usrInfo", vo);
		
			//return값을 통해 jsp페이지 호출, '~.jsp'		
			return "/edu/eduUsrInfo";	// view page 설정		
		
		}else{		
			return "/edu/eduUsrLogin";
		}
	}					
}
	
