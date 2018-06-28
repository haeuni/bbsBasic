package egovframework.ntt.service;

import java.util.List;

import egovframework.lctre.login.service.LctreLoginVO;

public interface NttService {
	
	// 질문 목록
	public List<NttVO> selectNttList(LctreLoginVO paramVO);
	
	// 질문 등록
	public void insertNttForm(NttVO paramVO);
	
	// 질문 상세
	public NttVO selectNttDetail(NttVO paramVO);
	
	// 상세 클릭시 조회수 증가
	public void modNttCnt(NttVO paramVO);
	
	// 질문 상세 ( 해당글의 답변유무판단 )
	public int selectNttParntsCnt(NttVO paramVO);
	
	// 질문 수정
	public void modNtt(NttVO paramVO);
	
	// 질문 삭제
	public void deleteNtt(NttVO paramVO);
	
	// 답변 목록
	public List<NttVO> selectReplList(NttVO paramVO);
	
	// 답변 등록
	public void insertReplForm(NttVO paramVO);	
	
	// 답변 상세
	public NttVO selectReplDetail(NttVO paramVO);
		
	// 답변 수정
	public void modRepl(NttVO paramVO);
	
	// 답변 삭제 ( 질문삭제 동일사용 )
}
