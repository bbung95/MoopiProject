package com.moopi.mvc.service.user;

import java.util.List;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.User;

public interface UserDao {
	
	public void addUser(User user) throws Exception;
	
	public User getUser(String userId) throws Exception;
	
	public List<User> getUserList(Search search) throws Exception;
	
	public void updateUser(User user) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;

}
