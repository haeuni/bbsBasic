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
public class GugudanPostController {	

	@RequestMapping("/edu/test/selectGugudanPost.do")
	public String selectGugudanPost(HttpServletRequest request
			, @RequestParam(value="txtDan", required=false) String txtDan
			, @ModelAttribute(value="paramVO") GugudanVO paramVO
			, ModelMap model) throws Exception{
		
		try{
			// input의 값을 담아오기 , 문자를 숫자로 Integer.parseInt()
			int txtDanGet = Integer.parseInt(request.getParameter("txtDan"));
			int txtEndGet = Integer.parseInt(request.getParameter("txtEnd"));
			
			// txtEndGet 담을 List (1~ 입력한값까지)
			List listTxtEnd= new ArrayList();
			
			// list에 담긴 txtEndGet만큼 반복문돌면서 값을 담기
			for(int i=1; i<=txtEndGet; i++){
				listTxtEnd.add(i);
			}
			
			// 구구단 결과 List
			List gugudanResult = new ArrayList();
			
			// 결과값을 담을 구구단 반복문
			for(int i=0; i<listTxtEnd.size(); i++){
				gugudanResult.add(txtDanGet * (Integer)listTxtEnd.get(i));
			}
			
			model.addAttribute("gugudanResult", gugudanResult);
			model.addAttribute("txtDanGet", txtDanGet);
			model.addAttribute("txtEndGet", txtEndGet);
			model.addAttribute("listTxtEnd", listTxtEnd);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/edu/test/postGugudan";
	}			
}
	
