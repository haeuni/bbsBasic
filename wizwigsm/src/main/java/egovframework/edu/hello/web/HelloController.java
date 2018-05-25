package egovframework.edu.hello.web;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

// @Controller : 컨트롤러 선언 _ 해당 클래스가 Controller임을 나타내기 위한 어노테이션
// 대부분 service를 통한 DB 데이터 호출을 위한 클래스다.
@Controller
public class HelloController {	

	@RequestMapping("/edu/hello/hello.do")
	public String hello(HttpServletRequest request
			, ModelMap model) throws Exception{
		
		request.setAttribute("req_name", "김찬기님");
		model.addAttribute("model_name", "황주영님");
		
		List list = new ArrayList();
		list.add(1);
		list.add(2);
		list.add(3);
		list.add(4);
		list.add(5);		
		
		model.addAttribute("model_list", list);		
		
		// 구구단을 담을 LIST
		List gugudanList = new ArrayList(); 
		
		// list 가져온다
		for (int i=0; i<list.size(); i++) {
			// list 현재값 (1,2,3,4,5)
			int listGet = (int)list.get(i);
			// 현재값에 X 2
			int listGop = listGet * 2;
			// 곱한값을 gugudanList 넣어준다
			gugudanList.add(listGop);
		}
		
		model.addAttribute("model_gugudanList", gugudanList);
		
		// 구구단을 담을 LIST
		List gugudanList2 = new ArrayList();
		
		// list 만큼 for문을 돈다. --> 5번돌게된다.
		for (int i=2; i<=7; i++) {				
			
			for(int j=0; j<list.size(); j++){				
				
				//list 현재값 (1,2,3,4,5 담기게된다)
				int listGet2 = (int)list.get(j);
				// list 가져온 현재값에 * 곱할수(단)
				int listGop2 = listGet2 * i;
				
				gugudanList2.add(listGop2);
			}			
		}	
		
		model.addAttribute("model_gugudanList2", gugudanList2);
		
		// 구구단 담을 LIST
		List gugudanList3 = new ArrayList();
		
		// listA 만큼 반복문 돌리기
		for (int i=0; i<list.size(); i++){		
			// list 현재값을 담기
			int listGet3 = (int)list.get(i);
	
			// gugudanList의 모든 데이터를 곱해주기위한  반복문 돌리기
			for (int j=0; j<gugudanList.size(); j++) {
				// gugudan 담긴 값을 하나씩 곱하기
				int listGetGugu = (int)gugudanList.get(j);
				int listGop3 = listGet3 * listGetGugu;
				
				gugudanList3.add(listGop3);
			}
		}
		model.addAttribute("model_gugudanList3", gugudanList3);	
	
		
		return "/edu/hello/hello";
	}			
}
	
