package com.moopi.mvc;

import java.util.Map;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.moopi.mvc.service.moim.impl.MoimServiceImpl;
import com.moopi.mvc.service.user.impl.UserServiceImpl;
import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Moim;
import com.moopi.mvc.service.domain.User;

@SpringBootTest
public class MoimTest {
	
	@Autowired
	private MoimServiceImpl moimService;

	@Autowired
	private UserServiceImpl userService;
	
	
//	@Test
//	public void applyMoim() throws Exception{
//		System.out.println("Test getApply:::");
//		moimService.applyMoim("user04", 1);
//	}
	
	
//	@Test
//	public void leaveMoim() throws Exception {
//		System.out.println("Test leaveMoim:::");
//		moimService.leaveMoim("user04", 1);
//	}
	
//	@Test
//	public void updateMember() throws Exception {
//		System.out.println("Test updateMember:::");
//		moimService.updateMemeber("user03", 1, 1);
//	}
	
//	@Test
//	public void getMemberList() throws Exception {
//		System.out.println("Test getMemberList");
//		Map map = moimService.getMemberList(2);
//		System.out.println(map.get("list"));
//		System.out.println("모임가입된총원 : "+map.get("totalCount"));
//	}
	
	
//	@Test
//	public void getMoim() {
//		
//		System.out.println("Test getMoim :::");
//		System.out.println(moimService.getMoim(1));
//		Moim moim = moimService.getMoim(1);
//		System.out.println(moim);
//		
//		Assertions.assertEquals("복실이야구단", moim.getMmName());
//		Assertions.assertEquals("순수혈통 복실이", moim.getMmContent());	
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
	
//	@Test
//	public void addMoim() throws Exception{
//	      
//      System.out.println("Test addMoim :::");
//      Moim moim = new Moim();
//      moim.setMmNo(17);
//      moim.setMmName("식물갤러리");
//      moim.setMmContent("식물도 하나의 생명입니다.");
//      moim.setMmFile("난초");
//      moim.setMmMaxCount(7);
//      moim.setMmAddr("광진구");
//      moim.setMmInterest(3);
//      moim.setMmState(2);
//      moim.setMmMinAge(30);
//      moim.setMmMaxAge(87);
//      moim.setMmType(1);
//      
//      moimService.addMoim(moim);
//      System.out.println(moim);
//   }
	
	
//	@Test
//	public void getMoimList() throws Exception{
//		
//		System.out.println("겟모임리스트~~ 테스트~~");
//		Search search = new Search();
//		search.setSearchCondition(1);
//		search.setSearchKeyword("2");
//		Map map = moimService.getMoimList(search);
//		System.out.println("인터레스트가 2인 모임의 리스트 : "+map.get("list"));
//		System.out.println("인터레스트가 2인 모임의 개수"+map.get("totalCount"));	
//		
////		search.setSearchCondition(2);
////		search.setSearchKeyword("중구");
////		Map map = moimService.getMoimList(search);
////		System.out.println("거주지가 중구인 모임의 리스트 : "+map.get("list"));
////		System.out.println("거주지가 중구인 모임의 개수"+map.get("totalCount"));
//	}

//	@Test
//	public void getTotalCount() throws Exception{
//		
//		System.out.println("겟토탈카운트 테스트");
//		Search search = new Search();
//		search.setSearchCondition(2);
//		search.setSearchKeyword("서초구");
//		System.out.println("거주지가 서초구인 모임의 숫자 : "+moimService.getTotalCount(search));
//		Assertions.assertEquals(1, moimService.getTotalCount(search));
//	}

}
