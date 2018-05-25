package egovframework.edu.voTest.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.edu.voTest.service.VoTestVO;

// @Controller : 컨트롤러 선언 _ 해당 클래스가 Controller임을 나타내기 위한 어노테이션
// 대부분 service를 통한 DB 데이터 호출을 위한 클래스다.
@Controller
public class VoTestController {	

	@RequestMapping("/edu/test/selectVoTestList.do")
	public String selectVoTestList(HttpServletRequest request	
			, @ModelAttribute(value="paramVO") VoTestVO paramVO
			, ModelMap model) throws Exception{
		
		try{
			System.out.println("요청");	
			System.out.println(paramVO.getName());
			System.out.println(paramVO.getSchool());
			
			List voList = new ArrayList();			
			voList.add(paramVO);
			
			VoTestVO paramVO1 = new VoTestVO();
			paramVO1.setNo("1");
			paramVO1.setName("김성은");
			paramVO1.setSchool("숭실대");
			voList.add(paramVO1);
			
			VoTestVO paramVO2 = new VoTestVO();
			paramVO2.setNo("2");
			paramVO2.setName("김하은");
			paramVO2.setSchool("두원대");
			voList.add(paramVO2);
			
			VoTestVO paramVO3 = new VoTestVO();
			paramVO3.setNo("3");
			paramVO3.setName("김주역");
			paramVO3.setSchool("동원대");
			voList.add(paramVO3);
			
			VoTestVO paramVO4 = new VoTestVO();
			paramVO4.setNo("4");
			paramVO4.setName("안민지");
			paramVO4.setSchool("강원대");
			voList.add(paramVO4);			
			
			model.addAttribute("voList", voList);		
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/edu/voTest/voTestList";
	}
	
	@RequestMapping("/edu/test/selectVoTestMapList.do")
	public String selectVoTestMapList(HttpServletRequest request	
			, ModelMap model) throws Exception{
		
		try{
			Map resultMap1 = new HashMap();			
			resultMap1.put("no", "1");
			resultMap1.put("name", "김하은");
			resultMap1.put("school", "두원공대");
			
			Map resultMap2 = new HashMap();			
			resultMap2.put("no", "2");
			resultMap2.put("name", "김성은");
			resultMap2.put("school", "숭실대");
			
			Map resultMap3 = new HashMap();			
			resultMap3.put("no", "3");
			resultMap3.put("name", "김주역");
			resultMap3.put("school", "동원대");
			
			List mapList = new ArrayList();
			mapList.add(resultMap1);
			mapList.add(resultMap2);
			mapList.add(resultMap3);
			
			model.addAttribute("resultMap", resultMap1);
			model.addAttribute("mapList", mapList);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/edu/voTest/voTestMapList";
	}
	
	@RequestMapping("/edu/test/selectVoTestMap.do")
	public String selectVoTestMap(HttpServletRequest request	
			, ModelMap model) throws Exception{
		
		try{
			List voList = new ArrayList();			
			
			VoTestVO paramVO1 = new VoTestVO();
			paramVO1.setNo("1");
			paramVO1.setName("김성은");
			paramVO1.setSchool("숭실대");
			voList.add(paramVO1);
			
			VoTestVO paramVO2 = new VoTestVO();
			paramVO2.setNo("2");
			paramVO2.setName("김하은");
			paramVO2.setSchool("두원대");
			voList.add(paramVO2);
			
			VoTestVO paramVO3 = new VoTestVO();
			paramVO3.setNo("3");
			paramVO3.setName("김주역");
			paramVO3.setSchool("동원대");
			voList.add(paramVO3);
			
			VoTestVO paramVO4 = new VoTestVO();
			paramVO4.setNo("4");
			paramVO4.setName("안민지");
			paramVO4.setSchool("강원대");
			voList.add(paramVO4);			
			
			Map voMap = new HashMap();
			voMap.put("voList", voList);
			
			model.addAttribute("voMap", voMap);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/edu/voTest/voTestMap";
	}
}
