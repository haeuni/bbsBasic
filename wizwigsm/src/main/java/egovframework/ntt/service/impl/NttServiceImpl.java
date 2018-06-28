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
		
		// 질문 상세 ( 해당글의 답변 유무판단 )
		public int selectNttParntsCnt(NttVO paramVO){
			return nttDAO.selectNttParntsCnt(paramVO);
		}
		
		// 질문 수정
		public void modNtt(NttVO paramVO){
			nttDAO.modNtt(paramVO);
		}
		
		// 질문 삭제
		public void deleteNtt(NttVO paramVO){
			nttDAO.deleteNtt(paramVO);
		}
		
		// 답변 목록
		public List<NttVO> selectReplList(NttVO paramVO){
			return nttDAO.selectReplList(paramVO);
		}
		
		// 답변 등록
		public void insertReplForm(NttVO paramVO){
			nttDAO.insertReplForm(paramVO);
		}
		
		// 답변 상세
		public NttVO selectReplDetail(NttVO paramVO){
			return nttDAO.selectReplDetail(paramVO);
		}
		
		// 답변 수정
		public void modRepl(NttVO paramVO){
			nttDAO.modRepl(paramVO);
		}
		
		// 답변 삭제 ( 질문삭제 동일사용 )
}
