package com.moopi.mvc.service.flash.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.Flash;
import com.moopi.mvc.service.flash.FlashDao;
import com.moopi.mvc.service.flash.FlashService;

//@Service("flashServiceImpl")
public class FlashServiceImpl implements FlashService {

	// @Autowired
	// @Qualifier("flashDaoImpl")
	private FlashDao flashDao;

	// Constructor
	public FlashServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addFlash(Flash flash) throws Exception {
		flashDao.insertFlash(flash);
	}

	@Override
	public Flash getFlash(int flashNo) throws Exception {

		return flashDao.findFlash(flashNo);
	}

	@Override
	public Map<String, Object> getFlashList(Search search) throws Exception {

		List<Flash> list = flashDao.getFlashList(search);
		int totalCount = flashDao.getTotalCount(search);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);

		return map;
	}

	@Override
	public void updateFlash(Flash flash) throws Exception {
		flashDao.updateFlash(flash);

	}

}
