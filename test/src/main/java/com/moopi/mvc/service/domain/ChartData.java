package com.moopi.mvc.service.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChartData {

	private String paymentRegdate;
	private int paymentPrice;
	private String date;
	private String start;
	private String end;
	
	public ChartData() {
		
	}

}
