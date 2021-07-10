package com.moopi.mvc;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.moopi.mvc.service.domain.Flash;
import com.moopi.mvc.service.flash.impl.FlashServiceImpl;

@SpringBootTest
public class FlashTest {

	@Autowired
	private FlashServiceImpl flashService;
	
	//@Test
	public void contextLoads() {
	}
	
	@Test
	public void getFlash() throws Exception {
		System.out.println("Test getFlash() start ::");
		System.out.println(flashService.getFlash(1));
		Flash flash = flashService.getFlash(1);
		
		Assertions.assertEquals("hi", flash.getFlashName());
		Assertions.assertEquals("hi", flash.getFlashContent());
	}
	
}