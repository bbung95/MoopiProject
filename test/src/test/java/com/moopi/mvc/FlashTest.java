package com.moopi.mvc;

import java.util.Map;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Flash;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.flash.impl.FlashServiceImpl;

@SpringBootTest
public class FlashTest {

	@Autowired
	private FlashServiceImpl flashService;

	// @Test
	public void contextLoads() {
	}

	// @Test
	public void getFlash() throws Exception {
		System.out.println("Test getFlash() start ::");
		System.out.println(flashService.getFlash(1));
		Flash flash = flashService.getFlash(1);

		Assertions.assertEquals("hi", flash.getFlashName());
		Assertions.assertEquals("hi", flash.getFlashContent());
	}

	// @Test
	public void addFlash() throws Exception {

		User user = new User();
		user.setUserId("user01");

		System.out.println("Test addFlash() start ::");
		Flash flash = new Flash();

		flash.setFlashName("종로");
		flash.setFlashContent("test");
		flash.setFlashConstructor(user);
		flash.setFlashRegdate("2021-07-21 06:30:00");
		flash.setFlashTime("2021-07-21 14:20:00");
		flash.setFlashCurrentCount(1);
		flash.setFlashMaxCount(5);
		flash.setFlashAddr("서울시");
		flash.setFlashState(1);
		flash.setFlashInterest("2");
		flash.setFlashMapX(10);
		flash.setFlashMapY(30);
		flashService.addFlash(flash);
		System.out.println("addFlashTest::" + flash);

	}

	// @Test
	public void updateFlash() throws Exception {

		System.out.println("Test updateFlash() start::");
		System.out.println("수정전 Flash::" + flashService.getFlash(1));
		Flash flash = flashService.getFlash(1);
		flash.setFlashName("bye");
		flash.setFlashAddr("부산시");
		flash.setFlashContent("갈매기여");
		flashService.updateFlash(flash);
		System.out.println("Test update flash::" + flash);

		Assertions.assertEquals("bye", flash.getFlashName());
		Assertions.assertEquals("부산시", flash.getFlashAddr());
		Assertions.assertEquals("갈매기여", flash.getFlashContent());

	}

	@Test
	public void getFlashList() throws Exception {

		System.out.println("Test getFlashList start::");
		Search search = new Search();
		search.setSearchCondition(1);
		search.setSearchKeyword("1");

		Map map = flashService.getFlashList(search);
		System.out.println("flashInterest is '1' totalList::" + map.get("list"));
		System.out.println("flashInterest is '1' flashCount::" + map.get("totalCount"));

	}

}