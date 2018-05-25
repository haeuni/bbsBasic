package egovframework.lctre.service;

import java.util.List;

public interface InstrctrService {
	
	// 강사목록
	public List<InstrctrVO> selectInstrctrList(InstrctrVO paramVO);
	
	// 강사등록
	public void insertInstrctrForm(InstrctrVO paramVO);

	// 강사상세
	public InstrctrVO selectInstrctrDetail(InstrctrVO paramVO);
	
	// 강사수정
	public void updateInstrctr(InstrctrVO paramVO);
	
	// 강사삭제
	public void deleteInstrctr(InstrctrVO paramVO);
}
