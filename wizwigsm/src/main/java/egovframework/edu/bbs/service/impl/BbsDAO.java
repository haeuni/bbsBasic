package egovframework.edu.bbs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.edu.bbs.service.BbsVO;

@Repository("BbsDAO")
public class BbsDAO extends EgovComAbstractDAO {

	//목록
	public List<BbsVO> selectBbsList(BbsVO paramVO){
	
		List<BbsVO> bbsList = (List<BbsVO>)list("BbsDAO.selectBbsList", paramVO);
		
		return bbsList;
	
	}
	//Id 
	public Integer selectBbsId(BbsVO paramVO){
		
		int bbsId = (int)select("BbsDAO.selectBbsId", paramVO);
		return bbsId;
	}
	
	//등록에서는 데이터를 넣어만 주니까 return이 필요없다.
	public void insertBbs(BbsVO paramVO){
		//insert() --> EgovComAbustravctDAO에서 제공해주는 메소드
		insert("BbsDAO.insertBbs", paramVO);
	}
	
	//조회수 update
	public void updateBbsCnt(BbsVO paramVO){
		update("BbsDAO.updateBbsCnt", paramVO);
	}
	
	//조회수 select
	public BbsVO selectBbsCnt(BbsVO paramVO){
		BbsVO bbsCnt = (BbsVO)select("BbsDAO.selectBbsCnt", paramVO);
		return bbsCnt;
	}
	
	//상세
	public BbsVO selectBbsDetail(BbsVO paramVO){
		
		BbsVO bbsDetail = (BbsVO)select("BbsDAO.selectBbsDetail", paramVO);
		return bbsDetail;
	}
	
	//수정
	public void updateBbs(BbsVO paramVO){
		
		update("BbsDAO.updateBbs", paramVO);
	}
	
	//삭제
	public void deleteBbs(BbsVO paramVO){
		
		delete("BbsDAO.deleteBbs", paramVO);
	}
	
}
