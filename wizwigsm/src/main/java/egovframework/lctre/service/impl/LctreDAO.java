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
	
	// 강의목록_모집_신청테이블에서 해당 강의번호에 해당하는 신청 seq 얻어오기 --> 얻어와야 할 값 (= 강의번호, lctre_seq)
/*	public List<LctreVO> selectReqstCnt(LctreVO paramVO){
		return (List<LctreVO>)list("LctreDAO.selectReqstCnt", paramVO);
	}
	*/
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
