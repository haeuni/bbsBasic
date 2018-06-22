package egovframework.lctre.login.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.lctre.login.service.LoginService;
import egovframework.lctre.login.service.LctreLoginVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("LoginService")
public class LoginServiceImpl extends EgovAbstractServiceImpl implements LoginService {

    @Resource(name="LoginDAO")
    private LoginDAO loginDAO;
    
    /* 로그인 정보*/
    public LctreLoginVO selectLctreLoginForm(LctreLoginVO paramVO) throws Exception {
        return loginDAO.selectLctreLoginForm(paramVO);
    }
    /* 로그인 시간 업데이트 */
    public void modLctreLoginForm(LctreLoginVO paramVO) throws Exception{
    	loginDAO.modLctreLoginForm(paramVO);
    }
}
