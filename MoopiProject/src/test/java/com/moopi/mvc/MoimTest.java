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
//	}
	
//	@Test
//	public void updateMoim() throws Exception{
//		
//		System.out.println("Test updateMoim :::");
//		System.out.println("수정전 모임 : "+moimService.getMoim(1));
//		Moim moim = moimService.getMoim(1);
//		moim.setMmAddr("중랑구");
//		moim.setMmMaxAge(96);
//		moimService.updateMoim(moim);
//		System.out.println(moim);
//		Assertions.assertEquals("중랑구", moim.getMmAddr());
//		Assertions.assertEquals(96, moim.getMmMaxAge());
//	}
	
	@Test
	public void addMoim() throws Exception{
		
		System.out.println("Test addMoim :::");
		Moim moim = new Moim();
		moim.setMmNo(2);
		moim.setMmName("YMCA족구단");
		moim.setMmContent("불심으로 대동단결");
		moim.setMmFile("송강호사진");
		moim.setMmMaxCount(10);
		moim.setMmCurrentCount(1);
		moim.setMmInterest(2);
		moim.setMmAddr("은평구");
		moim.setMmState(2);
		moim.setMmMinAge(35);
		moim.setMmMaxAge(60);
		moim.setMmType(2);
		
		moimService.addMoim(moim);
		System.out.println(moim);
	}
	
}
