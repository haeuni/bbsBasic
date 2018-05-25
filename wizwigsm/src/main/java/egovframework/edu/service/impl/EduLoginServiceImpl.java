package egovframework.edu.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.edu.service.EduLoginService;
import egovframework.edu.service.EduLoginVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

//Service("EduLoginService) : 메모리상에 해당 클래스를 올리고 별다른 생성자 없이 선언한 값으로 호출하여 사용할 수 있다.
@Service("EduLoginService")
public class EduLoginServiceImpl extends EgovAbstractServiceImpl implements EduLoginService {

	@Resource(name = "EduLoginDAO")
	private EduLoginDAO eduLoginDAO;

	/* 회원정보 가져오기 */
	
	/* Service_메소드명부터 리턴타입, 파라미터까지 동일해야 한다. */
	public EduLoginVO getUserInfo(String usrId, String usrPw) throws Exception {
		return eduLoginDAO.getUserInfo(usrId, usrPw);
	}	
}
