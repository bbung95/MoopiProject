package com.moopi.mvc.service.user.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.domain.UserData;

public interface UserService {
	
	
	public User login(User user);
	
	public User loginUser(String userId);
	
	public void addUser(User user) throws Exception;
	
	public User getUser(String userId) throws Exception;
	
	public User getUserId(String userId);
	
	public User getId(String phone);
	
	public void updateUserPhone(User user);
	
	public Map<String, Object> getUserList(Search search, int searchState) throws Exception;
		
	public void updateLeaveUser (User user) throws Exception;
	
	public void updateBlackUser (User user) throws Exception;
	
	public void updateUserPwd(User user) throws Exception;
	
	public void updateProfile(User user) throws Exception;
	
	public int userIdCheck(String user_id);
	
	public void makeFlashCoin(User user) throws Exception;
	
	public void joinFlashCoin(User user) throws Exception;

	public void paymentUpdateCoin(User user) throws Exception;
	
	public void updateProfileImage(User user);

	public void addFollow(String userId, String target);
	
	public User getFollow(String userId, String target);
		
	public List<User> getFollowList(String userId, int order);
		
	public void deleteFollow(String userId, String target);
	
	public int getFollowCount(String userId, int order);
	
	public void updateUserRole(@Param("user") User user);

	public UserData getJoinPath() throws Exception;

	public UserData getGenderData() throws Exception;
	
	public UserData getAgeData() throws Exception;
	
	public UserData getInterestData() throws Exception;

	public int nicknameCheck(String nickname);
	
	public void updateUser(User user , int type) throws Exception;;
	
	
	
	
	public void updateNickname(User user);

	public void updateContent(User user);
	
	public void updateInterest(User user);
	
	public void updateAddress(User user);
	
	public void updateMyhomeStat(User user);
	
	public void updateUserPWD(User user);
	
}
