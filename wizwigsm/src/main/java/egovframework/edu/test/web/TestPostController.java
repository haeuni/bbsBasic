package egovframework.edu.test.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.edu.test.service.GugudanVO;

// @Controller : 컨트롤러 선언 _ 해당 클래스가 Controller임을 나타내기 위한 어노테이션
// 대부분 service를 통한 DB 데이터 호출을 위한 클래스다.
@Controller
public class TestPostController {	

	@RequestMapping("/edu/test/selectPost.do")
	public String selectPost(HttpServletRequest request
			, @RequestParam(value="txtDan", required=false) String txtDan
			, @ModelAttribute(value="paramVO") GugudanVO paramVO
			, ModelMap model) throws Exception{
		
		try{
		
			request.getParameter("txtDan");		
			System.out.println("request 값 : " + request.getParameter("txtDan"));
			System.out.println("@RequestParam : " + txtDan);
			System.out.println("@ModelAttribute : " + paramVO.getTxtDan());
			
			// 1~9까지 값을 넣어줄 List
			List listGugudan = new ArrayList(); 
			// 1~9까지 값을 넣을 for문
			for(int i=1; i<=9; i++){
				// listGugudan에 값을 하나씩 넣어주기
				listGugudan.add(i);
			}
			System.out.println(listGugudan);
			
			for(int i=0; i<listGugudan.size(); i++){
				System.out.println(listGugudan.get(i));
			}		
			
			// jsp에  리스트 넘기기
			model.addAttribute("listGugudan",listGugudan);
					 
			// input에 넘겨온 값을 받아온다.
			String strDan = request.getParameter("txtDan");
			// model에 담는다.
			model.addAttribute("strDan", strDan);
			
			
			// 구구단을 받을 리스트  ( 3*1 =3)
			List listGugudanResult = new ArrayList();
			
			// 1~9 까지 담겨있는 listGugudan을 이용해 구구단 넣기
			for(int i=0; i<listGugudan.size(); i++){
				
				// 문자를 숫자로 
				// list(즉, Object형)는 명시적인 형변환을 해주어야 한다. 
				int gugudanGop = Integer.parseInt(strDan) * (Integer)listGugudan.get(i);
				
				// 담겨온 단이 담겨있는 strDan을 이용
				listGugudanResult.add(strDan + "X" + listGugudan.get(i) + "=" + gugudanGop );
			}
			
			model.addAttribute("listGugudanResult", listGugudanResult);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/edu/test/postList";
	}
}
