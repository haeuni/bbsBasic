package egovframework.edu.service;

// interface (연결장치)
public interface EduLoginService {

	/* 회원정보 가져오기 */
	public EduLoginVO getUserInfo(String usrId, String usrPw) throws Exception;

}
