package egovframework.lctre.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.lctre.service.LctreVO;

@Repository("LctreDAO")
public class LctreDAO extends EgovComAbstractDAO {

	// 강의목록
	public List<LctreVO> selectLctreList(){
		return (List<LctreVO>)list("LctreDAO.selectLctreList");	
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
	
	// 강의수정
	public void updateLctre(LctreVO paramVO){		
		update("LctreDAO.updateLctre", paramVO);
	}
	
	// 강의삭제
	public void deleteLctre(LctreVO paramVO){		
		update("LctreDAO.deleteLctre", paramVO);
	}
	
	
}
