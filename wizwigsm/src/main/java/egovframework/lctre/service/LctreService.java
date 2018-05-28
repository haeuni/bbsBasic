package egovframework.lctre.service;

import java.util.List;

// interface (연결장치)=껍데기라고 생각
public interface LctreService {
	
	// 강의목록
	public List<LctreVO> selectLctreList(LctreVO paramVO);
	
	// 강의목록_모집 COUNT
	// public List<LctreVO> selectReqstCnt(LctreVO paramVO);
	
	// 강의등록_comboBox
	public List<LctreVO> selectInstrctrNmCobList(LctreVO paramVO);
	
	// 강의등록
	public void insertLctreForm(LctreVO paramVO);
	
	// 조회수
	public void updateLctreRdcnt(LctreVO paramVO);
	
	// 강의상세
	public LctreVO selectLctreDetail(LctreVO paramVO);
	
	// 강의수정
	public void updateLctre(LctreVO paramVO);
	
	// 강의삭제
	public void deleteLctre(LctreVO paramVO);
}
