package egovframework.lctre.service;

// 신청
public class ReqstVO {
	
	private String reqst_seq;	//신청seq (PK)
	private String lctre_seq;	//강의seq (FK)
	private String applcnt_nm;	//신청자명
	private String lctre_sttus; //신청상태  ('N' or 'C')
	private String frst_regist_pnttm; //최초등록일시
	private String last_regist_pnttm; //최종수정일시
	
	//private String reqstNumArr;		// 신청상태번호
	//private String reqstSttusArr;	// 신청상태처리
	
	public String getReqst_seq() {
		return reqst_seq;
	}
	public void setReqst_seq(String reqst_seq) {
		this.reqst_seq = reqst_seq;
	}
	public String getLctre_seq() {
		return lctre_seq;
	}
	public void setLctre_seq(String lctre_seq) {
		this.lctre_seq = lctre_seq;
	}
	public String getApplcnt_nm() {
		return applcnt_nm;
	}
	public void setApplcnt_nm(String applcnt_nm) {
		this.applcnt_nm = applcnt_nm;
	}
	public String getLctre_sttus() {
		return lctre_sttus;
	}
	public void setLctre_sttus(String lctre_sttus) {
		this.lctre_sttus = lctre_sttus;
	}
	public String getFrst_regist_pnttm() {
		return frst_regist_pnttm;
	}
	public void setFrst_regist_pnttm(String frst_regist_pnttm) {
		this.frst_regist_pnttm = frst_regist_pnttm;
	}
	public String getLast_regist_pnttm() {
		return last_regist_pnttm;
	}
	public void setLast_regist_pnttm(String last_regist_pnttm) {
		this.last_regist_pnttm = last_regist_pnttm;
	}
	/*public String getReqstNumArr() {
		return reqstNumArr;
	}
	public void setReqstNumArr(String reqstNumArr) {
		this.reqstNumArr = reqstNumArr;
	}
	public String getReqstSttusArr() {
		return reqstSttusArr;
	}
	public void setReqstSttusArr(String reqstSttusArr) {
		this.reqstSttusArr = reqstSttusArr;
	}
	*/
}
