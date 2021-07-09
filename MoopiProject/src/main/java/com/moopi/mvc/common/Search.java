package com.moopi.mvc.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Search {
	
	private String SearchKeyword;
	private int searchCondition;
	private String searchCategory;
	private int currentPage;
	private int pageSize;
	private int pageUnit;
	private int endRowNum;
	private int startRowNum;
	
	
	public Search() {
	}

}
