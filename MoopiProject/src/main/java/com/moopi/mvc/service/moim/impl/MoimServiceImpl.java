package com.moopi.mvc.service.moim.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.moim.MoimDao;
import com.moopi.mvc.service.moim.MoimService;
import com.moopi.mvc.service.domain.Moim;


//@Service("moimServiceImpl")
public class MoimServiceImpl implements MoimService {

	//@Autowired
	//@Qualifier("moimDaoImpl")
	private MoimDao moimDao;
	
	public MoimServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addMoim(Moim moim) throws Exception {
		moimDao.insertMoim(moim);
	}

	@Override
	public Moim getMoim(int mmNo) throws Exception {
		return moimDao.findMoim(mmNo);
	}

	@Override
	public Map<String, Object> getMoimList(Search search) throws Exception {
		
		List<Moim> list = moimDao.getMoimList(search);
		int totalCount = moimDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	@Override
	public void updateMoim(Moim moim) throws Exception {
		moimDao.updateMoim(moim);
	}

}
