package egovframework.ntt.service;

public class NttVO {
/*
	@param
	- 글번호
	- 글제목
	- 글내용
	- 질문글번호
	- 조회수
	- 최초등록자ID
	- 최초등록일
	- 최종등록자ID
	- 최종등록일
*/
	
	String ntt_seq;
	String ntt_sj;
	String ntt_cn;
	String parnts_ntt_seq;
	String inqire_cnt;
	String frst_register_id;
	String frst_regist_pnttm;
	String last_updusr_id;
	String last_updt_pnttm;
	
	
	public String getNtt_seq() {
		return ntt_seq;
	}
	public void setNtt_seq(String ntt_seq) {
		this.ntt_seq = ntt_seq;
	}
	public String getNtt_sj() {
		return ntt_sj;
	}
	public void setNtt_sj(String ntt_sj) {
		this.ntt_sj = ntt_sj;
	}
	public String getNtt_cn() {
		return ntt_cn;
	}
	public void setNtt_cn(String ntt_cn) {
		this.ntt_cn = ntt_cn;
	}
	public String getParnts_ntt_seq() {
		return parnts_ntt_seq;
	}
	public void setParnts_ntt_seq(String parnts_ntt_seq) {
		this.parnts_ntt_seq = parnts_ntt_seq;
	}
	public String getInqire_cnt() {
		return inqire_cnt;
	}
	public void setInqire_cnt(String inqire_cnt) {
		this.inqire_cnt = inqire_cnt;
	}
	public String getFrst_register_id() {
		return frst_register_id;
	}
	public void setFrst_register_id(String frst_register_id) {
		this.frst_register_id = frst_register_id;
	}
	public String getFrst_regist_pnttm() {
		return frst_regist_pnttm;
	}
	public void setFrst_regist_pnttm(String frst_regist_pnttm) {
		this.frst_regist_pnttm = frst_regist_pnttm;
	}
	public String getLast_updusr_id() {
		return last_updusr_id;
	}
	public void setLast_updusr_id(String last_updusr_id) {
		this.last_updusr_id = last_updusr_id;
	}
	public String getLast_updt_pnttm() {
		return last_updt_pnttm;
	}
	public void setLast_updt_pnttm(String last_updt_pnttm) {
		this.last_updt_pnttm = last_updt_pnttm;
	}
	
}
