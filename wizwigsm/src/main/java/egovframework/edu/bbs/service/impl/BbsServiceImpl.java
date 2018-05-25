package egovframework.edu.bbs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.edu.bbs.service.BbsService;
import egovframework.edu.bbs.service.BbsVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

//Service("EduLoginService) : 메모리상에 해당 클래스를 올리고 별다른 생성자 없이 선언한 값으로 호출하여 사용할 수 있다.
@Service("BbsService")
public class BbsServiceImpl extends EgovAbstractServiceImpl implements BbsService {

	@Resource(name = "BbsDAO")
	private BbsDAO bbsDAO;
	
	//목록
	public List<BbsVO> selectBbsList(BbsVO paramVO){
		
		List<BbsVO> bbsList = bbsDAO.selectBbsList(paramVO);
		
		return bbsList;
	} 
	
	//등록
	public void insertBbs(BbsVO paramVO){
		
		// Id 가져오기
		int bbsId = bbsDAO.selectBbsId(paramVO);
		paramVO.setId(Integer.toString(bbsId)); // 숫자값을 문자로 바꿔준다.
		
		bbsDAO.insertBbs(paramVO);
	}
	
	//조회수 증가
	public void updateBbsCnt(BbsVO paramVO){
		bbsDAO.updateBbsCnt(paramVO);
	}	
	//조회수 조회
	public BbsVO selectBbsCnt(BbsVO paramVO){
		BbsVO bbsCnt = bbsDAO.selectBbsCnt(paramVO);
		return bbsCnt;
	}	
	
	//상세
	public BbsVO selectBbsDetail(BbsVO paramVO){
		
		BbsVO bbsDetail = bbsDAO.selectBbsDetail(paramVO);
		return bbsDetail;
	}
	
	//수정
	public void updateBbs(BbsVO paramVO){
		bbsDAO.updateBbs(paramVO);
	}
	
	//삭제
	public void deleteBbs(BbsVO paramVO){
		bbsDAO.deleteBbs(paramVO);
	}
	
}
