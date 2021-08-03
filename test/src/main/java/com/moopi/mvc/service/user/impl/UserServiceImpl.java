package com.moopi.mvc.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.domain.UserData;
import com.moopi.mvc.service.user.UserDao;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private SqlSessionTemplate userSqlSession;
	@Autowired
	private UserDao userDao;
	
	
	// ajax사용으로 인한 로그인
	public User login(User user) {
		userDao.login(user);
		return userDao.loginUser(user.getUserId());
	}
	
	// [완료] 로그인
	public User loginUser(String userId) {

		System.out.println("UserServiceImpl_____loginUser : "+userId);
		System.out.println("여기 진입완료");
		
		return userDao.loginUser(userId);
	}
	
	// [완료] 회원가입
	public void addUser(User user) throws Exception {
		System.out.println("\naddUser쪽으로 진입했습니다");
		System.out.println("user를 확인해볼까요 : "+user+"\n");
		
		userDao.addUser(user);
	}
	
	// 유저정보조회 
	public User getUser(String userId) throws Exception {
		System.out.println("\n2 : UserServiceImpl의 getUser쪽으로 진입했습니다.");
		System.out.println("user쪽을 확인해보겠습니다 : "+userId+"\n");
		return userDao.getUser(userId);
	}
	
	// 유저아이디찾기 
	public User getUserId(String userId) {
		return userDao.getUserId(userId);
	}
	
	// 아이디 찾기
	public User getId(String phone) {
		return userDao.getId(phone);
	}
	
	// 유저정보변경(모바일번호)
	public void updateUserPhone(User user) {
		userDao.updateUserPhone(user);
	}
	
//	// 계정정보수정
//	public void updateUserView(User user) throws Exception {
//		userDao.updateUserView(user);
//	}
	
	// 관리자권한 - 유저리스트조회 
	public Map<String, Object> getUserList(Search search, int searchState) throws Exception{
		
		System.out.println("UserServiceImpl :: getUserList 시작");
		
		List<User> list = userDao.getUserList(search, searchState);
		int totalCount = userDao.getTotalCount(search, searchState);		
		System.out.println("totalCount : "+totalCount);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount); // 총 유저 수
		
		System.out.println("완료");
	
		return map;
	}
	
	// 회원탈퇴 
	public void updateLeaveUser (User user) throws Exception {
		System.out.println("\nUserServiceImpl _____ updateLeaveUser 진입완료");
		System.out.println("유저가 탈퇴를 눌렀을시 5번 유저롤로 변경된다");
		userDao.updateLeaveUser(user);
	}
	
	// 회원블랙
	public void updateBlackUser (User user) throws Exception {
		userDao.updateBlackUser(user);
	}
	
	// 유저비밀번호변경
	public void updateUserPwd(User user) throws Exception{
		userDao.updateUserPwd(user);
	}
	
	// 유저프로필수정 
	public void updateProfile(User user) throws Exception{
		userDao.updateProfile(user);
	}
	
	// [중간완료] 아이디 중복체크 관련 Ajax - RestController에서 받아옴 
	public int userIdCheck(String user_id) {
		userDao = userSqlSession.getMapper(UserDao.class);
		return userDao.userIdCheck(user_id);
	}
	
	// 닉네임 중복체크 관련 Ajax - RestController에서 받아옴 
	public int nicknameCheck(String nickname) {
		userDao = userSqlSession.getMapper(UserDao.class);
		return userDao.nicknameCheck(nickname);
	}
	
// 형우 Flash 관련 추가
	
	//make flash coin count 플래쉬 생성)시 코인차감
	public void makeFlashCoin(User user) throws Exception{
		userDao.makeFlashCoin(user);
	}
	
	public void joinFlashCoin(User user) throws Exception{
		userDao.joinFlashCoin(user);
	}
	

	//결제후 유저 코인 Up
	public void paymentUpdateCoin(User user) throws Exception{
		userDao.paymentUpdateCoin(user);

	}
// 프로필수정 - updateProfile
	
	public void updateUser(User user , int type) throws Exception {
		
		userDao.updateUser(user, type);
	}
	
	// 0. 프로필이미지수정
	public void updateProfileImage(User user) {
		System.out.println("updateProfileImage ServiceImpl 진입완료");
		userDao.updateProfileImage(user);
	}
	
	// 1. 닉네임수정
	public void updateNickname(User user) {
		userDao.updateNickname(user);
	}
	
	// 2. 프로필소개수정
	public void updateContent(User user) {
		userDao.updateContent(user);
	}
	
	// 3. 관심사수정
	public void updateInterest(User user) {
		userDao.updateInterest(user);
	}
	
	// 4. 주소지수정
	public void updateAddress(User user) {
		userDao.updateAddress(user);
	}
	
	// 5. 마이홈상태수정
	public void updateMyhomeStat(User user) {
		userDao.updateMyhomeStat(user);
	}
	
	// 6. 비밀번호변경
	public void updateUserPWD(User user) {
		userDao.updateUserPWD(user);
	}

// 팔로우 CRUD	
	
	// 팔로우
	public void addFollow(String userId, String target) {
		userDao.addFollow(userId, target);
	};
	
	public User getFollow(String userId, String target) {
		return userDao.getFollow(userId, target);
	}
		
	// 팔로우리스트
	public List<User> getFollowList(String userId, int order){
		return userDao.getFollowList(userId, order);
	};
		
	// 언팔로우
	public void deleteFollow(String userId, String target) {
		userDao.deleteFollow(userId, target);
	};
	
	public int getFollowCount(String userId, int order){
		
		return userDao.getFollowCount(userId, order);
	}
	
	//유저롤 업데이트. 
	public void updateUserRole(@Param("user") User user) {
		
		userDao.updateUserRole(user);
	}
	

	//차트관련
	public UserData getJoinPath() throws Exception {
		return userDao.getJoinPath();
	}


	public UserData getGenderData() throws Exception {
		return userDao.getGenderData();
	}
	
	public UserData getAgeData() throws Exception {
		return userDao.getAgeData();
	}
	
	public UserData getInterestData() throws Exception{
		return userDao.getInterestData();
	}
}