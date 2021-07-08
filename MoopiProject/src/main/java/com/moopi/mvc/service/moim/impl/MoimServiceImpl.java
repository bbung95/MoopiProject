package com.moopi.mvc.service.moim.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.moim.MoimMapper;
import com.moopi.mvc.service.domain.Moim;


@Service
public class MoimServiceImpl {

	@Autowired
	private MoimMapper moimMapper;
	

//	public void addMoim(Moim moim) throws Exception {
//		moimMapper.addMoim(moim);
//	}


	public Moim getMoim(int mmNo) {
		System.out.println("모임서비스임플 시작");
		return moimMapper.getMoim(mmNo);
	}


//	public Map<String, Object> getMoimList(Search search) throws Exception {
//		
//		List<Moim> list = moimMapper.getMoimList(search);
//		int totalCount = moimMapper.getTotalCount(search);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("list", list);
//		map.put("totalCount", totalCount);
//		
//		return map;
//	}


//	public void updateMoim(Moim moim) throws Exception {
//		moimMapper.updateMoim(moim);
//	}

}
