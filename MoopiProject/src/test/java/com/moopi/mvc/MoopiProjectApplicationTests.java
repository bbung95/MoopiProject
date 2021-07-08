package com.moopi.mvc;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.moopi.mvc.service.domain.Moim;
import com.moopi.mvc.service.moim.impl.MoimServiceImpl;

@SpringBootTest
class MoopiProjectApplicationTests {

	@Autowired
	private MoimServiceImpl moimService;
	
	
	@Test
	void contextLoads() {
	}

	@Test
	public Moim getMoim() {
		
		System.out.println("Test getMoim :::");
		System.out.println(moimService.getMoim(10021));
		Moim moim = moimService.getMoim(10021);
		System.out.println(moim);
		
		Assertions.assertEquals("미사리조기축구회", moim.getMmName());
		Assertions.assertEquals("노원구", moim.getMmAddr());
		
		return moim;
	}
	
}
