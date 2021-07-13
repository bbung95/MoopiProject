1. 
mysql -u root -p
1234
create user moopi@localhost identified by '1234'

workbench > 왼쪽네비게이터 users and Privileges 클릭 User Accounts 안에 moopi 선택 administrative Roles 전부 주기

mysql -u moopi -p 
1234

create database moopi;

show databases;

use moopi;

여기까지가 database생성 및 접근 이곳에서 테이블만드세요.
