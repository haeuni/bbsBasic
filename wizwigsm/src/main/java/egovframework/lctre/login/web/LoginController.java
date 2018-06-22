package egovframework.lctre.login.web;

import java.util.Calendar;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.icu.text.SimpleDateFormat;
import com.sun.star.bridge.oleautomation.Date;

import egovframework.lctre.login.service.LoginService;
import egovframework.lctre.login.service.LctreLoginVO;

@Controller
public class LoginController {

	@Resource(name="LoginService")
	private LoginService loginService;	
	
	/* 로그인 화면 */
	@RequestMapping("/edu/lctre/login/selectLctreLogin.do")
	public String selectLctreLogin(HttpServletRequest request
			, ModelMap model) throws Exception {
		try{
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/edu/lctre/login/loginForm";
	}
	
	/* 로그인 처리 */
	@RequestMapping("/edu/lctre/login/selectLctreLoginForm.do")
	public String selectLctreLoginForm(HttpSession session
			, HttpServletRequest request
			, HttpServletResponse response
			, @ModelAttribute("paramVO") LctreLoginVO paramVO
			, ModelMap model) throws Exception {

		try{			
			// 로그인 한  id,pw
			String user_id = request.getParameter("user_id");
			String user_pw = request.getParameter("user_pw");
				
			// 로그인 정보 가져오기 , vo 매핑
			LctreLoginVO lctreLoginVO = loginService.selectLctreLoginForm(paramVO);
			
			// 로그인 현재시간 저장
			// Calendar calendar = Calendar.getInstance();
			// java.util.Date date = calendar.getTime();
			// String login_pnttm = (new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(date));
					
			// 로그인 한 정보와 매핑시킨 vo의 값이 일치하면 로그인 성공 , 세션저장 
			if(((user_id.equals(lctreLoginVO.getUser_id())) && (user_pw.equals(lctreLoginVO.getUser_pw())))){	
				
				session.setAttribute("user_id", user_id);
				session.setAttribute("user_pw", user_pw);			
				
				System.out.println("\n\n\n");
				System.out.println("#######################로그인성공####################");
				System.out.println("로그인 한 id : " + user_id + "/ pw :" + user_pw);
				System.out.println("매핑 VO id : " + lctreLoginVO.getUser_id() + "/ pw : " + lctreLoginVO.getUser_pw());
				 
				// session 값 확인/
				System.out.println("#######################session getAttribute : " + session.getAttribute("user_id"));						
				
				loginService.modLctreLoginForm(lctreLoginVO);
				session.setAttribute("login_pnttm", lctreLoginVO.getLogin_pnttm());
				
				System.out.println("#######################session getAttribute : " + lctreLoginVO.getLogin_pnttm());	
				System.out.println("\n\n\n");				
			}else{	
				System.out.println("#######################로그인실패########################");
				System.out.println("#############아이디, 패스워드 불일치########################");
			}			
					
			}catch(Exception e){
				e.printStackTrace();
			}		
			return "/edu/lctre/login/loginInfo";				
	}
	
	/* 로그아웃 처리 */
	@RequestMapping("/edu/lctre/login/selectLctreLogOut.do")
	public String selectLctreLogOut(HttpSession session
			, HttpServletRequest request
			, HttpServletResponse response
			, @ModelAttribute("paramVO") LctreLoginVO paramVO
			, ModelMap model) throws Exception {

		try{		
			session.invalidate();
			System.out.println("##########################로그아웃성공####################");			
									
			}catch(Exception e){
				e.printStackTrace();
			}		
			return	"/edu/lctre/login/loginForm";		
	}	
	
}
	