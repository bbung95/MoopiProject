package com.moopi.mvc.service.followLike.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moopi.mvc.service.domain.FollowLike;
import com.moopi.mvc.service.followLike.FollowLikeDao;

@Service
public class FollowLikeServiceImpl {

	@Autowired
	private FollowLikeDao followLikeDao;
	
	
	public int getLike(FollowLike followLike) {
		
		return followLikeDao.getLike(followLike);
	}
	
	public void addLike(FollowLike followLike) {
		
		followLikeDao.addLike(followLike);
	}
	
	
}