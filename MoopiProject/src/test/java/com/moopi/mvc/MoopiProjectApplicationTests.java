package com.moopi.mvc;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

<<<<<<< HEAD
import com.moopi.mvc.service.domain.Flash;
import com.moopi.mvc.service.flash.impl.FlashServiceImpl;
=======
import com.moopi.mvc.service.domain.Moim;
import com.moopi.mvc.service.moim.impl.MoimServiceImpl;
>>>>>>> refs/heads/new/cyu

@SpringBootTest
class MoopiProjectApplicationTests {

	@Autowired
<<<<<<< HEAD
	private FlashServiceImpl flashService;
=======
	private MoimServiceImpl moimService;
	
>>>>>>> refs/heads/new/cyu
	
	@Test
	void contextLoads() {
	}

	@Test
<<<<<<< HEAD
	public void getFlash() throws Exception {
		System.out.println("Test getFlash() start ::");
		System.out.println(flashService.getFlash(1));
		Flash flash = flashService.getFlash(1);
		
		Assertions.assertEquals("hi", flash.getFlashName());
=======
	public Moim getMoim() {
		
		System.out.println("Test getMoim :::");
		System.out.println(moimService.getMoim(10021));
		Moim moim = moimService.getMoim(10021);
		System.out.println(moim);
		
		Assertions.assertEquals("미사리조기축구회", moim.getMmName());
		Assertions.assertEquals("노원구", moim.getMmAddr());
		
		return moim;
>>>>>>> refs/heads/new/cyu
	}
	
}
