package egovframework.lctre.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.lctre.service.LctreVO;
import egovframework.lctre.service.ReqstVO;

@Repository("LctreDAO")
public class LctreDAO extends EgovComAbstractDAO {

	// 강의목록
	public List<LctreVO> selectLctreList(LctreVO paramVO){
		return (List<LctreVO>)list("LctreDAO.selectLctreList", paramVO);	
	}		
	
	// 강의등록_comboBox 
	public List<LctreVO> selectInstrctrNmCobList(LctreVO paramVO){
		return (List<LctreVO>)list("LctreDAO.selectInstrctrNmCobList", paramVO);
	}
	
	// 강의등록
	public void insertLctreForm(LctreVO paramVO){		
		insert("LctreDAO.insertLctreForm", paramVO);
	}
	
	//조회수 select
	public LctreVO selectLctreRdcnt(LctreVO paramVO){		
		return (LctreVO)select("LctreDAO.selectLctreRdcnt", paramVO);
	}
	
	//조회수 update
	public void updateLctreRdcnt(LctreVO paramVO){
		update("LctreDAO.updateLctreRdcnt", paramVO);
	}
	
	// 강의상세
	public LctreVO selectLctreDetail(LctreVO paramVO){		
		return (LctreVO)select("LctreDAO.selectLctreDetail", paramVO);
	}		
	
	// 강의상세_신청목록
	public List<ReqstVO> selectReqstList(LctreVO paramVO){
		return (List<ReqstVO>)list("LctreDAO.selectReqstList", paramVO);
	}
	
	// 강의상세_신청목록_신청상태 저장
	public void modReqstSttus(ReqstVO paramVO){
		update("LctreDAO.modReqstSttus", paramVO);
	}
	
	// 강의수정
	public void updateLctre(LctreVO paramVO){		
		update("LctreDAO.updateLctre", paramVO);
	}
	
	// 강의삭제
	public void deleteLctre(LctreVO paramVO){		
		update("LctreDAO.deleteLctre", paramVO);
	}
	
	// 수강신청등록_강의명 select
	public LctreVO selectReqstForm(LctreVO paramVO){
		return (LctreVO)select("LctreDAO.selectReqstForm", paramVO);
	}
	
	// 수강신청등록
	public void insertReqstForm(ReqstVO paramVO){
		insert("LctreDAO.insertReqstForm", paramVO);
	}
}
