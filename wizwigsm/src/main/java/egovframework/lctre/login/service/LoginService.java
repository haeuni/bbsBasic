package egovframework.lctre.login.service;

public interface LoginService {

    /* 로그인 정보*/
    public LctreLoginVO selectLctreLoginForm(LctreLoginVO paramVO) throws Exception;    
	
    /* 로그인 시간 업데이트 */
    public void modLctreLoginForm(LctreLoginVO paramVO) throws Exception;
}
