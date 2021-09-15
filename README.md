# MoopiProject
---

### 1. 프로젝트

- 기간 : 2021-06-06 ~ 2021-08-06
- 인원 : 5명
- 기술스택 
 * OS : Window , Mac
 * lang : Java , JavaScript , Node.js
 * Was : Apache Tomcat
 * DB : MySql , MongoDB
 * FrameWork : SpringBoot(gradle) , MyBatis
 * tool : VSCode , eclipse , STS
 * API : I'm port, Naver Login, Kakao Login, Google Login, Kakao Map, Google Calendar, CoolSms , Web-RTC. 
         Bootstrap5, Summernote, Full Calendar, Chart JS
  
### 2. 소개 

 Moopi란 'Move People' 사람을 감동시키고, 움직이는 지역 기반 관심사 모임 플랫폼입니다.  
마이홈에서 자신의 개성을 드러내거나 동일한 관심사를 가진 다른 유저의 마이홈을 방문 할 수 있고,  
번개 혹은 모임을 통해 만난 유저가 마음에 들었다면 팔로우 할 수 있습니다.  
화상 채팅 및 그룹채팅을 통한 비대면 커뮤니케이션, 캘린더를 통한 일정 확인,  
초대하기 및 상황에 따른 알림 기능, SNS 계정 연동 등등 다양한 서비스를 제공하고 있습니다.  

### 3. 구현 파트

1. 실시간채팅 , 화상채팅 시스템

  - Node.js express Web서버를 사용하요 Web Server를 구현
  - Http의 요청과 응답 방식이 아닌 Web Socket의 양방향 통신을 사용
  - Web Socket 기반의 socket.io를 사용하여 실시간채팅을 구현
  - WebRTC를 사용하여 화상채팅을 구현 (Https)  

2. 알림

  - 무피 프로젝트의 전체적인 알림시스템
  - CRUD를 이용하여 알림을 구현

3. 통합검색

  - 상단바를 통해 유저, 게시글, 모임무피, 번개무피를 검색 및 이동할 수 있다.
  - Ajax 통신을 이용하여 검색리스트 표시

4. 마이페이지
  
  - 유저 자신을 표현할 수 있는 SNS형식의 마이페이지
  - CRUD를 이용한 게시글 작성 및 수정,삭제
  - 팔로우, 채팅, 프로필 수정
  
5. 기타
  
  - 프로젝트 View Page 
  - Bootstrap을 이용한 반응형 웹 구현

  
