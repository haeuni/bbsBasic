package egovframework.lctre.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.lctre.service.LctreService;
import egovframework.lctre.service.LctreVO;
import egovframework.lctre.service.ReqstVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

//Service("EduLoginService) : 메모리상에 해당 클래스를 올리고 별다른 생성자 없이 선언한 값으로 호출하여 사용할 수 있다.
@Service("LctreService")
public class LctreServiceImpl extends EgovAbstractServiceImpl implements LctreService {

	@Resource(name = "LctreDAO")
	private LctreDAO lctreDAO;
	
	// 강의목록
	public List<LctreVO> selectLctreList(LctreVO paramVO){	
		return lctreDAO.selectLctreList(paramVO);
	} 
	
	// 강의목록_신청목록(접수중, 접수종료버튼 클릭시)
	public List<ReqstVO> selectReqstBtnList(LctreVO paramVO){
		return lctreDAO.selectReqstBtnList(paramVO);
	}	
	
	// 강의목록_신청목록_삭제
	public void modReqstBtnList(ReqstVO paramVO){
		lctreDAO.modReqstBtnList(paramVO);
	}
	
	// 강의목록_모집 COUNT
	// public List<LctreVO> selectReqstCnt(LctreVO paramVO){
	//	return lctreDAO.selectReqstCnt(paramVO);
	//}
	
	// 강의등록_comboBox 
	public List<LctreVO> selectInstrctrNmCobList(LctreVO paramVO){
		return lctreDAO.selectInstrctrNmCobList(paramVO);
	}

	// 강의등록
	public void insertLctreForm(LctreVO paramVO){
		lctreDAO.insertLctreForm(paramVO);
	}
	
	// 조회수 select
	public LctreVO selectLctreRdcnt(LctreVO paramVO){		
		return lctreDAO.selectLctreRdcnt(paramVO);
	}
	
	// 조회수 update
	public void updateLctreRdcnt(LctreVO paramVO){
		lctreDAO.updateLctreRdcnt(paramVO);
	}
	
	// 강의상세
	public LctreVO selectLctreDetail(LctreVO paramVO){		
		return lctreDAO.selectLctreDetail(paramVO);
	}	
	
	// 강의상세_신청목록
	public List<ReqstVO> selectReqstList(LctreVO paramVO){
		return lctreDAO.selectReqstList(paramVO);
	}
	
	// 강의상세_신청목록_신청상태 저장
	public void modReqstSttus(ReqstVO paramVO){
		lctreDAO.modReqstSttus(paramVO);
	}
	
	// 강의수정
	public void updateLctre(LctreVO paramVO){
		lctreDAO.updateLctre(paramVO);
	}
	
	// 강의삭제
	public void deleteLctre(LctreVO paramVO){
		 lctreDAO.deleteLctre(paramVO);
	}
	
	// 수강신청등록_강의명(select)
	public LctreVO selectReqstForm(LctreVO paramVO){
		return lctreDAO.selectReqstForm(paramVO);
	}
	
	// 수강신청등록
	public void insertReqstForm(ReqstVO paramVO){
		lctreDAO.insertReqstForm(paramVO);
	}
	
	
}
