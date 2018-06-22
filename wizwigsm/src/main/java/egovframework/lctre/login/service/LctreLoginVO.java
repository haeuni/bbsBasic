package egovframework.lctre.login.service;

/* 로그인 */
public class LctreLoginVO {	
	
	private String user_id;			/* 사용자 ID */
	private String user_pw;			/* 사용자 비밀번호 */
	private String use_at;			/* 사용여부 */
	private String login_pnttm;		/* 로그인 시간 */
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUse_at() {
		return use_at;
	}
	public void setUse_at(String use_at) {
		this.use_at = use_at;
	}
	public String getLogin_pnttm() {
		return login_pnttm;
	}
	public void setLogin_pnttm(String login_pnttm) {
		this.login_pnttm = login_pnttm;
	}
	
}
