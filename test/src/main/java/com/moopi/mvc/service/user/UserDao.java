package com.moopi.mvc.service.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.User;

@Mapper
public interface UserDao {
	

////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
	
	// 로그인 
	public User loginUser(String userId);
	
	// 로그아웃
	public User logout(User user) throws Exception;
	

// 회원가입 CRUD
	
	// [완료] 회원가입시 [UserRole - 2.정상회원
	public void addUser(User user) throws Exception;
	
	// 유저정보가져오기
	public User getUser(String userId) ;
	
	// 회원정보수정
	public User updateUser(User user) throws Exception;
	
	// 회원탈퇴시 [UserRole - 5.탈퇴회원]
	public void updateLeaveUser(User user) throws Exception;

// 마이홈
	
	// 마이홈조회 - 마이홈 필요한 값 가져오기
	public User getMyHome(String userId);
	
	
// 회원가입 Ajax
	
	// [중간완료] 아이디중복체크
	public int userIdCheck (String user_id);
	
	// [중간완료] 닉네임중복체크
	public int nicknameCheck (String nickname);
	
// 팔로우 CRUD
	
	// 팔로우 추가
	public void addFollow(@Param("userId") String userId) throws Exception;
			
	// 팔로우 리스트조회 (팔로워 수, 팔로잉 수)
	public List<User> getFollowList(Search search);
	
	// 팔로우삭제
	public void deleteFollow(@Param("userId") String userId) throws Exception;
	
	
// 관리자용 - 회원리스트
	public List<User> getUserList(@Param("search") Search search, @Param("searchState") int searchState);
	
	// 검색관련 - 유저리스트 조회시 회원 수
	public int getTotalCount(Search search) throws Exception;

	// 패스워드수정
	public void updatePwd(User user) throws Exception;

	// 유저아이디찾기 
	public User getUserId(@Param("userId") String userId);

	// 유저비밀번호변경
	public void updateUserPwd(User user) throws Exception;
	
	// 유저프로필수정 
	public void updateProfile(User user) throws Exception;
	

// 형우 Flash 관련 추가
	
	//flash Coin ~~
	public void makeFlashCoin(User user) throws Exception;
	public void joinFlashCoin(User user) throws Exception;
	
// 프로필수정
	// 0. 프로필이미지수정
	public void updateProfileImage(User user);
	// 1. 닉네임수정
	public void updateNickname(User user);
	// 2. 프로필소개수정
	public void updateContent(User user);
	// 3. 관심사수정
	public void updateInterest(User user);


}

	


