package com.moopi.mvc.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.AccessLevel;

@Getter
@Setter
@ToString
public class Search {
	
	private int currentPage;
	private int searchCondition;
	private String searchKeyword;
	private int pageSize;
	
	@Getter(AccessLevel.NONE)
	@Setter(AccessLevel.NONE)
	private int endRowNum;
	
	@Getter(AccessLevel.NONE)
	@Setter(AccessLevel.NONE)
	private int startRowNum;
	private int pageUnit;
	private String searchCategory;
	private int interestNo;
	private String addr;
	   
	///Constructor
	public Search() {
	}
	
	///Method
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int paseSize) {
		this.pageSize = paseSize;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(int searchCondition) {
		this.searchCondition = searchCondition;
	}
	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	//==> Select Query �� ROWNUM ������ �� 
	public int getEndRowNum() {
		return getCurrentPage()*getPageSize();
	}
	//==> Select Query �� ROWNUM ���� ��
	public int getStartRowNum() {
		return (getCurrentPage()-1)*getPageSize()+1;
	}

	@Override
	public String toString() {
		return "Search [currentPage=" + currentPage + ", searchCondition="
				+ searchCondition + ", searchKeyword=" + searchKeyword
				+ ", pageSize=" + pageSize + ", endRowNum=" + endRowNum
				+ ", startRowNum=" + startRowNum + "]";
	}


	
	public int getPageUnit() {
	      return pageUnit;
	   }

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	public String getSearchCategory() {
		return searchCategory;
	}

	public void setSearchCategory(String searchCategory) {
		this.searchCategory = searchCategory;
	}


}

