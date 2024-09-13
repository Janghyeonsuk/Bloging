# Bloging
### 바로바로 배운 내용들을 블로그에 저장하는 블로그 제작 사이트

<br>

### 0. 목차

[1. 개요](#1-개요)

[2. 기술](#2-기술)

[3. ER 다이어그램](#3-db-er다이어그램)

[4. 기능](#4-기능)

[5. 구현한 기능](#5-구현한-기능)

[6. 실행 방법](#6-실행-방법)

## 1. 개요

![image](https://user-images.githubusercontent.com/74901548/204529828-0a404faa-e33e-45fa-9c62-452936b07d27.png)

jsp을 이용해서 배우기만하고 지나가면 까먹던 지식들을 바로바로 블로그에 남긴다해서 블로깅으로 이름을 지었습니다.
서로의 정보들을 공유할 수 있는 블로그 피드와 하고 싶은말을 적는 자유게시판이 있습니다.

## 2. 기술

1. Web Front : `HTML5` , `CSS`, `JavaScript`, `Bootstrap`
2. Web Server :  `Java`, `ApacheTomcat`
3. DBMS : `MySQL`
4. 개발환경 : `Eclipse`


## 3. DB-ER다이어그램

![image](https://user-images.githubusercontent.com/74901548/204549731-894680ad-5636-4e93-a48d-ec4fa388e111.png)


## 4. 기능

1. 로그인/회원가입
2. 블로그 CRUD
3. 게시판 CRUD
4. 댓글 CRUD
5. 페이징
6. 메모 기능
7. 관리자 페이지


## 5. 구현한 기능

1. 게시판 - 게시판 작성, 수정 ,삭제 가능
2. 메모 - 메뉴에 메모를 통해서 작성 및 수정 가능
3. 블로그 - 블로그 작성, 수정, 삭제 가능
4. 댓글 - 블로그 별로 댓글 작성, 삭제 가능
5. 페이징 - 게시판은 10개의 게시물씩 블로그는 3개씩 페이징
6. 관리자 페이지 - 4가지 옵션을 통해서 블로그글을 전체로 비활성화, 활화 / 게시판글을 전체로 비활성화, 활성화 가능


## 6. 실행 방법

1. 로그인 / 회원가입
메뉴 오른쪽 위에 login 버튼으로 사용 / 폼태그로 로그인 가능
계정이 없을 시에 login 창 화면 아래에 회원가입 창으로 이동 후 회원가입 가능
회원가입시 DB User 테이블에 저장
![image](https://user-images.githubusercontent.com/74901548/204676109-9384ae6d-c392-44f8-8696-07fc50dc0987.png)
![image](https://user-images.githubusercontent.com/74901548/204676181-95d79905-1922-475d-a97f-23a4b4d147dc.png)

2. 게시판
메뉴 오른쪽 위에 Board 버튼으로 사용
회원별 ID값을 받아서 게시판에 작성
글 제목을 통해 상세보기가 가능하며 자신이 작성한 게시물만 수정, 삭제 가능
10개 이상의 게시물이 올라 올 시 페이징을 통해 다음 페이지 추가
작성, 수정, 삭제 시 DB Board 테이블에 저장
![image](https://user-images.githubusercontent.com/74901548/204682376-7f53e16a-3581-4a9c-a122-6bd88d915dba.png)
![image](https://user-images.githubusercontent.com/74901548/204682440-6ba14c3b-0791-4ceb-ab11-a37986dc6e7b.png)

3. 메모
메뉴 오른쪽 위에 Memo 메뉴를 통해서 메모 가능 사용
이미 메모한 내용이 있으면 Edit으로 메뉴 변경후 메모 수정 가능
입력한 메모는 Blog 또는 MyBlog 우측에 표시
작성, 수정 시 DB Memo 테이블에 저장
![image](https://user-images.githubusercontent.com/74901548/204682724-4b6522dd-e17e-476b-aa72-f68d88816a39.png)
![image](https://user-images.githubusercontent.com/74901548/204682754-e060ddc2-2ef3-40f7-91eb-e07ecd5a029d.png)

4. 블로그
메뉴 오른쪽 위에 Bloging 메뉴를 통해서 블로그 페이지 사용
블로그글 작성시 사진을 DB에 저장하고 받아오는 파일 업로드 구현
3개 이상의 글이 올라올 시 페이징을 통해 다음 페이지 추가
자신이 작성한 블로그 게시글만 수정 및 삭제 버튼 생성 및 사용 가능
Myblog 버튼을 통해서 자신이 작성한 게시글만 확인 가능
작성, 수정, 삭제 시 DB Blog 테이블에 저장
![image](https://user-images.githubusercontent.com/74901548/204682972-8091b4c7-f4d7-4710-8c92-90379a56a36a.png)
![image](https://user-images.githubusercontent.com/74901548/204683083-484dbfd3-2f5f-465d-846c-407e979f8c52.png)

5. 댓글
블로그 게시글 자세히 보기를 누르면 하단 부분에 댓글 사용 가능
자신이 작성한 댓글만 삭제 기능 사용 가능
작성, 삭제 시 DB Comment 테이블에 저장
![image](https://user-images.githubusercontent.com/74901548/204683314-807983a5-94b2-4600-b03e-9a5fa22f75ff.png)

6. 관리자 페이지
admin 계정으로 로그인시에만 메뉴에 admin 메뉴 생성
admin 이외에는 페이지 입장이 불가능하며 버튼도 사용 불가능
블로그 / 게시판 비활성화 버튼 입력시 모든 블로그 , 게시판 글들이 비활성화되어 보이지 않음
블로그 / 게시판 활성화 버튼 입력시 모든 블로그 , 게시판 글들이 활성화도어 원상태로 돌아옴
![image](https://user-images.githubusercontent.com/74901548/204684732-6da84c2c-8ea0-417d-a4c2-29cd9d273b50.png)

7. 에러 페이지
유효하지 않은 페이지 입력시 예외처리 페이지
![image](https://user-images.githubusercontent.com/74901548/204684881-4ecdeb65-338b-401d-8ceb-742b3b23017c.png)
