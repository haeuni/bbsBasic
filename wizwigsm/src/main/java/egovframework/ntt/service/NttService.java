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
	
	// 질문 수정
	public void modNtt(NttVO paramVO);
	
	// 질문 삭제
	public void deleteNtt(NttVO paramVO);
}
