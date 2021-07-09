package com.moopi.mvc;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.moopi.mvc.service.common.impl.CommonServiceImpl;
import com.moopi.mvc.service.domain.Notice;

@SpringBootTest
public class CommonApplicationTest {
	
	@Autowired
	private CommonServiceImpl commonService;
	
	
	@Test
	public void addNoticeTest() {
		
		System.out.println("addNoticeTest :: ");
		Notice notice = new Notice();
		notice.setNoticeNo(1);
		notice.setNoticeContent("알림입니다");
		notice.setNoticeState("1");
		notice.setNoticeTarget(122);
		notice.setNoticeType("1");
		notice.setToUserId("뻥뻥이");
		
		commonService.addNotice(notice);
		
		notice = commonService.getNotice(1);
		
		Assertions.assertEquals("1", notice.getNoticeNo());
		Assertions.assertEquals("뻥뻥이", notice.getToUserId());

	}
	
	//@Test
	public void getNoticeTest() {
		
		System.out.println("getNoticeTest :: ");
		Notice notice = commonService.getNotice(1);
		System.out.println(notice);
		
		Assertions.assertEquals("1", notice.getNoticeNo());
		Assertions.assertEquals("bbung", notice.getToUserId());
	}
	
	

}
