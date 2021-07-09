package com.moopi.mvc;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.moopi.mvc.service.moim.impl.MoimServiceImpl;
import com.moopi.mvc.service.domain.Moim;

@SpringBootTest
public class MoimTest {
	
	@Autowired
	private MoimServiceImpl moimService;

	
//	@Test
//	public void getMoim() {
//		
//		System.out.println("Test getMoim :::");
//		System.out.println(moimService.getMoim(1));
//		Moim moim = moimService.getMoim(1);
//		System.out.println(moim);
//		
//		Assertions.assertEquals("미사리조기축구회", moim.getMmName());
//		Assertions.assertEquals("공찹니다", moim.getMmContent());
//		
//	}
	
	@Test
	public void updateMoim() {
		
		System.out.println("Test updateMoim :::");
		System.out.println("수정전 모임 : "+moimService.getMoim(1));
		Moim moim = moimService.getMoim(1);
		moim.setMmAddr("중랑구");
		moim.setMmMaxAge(96);
		
		
	}
}
