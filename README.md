/////////////////////////////////////////// DB //////////////////////////////////////

윈도우즈 + R 누른 후 cmd 검색

--권한 부여
sqlplus system/System1234

-- pocsin 계정이 있을 경우
drop user pocsin cascade;

--admin계정생성
create user pocsin IDENTIFIED by pocsin
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE TEMP;

-- admin 계정 권한부여
GRANT CONNECT, DBA, RESOURCE TO pocsin;

--admin계정 접속
conn pocsin/pocsin;

-- 계정 확인
show user;

-- 1. 회원 정보 테이블(member)-------------------------------------------
CREATE TABLE MEMBER(
ID VARCHAR2(40),                  -- 아이디
PW VARCHAR2(40) not null,                   -- 패스워드
EMAIL VARCHAR2(50) not null,                      -- 이메일
NAME VARCHAR2(40) not null,                       -- 이름
POSTNUM VARCHAR2(20),                   -- 우편번호
PHONENUM VARCHAR2(20),                  -- 전화번호
ADDRESS VARCHAR2(100),                   -- 주소
CONSTRAINT POCSIN_MEMBER_PK PRIMARY KEY(id)
);

-- 회원 등록
INSERT INTO MEMBER(ID, PW, EMAIL, NAME, POSTNUM, PHONENUM, ADDRESS) VALUES (
'admin', 'admin', 'admin@naver.com', '관리자', '12345',
'010-1234-5678', '서울시 송파구 방이동 현대아파트');

INSERT INTO MEMBER(ID, PW, EMAIL, NAME, POSTNUM, PHONENUM, ADDRESS) VALUES (
'ksy', 'ksy', 'ksy@naver.com', '기성용', '11111',
'010-1326-2632', '서울시 중구 동대문4가 종로빌딩');

INSERT INTO MEMBER(ID, PW, EMAIL, NAME, POSTNUM, PHONENUM, ADDRESS) VALUES (
'kim', 'kim', 'kim@naver.com', 'kimheesun', '12345',
'010-1212-3478', '서울시 강남구 강남아파트');

INSERT INTO MEMBER(ID, PW, EMAIL, NAME, POSTNUM, PHONENUM, ADDRESS) VALUES (
'jang', 'jang', 'jang@naver.com', 'jangnara', '12345',
'010-2222-1234', '서울시 마포구 113');

INSERT INTO MEMBER(ID, PW, EMAIL, NAME, POSTNUM, PHONENUM, ADDRESS) VALUES (
'kang', 'kang', 'kang@naver.com', 'kangjihee', '12345',
'010-1538-8451', '서울시 구로구 현대아파트');

INSERT INTO MEMBER(ID, PW, EMAIL, NAME, POSTNUM, PHONENUM, ADDRESS) VALUES (
'lee', 'lee', 'lee@naver.com', 'leemin', '12345',
'010-1538-8451', '서울시 구로구 15-30');

commit;

select * from member;
---------------------------------------------------------------------------

-- 2. 자유게시판(파자마) 테이블(board, board_reply)--------------------------
-- Board 테이블 생성
CREATE TABLE Board (
bno number(10, 0) NULL,                    -- 게시글 번호
id varchar2(20) NULL,                         -- 아이디
--type VARCHAR2(50) NOT NULL,          -- 타입
title varchar2(200) NOT NULL,              -- 제목
content varchar2(2000) NOT NULL,      -- 내용
writer varchar2(50) NOT NULL,             -- 작성자
--viewcnt number,                                 -- 조회수
replycnt number,                                 -- 댓글수
regdate date default sysdate,                -- 등록일자
updatedate date default sysdate,           --수정일자
CONSTRAINT pk_board PRIMARY KEY(bno)
);

alter table board modify replycnt number default 0;

-- Board_seq 시퀀스 생성
create sequence Board_seq
increment by 1
start with 0
maxvalue 9999999
minvalue 0;

-- Board_reply 테이블 생성
CREATE TABLE Board_reply (
rno number(10, 0) NULL,                   -- 댓글 번호
bno number(10, 0) NOT NULL,           -- 게시글 번호
reply varchar2(1000) NOT NULL,         -- 댓글 내용
replyer varchar2(50) NOT NULL,          -- 댓글 작성자
replydate date default sysdate,            -- 작성일자
updatedate date default sysdate          -- 수정일자
);

-- Board_reply_seq 시퀀스 생성
create sequence Board_reply_seq
increment by 1
start with 0
maxvalue 9999999
minvalue 0;

alter table Board_reply add constraint pk_reply primary key (rno) ;
alter table Board_reply add constraint FK_REPLY_bno foreign key (bno) REFERENCES Board (bno);

--alter table Board_reply drop constraint FK_REPLY;
--alter table Board_reply add constraint FK_REPLY_bno foreign key (BNO) references  Board (BNO) on delete cascade;

-- 게시판 등록
INSERT INTO board (bno, id, title, content, writer) VALUES (board_seq.nextval, 'jang', '새벽에 자주 깨고 깊이 못자는 폭꿈러들 이 운동 해봐!! ', '숙면에 좋은 스트레칭
단계1
1. 침대 위에 바르게 엎드리고,
양손은 어깨 옆에 두어서 바닥을 짚는다.

단계2
2. 숨을 들이마셨다가 천천히 내쉬면서
팔을 펴 상체를 천천히 들어올린다.

단계3
3. 허리를 뒤로 젖혀 몸을 활처럼 만든 상태에서 5초 정도 버틴다.
너무 무리하지는 않는다.

단계4
4. 숨을 들이마셨다가 천천히 내쉬면서
상체를 내린다.

', 'jangnara');
INSERT INTO board (bno, id, title, content, writer) VALUES (board_seq.nextval, 'kang', '헤어진지 얼마안된 폭꿈러있어? 초성 맞춰주라..', 'ㅇㅁ ㄴ ㅁㄹㄱㅈㅁ ㄴ ㄴ ㄴㄱㅈㄷ ㄴㄴ ㄴㄱ ㅁㄷㄱ ㅊㅇㅇ ㄷ

 

예전에 꽁냥꽁냥하다가 그만 둔 사인데 그래도 오랬동안 썸탔기 때문에 너무 신경쓰여요ㅜ

카톡 상메가 저건데... 중간에 띄어쓰기 잘못됬을 수도 있어욝 ...

제발 초성신이 강림하시길..........제발 언니 오빠들........젭알 아 진짜 제발ㅠㅜ..........', 'kangjihee');
INSERT INTO board (bno, id, title, content, writer) VALUES (board_seq.nextval, 'kim', '요즘 등산 자주했더니 효과 진짜 좋은듯!', '원래 운동 안하는데 등산 하고 진짜 푹잠자고있어!
기분도 상쾌하고 정상 찍으면 보람도 느껴짐 ㅋㅋㅋ', 'kimheesun');
INSERT INTO board (bno, id, title, content, writer) VALUES (board_seq.nextval, 'ksy', '수면일기 쓰는 사람 있어?ㅠㅠ 이거 이렇게 쓰는거 맞아? 도와주라ㅜㅜ', '평소에 일기도 안쓰는데.. 수면일기 쓰려니까 어떻게 써야할지 모르겠어 ㅜㅋㅋㅋ
써본 사람 있어? 공유 좀 ㅠㅠㅠ', '기성용');
INSERT INTO board (bno, id, title, content, writer) VALUES (board_seq.nextval, 'lee', '취뽀 하자마자 불면증 나았음!!! 취준생들 불안해 하지말고 취뽀하자!!!', '역시 사람은 맘이 편해야함 ㅋㅋㅋㅋㅋㅋㅋㅋ
그동안 그렇게 잠 못잤는데...
취뽀하자마자 숙면이야 ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
취준생들! 힘내자! 너네도 할 수 있다!!!!!!!!', 'by');
INSERT INTO board (bno, id, title, content, writer) VALUES (board_seq.nextval, 'kim', '도시락 싸려고 일찍 일어나다보니 오후에 좀 졸립다..', '일찍 일어나서 그런가.. 너무 피곤해 ㅠㅠ
그치만 요즘 물가가..하아..
도시락 포기할 수 없는데...
너무 졸려어어어', 'kimheesun');
INSERT INTO board (bno, id, title, content, writer) VALUES (board_seq.nextval, 'jang', '잘 시간엔 잠이 안오는데 왜 점심만 먹으면 졸릴까 병원가봐야하나..', '진짜 미친듯이 졸려.. 너무 졸려..
기면증인가..병원가야할까 ㅠㅠㅠ
살려죠오오오', 'jangnara');
INSERT INTO board (bno, id, title, content, writer) VALUES (board_seq.nextval, 'kang', '광고 절대아님!!!!!!! 영수증 있음!!!!! 디스크 있는 폭꿈러들 강추 드림!!', '템퍼 쓰니깐 좋더라
맨날 담 걸렸는데 바꾸고 안걸렸어
', 'kangjihee');
INSERT INTO board (bno, id, title, content, writer) VALUES (board_seq.nextval, 'cho', '수영해도 잠 못잤는데 매일 만보 걸으니까 기분도 좋고 뭔가 개운하네', '역시 걷는게 최고인듯
한강가면 걷는 사람 엄청 많음
같이 러닝할 사람??', 'cristal');
-- 재귀 복사를 통해서 데이터의 개수를 늘린다. 반복해서 여러번 실행
INSERT INTO board (bno, id, title, content, writer) (select board_seq.nextval, id, title, content, writer from board);

-- 댓글 등록
-- INSERT INTO Board_reply (rno, bno, reply, replyer) VALUES (Board_reply_seq.NEXTVAL, 1, '테스트 답변입니다.', 'John Doe');
-- 재귀 복사를 통해서 데이터의 개수를 늘린다. 반복해서 여러번 실행
-- INSERT INTO Board_reply (rno, bno, reply, replyer) (select Board_reply_seq.NEXTVAL, bno, reply, replyer from Board_reply);

-- bno 칼럼 값을 역순으로 정렬
select * from board order by bno desc;
SELECT * FROM board_reply order by rno desc;

COMMIT;

select count(*) from board;
-------------------------------------------------------------------------------------------------------------------


-- 3. Notice 테이블 생성--------------------------------------------------------
CREATE TABLE Notice (
   noticebno number(10, 0)   NOT NULL,
   admin varchar2(50)   NOT NULL,
   title varchar2(200)   NOT NULL,
   content varchar2(2000)   NOT NULL,
   regdate date default sysdate
);

-- Notice_seq 시퀀스 생성
create sequence Notice_seq
increment by 1
start with 0
maxvalue 9999999
minvalue 0;

commit;
------------------------------------------------------------------------------


-- 4. 상품리스트 테이블(product)_ ver2 23.11.14------------------------------
CREATE TABLE product (
per_num varchar2(50) not null,               -- 상품 번호
pbrand VARCHAR2(100),  -- 상품 브랜드
pname VARCHAR2(50),      -- 상품 이름
pdiscount VARCHAR2(50),   -- 상품 할인율
pay_amount int, -- 상품 가격
category VARCHAR2(50),   -- 상품 종류
pimage VARCHAR2(500),      -- 상품 사진
PRIMARY KEY(per_num)
);

-- Product_seq 시퀀스 생성
create sequence PRODUCT_SEQ
increment by 1
start with 0
maxvalue 9999999
minvalue 0;

commit;
---------------------------------------------------------------------------------

--상품등록_ ver2 23.11.14---------------------------------------------------------
-- 수면등
INSERT INTO product VALUES (product_seq.nextval, 'LEXON', 'MinaLamp', '45%', 78000, '수면등', 'MinaLamp.svg');
INSERT INTO product VALUES (product_seq.nextval,'AGO', 'Balloon Table Lamp', '20%', 545000, '수면등','Balloon.svg');
INSERT INTO product VALUES (product_seq.nextval, 'TECNOLUMEN', 'WA24', '30%', 1190000, '수면등','WA24.svg');
INSERT INTO product VALUES (product_seq.nextval, '일광전구', 'snowman', '20%', 85000, '수면등','snowman.svg');
INSERT INTO product VALUES (product_seq.nextval,'FLOS', 'Bellhop', '20%', 460000, '수면등','Bellhop.svg');
INSERT INTO product VALUES (product_seq.nextval, 'HAY', 'PC Portable', '10%', 150000, '수면등', 'PC Portable.svg');
INSERT INTO product VALUES (product_seq.nextval, 'tradition', 'Flowerpot VP3', '15%', 440000, '수면등', 'Flowerpot VP3.svg');
INSERT INTO product VALUES (product_seq.nextval,'HAY', 'Acorn22', '20%', 160000, '수면등', 'Acorn22.svg');
INSERT INTO product VALUES (product_seq.nextval, 'MARSET', 'Follow Me', '10%', 4400000, '수면등', 'Follow Me.svg');

--가습기
INSERT INTO product VALUES (product_seq.nextval, '미로', '완벽세척 초음파 가습기', '20%', 159000, '가습기', '완벽세척 초음파 가습기.svg');
INSERT INTO product VALUES (product_seq.nextval,'아이닉', '대용량 UV살균 복합식 가습기', '41%', 139000, '가습기', '대용량 UV살균 복합식 가습기.svg');
INSERT INTO product VALUES (product_seq.nextval, 'LG', '맑은공기 가습기', '45%', 78000, '가습기', '맑은공기 가습기.svg');
INSERT INTO product VALUES (product_seq.nextval, '스테나', '초음파 4L 심플키트 통세척 가습기', '53%', 59500, '가습기', '초음파 4L 심플키트 통세척 가습기.svg');
INSERT INTO product VALUES (product_seq.nextval,'요아이', '온습도계 기화식 가습기', '47%', 89000, '가습기', '온습도계 기화식 가습기.svg');
INSERT INTO product VALUES (product_seq.nextval, '에어메이드', '4L대용량 복합식 가열식 가습기', '46%', 79000, '가습기', '4L대용량 복합식 가열식 가습기.svg');
INSERT INTO product VALUES (product_seq.nextval, '오아', '6L 저소음 초음파 대용량 가습기', '28%', 49800, '가습기', '6L 저소음 초음파 대용량 가습기.svg');
INSERT INTO product VALUES (product_seq.nextval,'위닉스', '올바른 대용량 복합식 가습기', '21%', 125000, '가습기', '올바른 대용량 복합식 가습기.svg');
INSERT INTO product VALUES (product_seq.nextval, '스와다', '스와다 프리미엄 가습기', '21%', 38800, '가습기', '스와다 프리미엄 가습기.svg');

--잠옷세트
INSERT INTO product VALUES (product_seq.nextval, '쥬니쥬', '그릭 스트라이프 세트', '9%', 29800, '잠옷세트', '그릭 스트라이프 세트.svg');
INSERT INTO product VALUES (product_seq.nextval,'해피데이', '베니티 스트라이프 세트 3색', '12%', 308000, '잠옷세트', '베니티 스트라이프 세트 3색.svg');
INSERT INTO product VALUES (product_seq.nextval, '해피데이', '베니티 베어', '45%', 78000, '잠옷세트', '베니티 베어.svg');
INSERT INTO product VALUES (product_seq.nextval, '쥬니쥬', '릴리안 프릴 파자마세트', '10%', 30600, '잠옷세트', '릴리안 프릴 파자마세트.svg');
INSERT INTO product VALUES (product_seq.nextval,'무드문', '라벤더 긴팔 그린 세트', '36%', 36900, '잠옷세트', '라벤더 긴팔 그린 세트.svg');
INSERT INTO product VALUES (product_seq.nextval, '무드문', '포켓 체크 핑크 세트', '27%', 34200, '잠옷세트', '포켓 체크 핑크 세트.svg');
INSERT INTO product VALUES (product_seq.nextval, '올썸', '코코 스트라이프 반려견 잠옷 세트', '23%', 12900, '잠옷세트', '코코 스트라이프 반려견 잠옷 세트.svg');
INSERT INTO product VALUES (product_seq.nextval,'올썸', '디어베어 반려견 펫 파자마 세트', '23%', 129000, '잠옷세트', '디어베어 반려견 펫 파자마 세트.svg');
INSERT INTO product VALUES (product_seq.nextval, '올썸', '플레인 반려견 펫 파자마 세트', '22%', 129000, '잠옷세트', '플레인 반려견 펫 파자마 세트.svg');

--침구세트
INSERT INTO product VALUES (product_seq.nextval, 'FLOMO', 'Charming Jo pillow cover', '12%', 29000, '침구세트', 'Charming Jo pillow cover.svg');
INSERT INTO product VALUES (product_seq.nextval,'FLOMO', 'Granny pie blanket', '20%', 58000, '침구세트', 'Granny pie blanket.svg' );
INSERT INTO product VALUES (product_seq.nextval, 'MAATILA', '빈티지맨션 고밀도순면 차렵이불소', '15%', 78000, '침구세트', '빈티지맨션 고밀도순면 극세사 차렵이불.svg');
INSERT INTO product VALUES (product_seq.nextval, 'MAATILA', '모던 극세사 차렵이불중', '10%', 83900, '침구세트', 'vintage blanket.svg');
INSERT INTO product VALUES (product_seq.nextval,'MAATILA', '내추럴 고밀도순면 극세사 차렵이불대', '10%', 83900, '침구세트', 'stripe blanket.svg');
INSERT INTO product VALUES (product_seq.nextval, 'MAATILA', '베러웜 자가발열 고정밴드 침대패드', '27%', 49900, '침구세트', '베러웜 자가발열 고정밴드 침대패드.svg');
INSERT INTO product VALUES (product_seq.nextval, 'LATULIPE', '다우니 체온조절 차렵이불세트', '21%', 124000, '침구세트', '다우니 체온조절 차렵이불세트.svg');
INSERT INTO product VALUES (product_seq.nextval,'ORDINENT', 'patch work bedding pillow case', '23%', 78000, '침구세트', 'patch.svg');
INSERT INTO product VALUES (product_seq.nextval, 'LATULIPE', '에덴 사계절 양면 차렵이불', '30%', 137000, '침구세트', '에덴 사계절 양면 차렵이불.svg');

--릴렉서
INSERT INTO product VALUES (product_seq.nextval, 'ALESSI', 'The Five Seasons Room Spray', '45%', 167000, '릴렉서', 'The Five Seasons Room Spray.svg');
INSERT INTO product VALUES (product_seq.nextval,'taylor scents', '019 Powder Oat Perfume', '30%', 109000, '릴렉서', '019 Powder Oat Perfume.svg');
INSERT INTO product VALUES (product_seq.nextval, 'HAY', 'Chim Chim Scent Diffuser', '18%', 74000, '릴렉서', 'Chim Chim Scent Diffuser.svg');
INSERT INTO product VALUES (product_seq.nextval, 'LIBER', '리추얼 필로우 미스트 100ml 뉴 하우스', '20%', 27000, '릴렉서','리추얼 필로우 미스트 100ml 뉴 하우스.svg');
INSERT INTO product VALUES (product_seq.nextval,'GRAFIKA', 'ASP FILOWMIST', '10%', 75000, '릴렉서', '릴렉싱 필로우미스트.svg');
INSERT INTO product VALUES (product_seq.nextval, '쿤달', '릴렉싱 필로우미스트', '20%', 49200, '릴렉서', 'ASP FILOWMIST.svg');
INSERT INTO product VALUES (product_seq.nextval, 'bodeepsleep', '맑은잠 필로우 미스트', '21%', 28800, '릴렉서', '맑은잠 필로우 미스트.svg');
INSERT INTO product VALUES (product_seq.nextval,'LOOKAST', 'LK 룸 스프레이', '23%', 35000, '릴렉서', 'LK 룸 스프레이.svg');
INSERT INTO product VALUES (product_seq.nextval, 'HINOK', '제주 편백  필로우 미스트', '35%', 32000, '릴렉서', '제주 편백  필로우 미스트.svg');

-- product 테이블 조회
select * from product;
select * from product where category = '침구세트';

--휴지통 비우기
purge recyclebin;

commit;
----------------------------------------------------------------------------


-- 5. 최종 Pay 테이블 생성 23.11.16 21:58--------------------------------------------------------------------
CREATE TABLE Pay (
pay_id varchar2(50) not null primary key, --시리얼번호or가맹점번호
per_time date, --결제날짜
import_id varchar2(50), --주문번호
per_num varchar2(50), --상품번호
pname varchar2(100), --상품명
pay_amount int, --상품가격
pcount varchar2(50), --결제수량
pbuyer varchar2(50), --구매자 이름
padress varchar2(150) --구매자 주소
);

select * from pay;

--delete pay where pay_id=1;

-- Pay_seq 시퀀스 생성
create sequence Pay_seq
increment by 1
start with 0
maxvalue 9999999
minvalue 0;

-- Pay_pnum_seq 시퀀스 생성
create sequence Pay_pnum_seq
increment by 1
start with 0
maxvalue 9999999
minvalue 0;


--Pay 등록
insert into Pay values(Pay_seq.nextval, sysdate, Pay_pnum_seq.nextval, '4495451', '올바른 대용량 복합식 가습기', 78000, '1', '테스트유저', '서울시 중구 동대문4가 종로빌딩 4차 아파트 1114동 1039호');

insert into Pay values(Pay_seq.nextval, sysdate, Pay_pnum_seq.nextval, '4487352', 'MinaLamp', 78000, '1', 'cho123', '서울 구로구 경인로 557 삼영빌딩 4층 302호');

insert into Pay values(Pay_seq.nextval, sysdate, Pay_pnum_seq.nextval, '4685021', 'Flowerpot VP3', 440000, '1', 'good02', '서울 구로구 신도림로 16 1302동 1103호');

insert into Pay values(Pay_seq.nextval, sysdate, Pay_pnum_seq.nextval, '4756012', '온습도계 기화식 가습기', 89000, '1', 'ksg113', '서울 구로구 신도림로11가길 36 103동 401호');

insert into Pay values(Pay_seq.nextval, sysdate, Pay_pnum_seq.nextval, '4689635', '그릭 스트라이프 세트', 29800, '1', 'jang', '서울 양천구 목동로3길 57 301동 301호');

insert into Pay values(Pay_seq.nextval, sysdate, Pay_pnum_seq.nextval, '4208635', 'Granny pie blanket', 58000, '1', 'kim', '서울 양천구 신정로 293 1008동 1087호');

insert into Pay values(Pay_seq.nextval, sysdate, Pay_pnum_seq.nextval, '4673851', 'MAATILA', 83900, '1', 'kang', '서울 양천구 중앙로43길 14 1430동 1401호');

insert into Pay values(Pay_seq.nextval, sysdate, Pay_pnum_seq.nextval, '4683002', 'The Five Seasons Room Spray', 167000, '1', 'nezj1', '경기 부천시 중동로 64 705동 705호');

insert into Pay values(Pay_seq.nextval, sysdate, Pay_pnum_seq.nextval, '4687854', 'Chim Chim Scent Diffuser', 74000, '1', 'tob58', '인천 부평구 이규보로 79 2동 506호');

commit;
-----------------------------------------------------------------------

----6. question 테이블 생성----------------------------------
CREATE TABLE question (
    qno NUMBER(10,0) NOT NULL,
    type VARCHAR2(50) NOT NULL,
    writer VARCHAR2(25) NOT NULL,
    contactnumber VARCHAR2(25) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    regdate  date   DEFAULT sysdate   NULL
);

ALTER TABLE question ADD CONSTRAINT PK_QUESTION PRIMARY KEY (qno);

-- question_seq 시퀀스 생성

create sequence qna_seq
increment by 1
start with 0
maxvalue 9999999
minvalue 0;

--Q&A 등록
INSERT INTO question (qno, type, writer, contactnumber, content, regdate)
VALUES (30, '결제관련', '김민재', '010-9956-7890', '결제가 잘못된거 같아서 문의드립니다 확인바랍니다~', SYSDATE);

INSERT INTO question (qno, type, writer, contactnumber, content, regdate)
VALUES (31, '배송관련', '황희찬', '010-1256-7890', '잠옷을 주문했는데 배송이 얼마나 걸리는지 알 수 있나요?', SYSDATE);

INSERT INTO question (qno, type, writer, contactnumber, content, regdate)
VALUES (32, '회원가입', '이강인', '010-5456-7890', '회원가입이 잘 된거 맞나요?', SYSDATE);

INSERT INTO question (qno, type, writer, contactnumber, content, regdate)
VALUES (33, '기타문의', '손흥민', '010-5256-7890', '불면증이 너무 심해서 잠들기가 힘듭니다ㅜㅜ', SYSDATE);
select * from question;

commit;

-------7. L_Inquiry 테이블 생성 ----------------------------
CREATE TABLE L_Inquiry (
    ino NUMBER(10,0) NOT NULL,
    writer VARCHAR2(25) NOT NULL,
    tel VARCHAR2(25) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    regdate  date  DEFAULT sysdate   NULL
);

ALTER TABLE L_Inquiry ADD CONSTRAINT PK_L_INQUIRY PRIMARY KEY (ino);

--L_Inquiry 시퀀스 생성
create sequence INQUIRY_SEQ
increment by 1
start with 0
maxvalue 9999999
minvalue 0;

INSERT INTO L_Inquiry (ino, writer, tel, content, regdate) VALUES (INQUIRY_SEQ.nextval, '김민지',  '010-2566-5678', '클리닉 상세정보 받고싶어요', SYSDATE);
INSERT INTO L_Inquiry (ino, writer, tel, content, regdate) VALUES (INQUIRY_SEQ.nextval, '박주희',  '010-1954-1594', '상담받고싶어요. 연락주세요', SYSDATE);
INSERT INTO L_Inquiry (ino, writer, tel, content, regdate) VALUES (INQUIRY_SEQ.nextval, '최수정',  '010-3247-5641', '불면증 고칠 수 있나요?', SYSDATE);
INSERT INTO L_Inquiry (ino, writer, tel, content, regdate) VALUES (INQUIRY_SEQ.nextval, '정수진',  '010-7531-5491', '비용은 얼마일까요?', SYSDATE);
INSERT INTO L_Inquiry (ino, writer, tel, content, regdate) VALUES (INQUIRY_SEQ.nextval, '유재연',  '010-1593-1287', '상담 기간은 어느정도해요?', SYSDATE);
INSERT INTO L_Inquiry (ino, writer, tel, content, regdate) VALUES (INQUIRY_SEQ.nextval, '최지원',  '010-9151-5415', '후기를 볼 수 있을까요?', SYSDATE);
INSERT INTO L_Inquiry (ino, writer, tel, content, regdate) VALUES (INQUIRY_SEQ.nextval, '성수지',  '010-4521-9127', '클리닉 정보를 더 볼 수 없나요? ', SYSDATE);

SELECT * FROM L_Inquiry order by ino desc;
commit;
--------------------------------------------------------------------------------

-------8. event 테이블 팝업 생성-----------------------------------------
CREATE TABLE event (
eventno number(10, 0) not null,
eventcate varchar2(6) not null,
eventtitle varchar2(200) NOT NULL,
eventcontent varchar2(2000) NOT NULL,
eventwriter varchar2(50) NOT NULL,
eventregdate date default sysdate,
CONSTRAINT pk_event PRIMARY KEY(eventno)
);

-- 이벤트 시퀀스 생성
create sequence event_seq
increment by 1
start with 0
maxvalue 9999999
minvalue 0;

INSERT INTO event(eventno, EVENTCATE, EVENTTITLE, EVENTREGDATE, EVENTCONTENT, EVENTWRITER)
VALUES (event_seq.nextval, '유머', '내용이 이어지는 꿈',  sysdate, '한달에 한 번 정도 스토리가 이어지는 꿈을 꾸고 있어요', '사연자');

select * from event;
desc event;

commit;



/////////////////////////////////////////// REACT //////////////////////////////////////

Visual Studio Code 에서 Terminal > New Terminal 클릭 후 powershell 모드가 아닌
Command prompt 모드 실행

Microsoft Windows [Version 10.0.19044.1889]
(c) Microsoft Corporation. All rights reserved.

C:\Users\starh>node
Welcome to Node.js v14.17.6.
Type ".help" for more information.
> .exit

C:\Users\starh>node -v
v14.17.6

C:\Users\starh>npm -v
8.15.0

C:\Users\starh>cd\

C:\>mkdir react_study

C:\>cd react_study

C:\react_study>npm install -g yarn

C:\react_study>npm install -g create-react-app

-----------------------------------------------------------------------
C:\Users\starh\AppData\Roaming\npm 폴더 안에 확인 바랍니다.
-----------------------------------------------------------------------

C:\react_study>create-react-app first_react

C:\react_study>cd first_react

C:\react_study\first_react>npm start

-----------------------------------------------------------------------

Ctrl + C -> Y (Enter 클릭)

-----------------------------------------------------------------------

C:\react_study\first_react>npm run build

C:\react_study\first_react>npm install -g serve

C:\react_study\first_react>serve -s build

-----------------------------------------------------------------------

npm 실행 했을 때와 build 배포 실행 했을 때의 아래 네트워크 리소스 용량 비교 바랍니다.

http://localhost:3000 -> 개발자도구(F12) -> 네트워크 하단 리소스 용량 비교 바랍니다.

-----------------------------------------------------------------------

C드라이브에 build 폴더 내용을 복사해서 넣어줌.

윈도우즈키 + R키 -> inetmgr -> WindowsIIS 웹서버 폴더로 build 폴더 지정함.

http://localhost 또는 http://(본인 아이피) 실행함.

-----------------------------------------------------------------------

React Developer Tools 활용

1. Chrome 확장 프로그램 설치
https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi

2. React 제작 웹 사이트 접속 - 개발자도구(F12) - Components 클릭

--------------------------------------------------------------------------
C:\react_study\first_react>npm install -save react-router-dom@5.3.0

C:\react_study\first_react>npm install axios@0.24.0


/////////////////////////////////////////// SpringMVC //////////////////////////////////////

src > main > webapp > WEB-INF 안에 lib 폴더 만들고 ojdbc6.jar 파일 넣어주기

-----------------------------------------------------------------------
PayDAO 활용을 위해 main > resources 안에 mybatis-config.xml 소스코딩

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE configuration PUBLIC "//mybatis.org//DTD Config 3.0//EN" "http://mybatis.org/dtd/mybatis-3-config.dtd" >
<configuration>

	<typeAliases>
		<!--com.spring.iamport.model.PaymentVO를 인지 약칭은 pay -->
		<typeAlias type="pocsin.work.pay.PayVO" alias="pay"/>
	</typeAliases>
	
	<environments default="development">
		<environment id="development">
			<transactionManager type="JDBC" />
				<dataSource type="POOLED"> <!-- 오라클DB와 붙게끔 설정파일을 짠다. 이 설정을 물고 DAO에 있는 DB연동되어있는 것이 처리된다. -->
				<!-- mybatis-config.xml을 처리하는데 그 DB관련 설정과 엮어져야 하므로 그 엮어져야하는 설정을 지금 짜는것이다. -->
				<!-- 얘를 물고 데이터 처리하는 것 -->
					<property name="driver" value="oracle.jdbc.driver.OracleDriver"/>
					<property name="url" value="jdbc:oracle:thin:@localhost:1521:orcl"/>
					<property name="username" value="pocsin"/>
					<property name="password" value="pocsin"/>
				</dataSource>
		</environment>
	</environments>

	<mappers>
		<mapper resource="pocsin/work/pay/PayMapper.xml"/> <!-- 여기에 SQL쿼리문 작성할것  -->
	</mappers>

</configuration>
-----------------------------------------------------------------------









/////////////////////////////////////////// SpringBoot //////////////////////////////////////

src > main > webapp > WEB-INF 안에 lib 폴더 만들고 ojdbc6.jar 파일 넣어주기
------------------------------------------------

application.properties 소스코딩

server.port = 9008

spring.datasource.driver-class-name=oracle.jdbc.driver.OracleDriver
spring.datasource.url=jdbc:oracle:thin:@localhost:1521:orcl
spring.datasource.username=pocsin 
spring.datasource.password=pocsin
#hikari DBCP auto-commit true 설정
spring.datasource.hikari.auto-commit=true
spring.jpa.database-platform=org.hibernate.dialect.Oracle10gDialect

#스키마 생성(create)
# spring.jpa.hibernate.ddl-auto는 데이터베이스에 구조를 생성하는 DDL(Data Definition Language) 처리 옵션 지정 명령어
# update = 변경된 부분만 update 반영
# validate = Entity와 Table이 정상적으로 매핑되었는지만 확인
# none = 사용하지 않음
# create-drop = create와 같지만 종료 시점에 테이블 DROP 처리
# create = 기존 테이블 삭제 후 다시 생성
#spring.jpa.hibernate.ddl-auto=create
spring.jpa.hibernate.ddl-auto=update
spring.jpa.generate-ddl=false
spring.jpa.show-sql=true
spring.jpa.database=oracle

# 로그 레벨 info 지정
logging.level.org.hibernate=info
# 로그 레벨 debug 지정 : 상세 debug 로그 확인 가능함 
#logging.level.org.hibernate=debug
