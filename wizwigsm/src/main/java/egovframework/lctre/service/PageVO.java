package egovframework.lctre.service;

// 페이징처리에 필요한 것들을 처리하는 기능을 모듈화시키기 위해 만든 클래스
public class PageVO {
		
		private int nowPage;   		// 현재 페이지를 표시할 칼럼
		private int startPage; 		// 한번에 표시될 페이지가 시작할 페이지
		private int endPage;   		// 한번에 표시될 페이지가 끝나는 페이지
		private int maxPage;   		// 전체 페이지에서 가장 마지막 페이지
		private int listLimit;     	// 한 페이지에 게시글일 몇개가 보여질지 표시.
				
		public int getNowPage() {
			return nowPage;
		}
		public void setNowPage(int nowPage) {
			this.nowPage = nowPage;
		}
		public int getStartPage() {
			return startPage;
		}
		public void setStartPage(int startPage) {
			this.startPage = startPage;
		}
		public int getEndPage() {
			return endPage;
		}
		public void setEndPage(int endPage) {
			this.endPage = endPage;
		}
		public int getMaxPage() {
			return maxPage;
		}
		public void setMaxPage(int maxPage) {
			this.maxPage = maxPage;
		}
		public int getListLimit() {
			return listLimit;
		}
		public void setListLimit(int listLimit) {
			this.listLimit = listLimit;
		}		
		
}
