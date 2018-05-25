package egovframework.edu.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.edu.service.EduLoginVO;

@Repository("EduLoginDAO")
public class EduLoginDAO extends EgovComAbstractDAO {

	/* 회원정보 가져오기 */
	public EduLoginVO getUserInfo(String usrId, String usrPw) throws Exception {
		
		EduLoginVO vo = new EduLoginVO();
		vo.setUsrId(usrId);
		vo.setUsrPw(usrPw);
		
		return (EduLoginVO) select("EduLoginDAO.getUserInfo", vo); 
	}	
}
