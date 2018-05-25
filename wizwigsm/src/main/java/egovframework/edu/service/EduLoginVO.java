package egovframework.edu.service;

import java.io.Serializable;

public class EduLoginVO implements Serializable{

	private static final long serialVersionUID = -8274004534207618049L;
	
	/* 사용자 ID */
	private String usrId = "";
	
	/* 사용자 비밀번호 */
	private String usrPw = "";
	
	/* 사용자 이름 */
	private String usrNm = "";
	
	/* 사용여부 */
	private String useAt = "";

	
	public String getUsrId() {
		return usrId;
	}

	public void setUsrId(String usrId) {
		this.usrId = usrId;
	}

	public String getUsrPw() {
		return usrPw;
	}

	public void setUsrPw(String usrPw) {
		this.usrPw = usrPw;
	}

	public String getUsrNm() {
		return usrNm;
	}

	public void setUsrNm(String usrNm) {
		this.usrNm = usrNm;
	}

	public String getUseAt() {
		return useAt;
	}

	public void setUseAt(String useAt) {
		this.useAt = useAt;
	}
		
}
