package com.moopi.mvc.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.moopi.mvc.domain.User;


@Mapper
public interface UserMapper {
	
	User getUser(@Param("userId") String userId);
}
