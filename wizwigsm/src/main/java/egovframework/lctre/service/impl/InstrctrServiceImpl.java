package egovframework.lctre.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.lctre.service.InstrctrService;
import egovframework.lctre.service.InstrctrVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("InstrctrService")
public class InstrctrServiceImpl extends EgovAbstractServiceImpl implements InstrctrService {

	@Resource(name = "InstrctrDAO")
	private InstrctrDAO instrctrDAO;
	
	// 강사목록
	public List<InstrctrVO> selectInstrctrList(InstrctrVO paramVO){
		
		List<InstrctrVO> instrctrList = instrctrDAO.selectInstrctrList(paramVO);
		return instrctrList;
	}
	
	// 강사등록
	public void insertInstrctrForm(InstrctrVO paramVO){
		
		instrctrDAO.insertInstrctrForm(paramVO);
	}
	
	// 강사상세
	public InstrctrVO selectInstrctrDetail(InstrctrVO paramVO){
		InstrctrVO instrctrDetail = instrctrDAO.selectInstrctrDetail(paramVO);
		return instrctrDetail;
	}
	
	// 강사수정
	public void updateInstrctr(InstrctrVO paramVO){
		instrctrDAO.updateInstrctr(paramVO);
	}
	
	// 강사삭제
	public void deleteInstrctr(InstrctrVO paramVO){
		instrctrDAO.deleteInstrctr(paramVO);
	}
}
