package egovframework.lctre.service;

// 강의 
public class LctreVO {
	
	private String lctre_seq;	// 강의 pk
	private String lctre_nm;	// 강의명
	private String instrctr_seq;	// 강사 pk
	private String instrctr_nm;		//강사명
	private String rcrundt; 	// 모집인원
	private String frst_regist_pnttm; 	// 최초등록일시
	private String last_updt_pnttm;		// 최종수정일시
	private String rdcnt;	//조회수
	private String use_at;	//삭제여부
	
	
	public String getLctre_seq() {
		return lctre_seq;
	}
	public void setLctre_seq(String lctre_seq) {
		this.lctre_seq = lctre_seq;
	}
	public String getLctre_nm() {
		return lctre_nm;
	}
	public void setLctre_nm(String lctre_nm) {
		this.lctre_nm = lctre_nm;
	}
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
	public String getRcrundt() {
		return rcrundt;
	}
	public void setRcrundt(String rcrundt) {
		this.rcrundt = rcrundt;
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
	public String getRdcnt() {
		return rdcnt;
	}
	public void setRdcnt(String rdcnt) {
		this.rdcnt = rdcnt;
	}
	public String getUse_at() {
		return use_at;
	}
	public void setUse_at(String use_at) {
		this.use_at = use_at;
	}
	
	
}
