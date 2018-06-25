package egovframework.ntt.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.lctre.login.service.LctreLoginVO;
import egovframework.ntt.service.NttVO;

@Repository("NttDAO")
public class NttDAO extends EgovComAbstractDAO{
	
	// 질문 목록
	public List<NttVO> selectNttList(LctreLoginVO paramVO){
		return (List<NttVO>) list("NttDAO.selectNttList", paramVO);
	}
	
	// 질문 등록
	public void insertNttForm(NttVO paramVO){
		insert("NttDAO.insertNttForm", paramVO);
	}
	
	// 질문 상세
	public NttVO selectNttDetail(NttVO paramVO){
		return (NttVO) select("NttDAO.selectNttDetail",paramVO);
	}
	
	// 상세 클릭시 조회수 증가
	public void modNttCnt(NttVO paramVO){
		update("NttDAO.modNttCnt", paramVO);
	}
	
	// 질문 수정
	public void modNtt(NttVO paramVO){
		update("NttDAO.modNtt", paramVO);
	}
	
	// 질문 삭제
	public void deleteNtt(NttVO paramVO){
		delete("NttDAO.deleteNtt", paramVO);
	}
}
