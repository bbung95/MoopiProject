package com.moopi.mvc.service.moim;

import java.util.List;

//import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.moopi.mvc.common.Search;
//import com.moopi.mvc.service.domain.User;
import com.moopi.mvc.service.domain.Moim;
import com.moopi.mvc.service.domain.Member;

@Mapper
public interface MoimDao {

	//모임생성
	public void addMoim(Moim moim) throws Exception;
	
	//모임 리스트 조회
	public List<Moim> getMoimList(Search search) throws Exception;
	
	//내가 가입한 모임 리스트 조회
	public List<Moim> getMyMoimList(@Param("userId")String userId) throws Exception;
	
	//모임 상세보기
	public Moim getMoim(@Param("mmNo") int mmNo);
	
	//모임 상세보기2
	public Moim getMoim(@Param("mmName") String mmName);
	
	//모임 정보 수정
	public void updateMoim(Moim moim) throws Exception;
	
	//모임가입신청, 가입신청시 멤버role은 1
	public void applyMoim(@Param("userId") String userId, 
						  @Param("mmNo") int mmNo) throws Exception;
	
	//모임생성시, 생성자가 바로 모임장 되는 메서드이다. 멤버role은 4
	public void newApplyMoim(@Param("userId") String userId, 
							  @Param("mmNo") int mmNo) throws Exception;
	
	//가입신청 거절하기
	public void refuseApply(@Param("memberNo") int memberNo) throws Exception;
	
	//모임가입탈퇴, 탈퇴시 멤버role은 6
	public void leaveMoim(@Param("userId") String userId, 
						  @Param("mmNo") int mmNo) throws Exception;
	
	//멤버 권한변경(가입신청 수락, 매니저 위임 및 박탈, 블랙)
	//status(1가입신청->일반멤버, 2일반멤버->매니저, 3매니저->일반멤버, 4블랙)
	public void updateMember(@Param("userId") String userId, 
							 @Param("mmNo") int mmNo,
							 @Param("status") int status) throws Exception;
	
	//멤버숫자1증가
	public void addCount(@Param("mmNo") int mmNo) throws Exception;
	
	//멤버숫자1감소
	public void subCount(@Param("mmNo") int mmNo) throws Exception;
	
	//해당 mmNo에 가입신청자 조회, 가입된 멤버 리스트 조회 
	//status(1가입신청리스트, 2가입된멤버리스트)
	public List<Member> getMemberList(@Param("mmNo") int mmNo,
			 	@Param("status") int status) throws Exception;
	
	//해당 유저의 권한 조회
	public Member checkMember(@Param("userId") String userId,
			@Param("mmNo") int mmNo) throws Exception;
	
	
	//검색조건에 따른 모임 총 갯수
	public int getTotalCount(Search search) throws Exception;

	//모임에 가입된 멤버의 총 인원수
	public int getTotalCountMember(int mmNo) throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
