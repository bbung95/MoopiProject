package com.moopi.mvc.service.followLike;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.moopi.mvc.service.domain.FollowLike;
 
@Mapper
public interface FollowLikeDao {

	
	public void addLike(@Param("followLike")FollowLike followLike);
	
	public int getLike(@Param("followLike")FollowLike followLike);
	

		
	

}	
