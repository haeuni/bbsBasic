package egovframework.edu.bbs.service;

import java.util.List;

// interface (연결장치)=껍데기라고 생각
public interface BbsService {
	
	//목록
	public List<BbsVO> selectBbsList(BbsVO paramVO);
	
	//등록
	public void insertBbs(BbsVO paramVO);
	
	//상세
	public BbsVO selectBbsDetail(BbsVO paramVO);
	
	//수정
	public void updateBbs(BbsVO paramVO);
	
	//삭제
	public void deleteBbs(BbsVO paramVO);
	
	//조회수증가
	public void updateBbsCnt(BbsVO paramVO);
	
	//조회수조회
	public BbsVO selectBbsCnt(BbsVO paramVO);
}
