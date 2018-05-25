package egovframework.lctre.service;

// 강사 
public class InstrctrVO {
	private String instrctr_seq; // pk
	private String instrctr_nm; // 강사명
	private String acdmcr;  // 학력
	private String major; // 전공
	private String use_at;	// 사용여부 (Y, N)
	private String frst_regist_pnttm; // 최초등록일시
	private String last_updt_pnttm;	// 최종수정일시
	
	public String getInstrctr_seq() {
		return instrctr_seq;
	}
	public void setInstrctr_seq(String instrctr_seq) {
		this.instrctr_seq = instrctr_seq;
	}
	public String getInstrctr_nm() {
		return instrctr_nm;
	}
	public void setInstrctr_nm(String instrctr_nm) {
		this.instrctr_nm = instrctr_nm;
	}
	public String getAcdmcr() {
		return acdmcr;
	}
	public void setAcdmcr(String acdmcr) {
		this.acdmcr = acdmcr;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getUse_at() {
		return use_at;
	}
	public void setUse_at(String use_at) {
		this.use_at = use_at;
	}
	public String getFrst_regist_pnttm() {
		return frst_regist_pnttm;
	}
	public void setFrst_regist_pnttm(String frst_regist_pnttm) {
		this.frst_regist_pnttm = frst_regist_pnttm;
	}
	public String getLast_updt_pnttm() {
		return last_updt_pnttm;
	}
	public void setLast_updt_pnttm(String last_updt_pnttm) {
		this.last_updt_pnttm = last_updt_pnttm;
	}
	
	
}
