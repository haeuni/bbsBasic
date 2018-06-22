package egovframework.lctre.login.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.lctre.login.service.LctreLoginVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("LoginDAO")
public class LoginDAO extends EgovAbstractDAO {

	/* 로그인 정보*/
    public LctreLoginVO selectLctreLoginForm(LctreLoginVO paramVO) throws Exception {
        return (LctreLoginVO) select("LoginDAO.selectLctreLoginForm", paramVO);
    }    
    
    /* 로그인 시간 업데이트 */
    public void modLctreLoginForm(LctreLoginVO paramVO) throws Exception {
    	update("LoginDAO.modLctreLoginForm", paramVO);
    }
}
