package com.moopi.mvc.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Page {

	private int currentPage;
	private int totalCount;
	private int pageUnit;
	private int pageSize;
	private int maxPage;
	private int beginUnitPage;
	private int endUnitPage;
	
	public Page() {
	}

}
