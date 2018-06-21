package egovframework.lctre.service;

// 페이징처리에 필요한 것들을 처리하는 기능을 모듈화시키기 위해 만든 클래스
public class PageVO {
		
	private String nowPage;   					// 현재 페이지
	private String startPage; 					// 한번에 표시될 페이지가 시작할 페이지
	private String endPage;   					// 한번에 표시될 페이지가 끝나는 페이지
	private String maxPage;   					// 전체 페이지에서 가장 마지막 페이지
	private String listLimit;     				// 한 페이지에 게시글이 몇개가 보여질지 표시.			
	private String startRow; 					// 한 페이지의 시작글번호  (ex) 1
	private String endRow;						// 한 페이지의 마지막글번호 (ex) 10			
	
	private String selListSearchField;		// 검색필드
	private String listSearchText;			// 검색어
	
	public String getNowPage() {
		return nowPage;
	}
	public void setNowPage(String nowPage) {
		this.nowPage = nowPage;
	}
	public String getStartPage() {
		return startPage;
	}
	public void setStartPage(String startPage) {
		this.startPage = startPage;
	}
	public String getEndPage() {
		return endPage;
	}
	public void setEndPage(String endPage) {
		this.endPage = endPage;
	}
	public String getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(String maxPage) {
		this.maxPage = maxPage;
	}
	public String getListLimit() {
		return listLimit;
	}
	public void setListLimit(String listLimit) {
		this.listLimit = listLimit;
	}
	public String getStartRow() {
		return startRow;
	}
	public void setStartRow(String startRow) {
		this.startRow = startRow;
	}
	public String getEndRow() {
		return endRow;
	}
	public void setEndRow(String endRow) {
		this.endRow = endRow;
	}
	public String getSelListSearchField() {
		return selListSearchField;
	}
	public void setSelListSearchField(String selListSearchField) {
		this.selListSearchField = selListSearchField;
	}
	public String getListSearchText() {
		return listSearchText;
	}
	public void setListSearchText(String listSearchText) {
		this.listSearchText = listSearchText;
	}	
}
