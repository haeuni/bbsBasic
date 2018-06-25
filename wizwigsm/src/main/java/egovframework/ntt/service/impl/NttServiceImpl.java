package egovframework.ntt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.lctre.login.service.LctreLoginVO;
import egovframework.ntt.service.NttService;
import egovframework.ntt.service.NttVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("NttService")
public class NttServiceImpl extends EgovAbstractServiceImpl implements NttService{

	@Resource(name = "NttDAO")
	private NttDAO nttDAO;
		
		// 질문 목록
		public List<NttVO> selectNttList(LctreLoginVO paramVO) {
			return nttDAO.selectNttList(paramVO);
		}
		
		// 질문 등록
		public void insertNttForm(NttVO paramVO){
			nttDAO.insertNttForm(paramVO);
		}
		
		// 질문 상세
		public NttVO selectNttDetail(NttVO paramVO){
			return nttDAO.selectNttDetail(paramVO);
		}
		
		// 상세 클릭시 조회수 증가
		public void modNttCnt(NttVO paramVO){
			nttDAO.modNttCnt(paramVO);
		}
		
		// 질문 수정
		public void modNtt(NttVO paramVO){
			nttDAO.modNtt(paramVO);
		}
		
		// 질문 삭제
		public void deleteNtt(NttVO paramVO){
			nttDAO.deleteNtt(paramVO);
		}
}
