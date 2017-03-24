package day0222.model;

import java.util.ArrayList;
import java.util.List;

public class PdsItemListModel {
	private List<PdsItem> pdsItemList;
	private int requestPage;
	private int totalPageCount;
	private int startRow;
	private int endRow;


	public PdsItemListModel() {
		this(new ArrayList<PdsItem>(), 0, 0, 0, 0);
		// this()의 의미는 같은클래스에 있는 다른 생성자를 호출
		// this의 의미는 인스턴스변수와 지역변수를 구분
	}
	
	public PdsItemListModel(List<PdsItem> PdsItemList, int requestPageNumber, int totalPageCount, int startRow, int endRow) {
		this.pdsItemList = PdsItemList;
		this.requestPage = requestPageNumber;
		this.totalPageCount = totalPageCount;
		this.startRow = startRow;
		this.endRow = endRow;
	}
	
	

	public List<PdsItem> getPdsItemList() {
		return pdsItemList;
	}
	
	// 글이 하나라도 있으면 true, 글이 없으면 false 값 return
	public boolean isHasPdsItem() {
		return ! pdsItemList.isEmpty();
	}

	public int getRequestPage() {
		return requestPage;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public int getStartRow() {
		return startRow;
	}

	public int getEndRow() {
		return endRow;
	}
	
	
}
