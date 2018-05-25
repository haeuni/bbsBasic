package egovframework.lctre.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.lctre.service.InstrctrVO;

@Repository("InstrctrDAO")
public class InstrctrDAO extends EgovComAbstractDAO {
	
	//강사목록
	public List<InstrctrVO> selectInstrctrList(InstrctrVO paramVO){
		
		List<InstrctrVO> instrctrList = (List<InstrctrVO>)list("InstrctrDAO.selectInstrctrList", paramVO);
		return instrctrList;
	}
	
	// 강사등록
	public void insertInstrctrForm(InstrctrVO paramVO){
		
		insert("InstrctrDAO.insertInstrctrForm", paramVO);
	}
	
	// 강사상세
	public InstrctrVO selectInstrctrDetail(InstrctrVO paramVO){
		
		InstrctrVO  instrctrDetail = (InstrctrVO)select("InstrctrDAO.selectInstrctrDetail", paramVO);
		return instrctrDetail;
	}
	
	// 강사수정
	public void updateInstrctr(InstrctrVO paramVO){
		update("InstrctrDAO.updateInstrctr", paramVO);
	}
	
	// 강의삭제
	public void deleteInstrctr(InstrctrVO paramVO){
		delete("InstrctrDAO.deleteInstrctr", paramVO);
	}
}
