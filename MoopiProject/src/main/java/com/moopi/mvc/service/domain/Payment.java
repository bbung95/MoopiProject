package com.moopi.mvc.service.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Payment {

	private int paymentNo;
	private Date paymentRegdate;
	private int paymentRole;
	private User PaymentUserId;
	private int paymentPrice;
	private int paymentCoinCount;
	private String paymentUid;
	
	public Payment() {
		
	}

}
