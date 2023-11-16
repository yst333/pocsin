show user

--기존  테이블 시작 --------------------------------
-- Board 테이블 생성
CREATE TABLE Board (
bno number(10, 0) NULL,
id varchar2(20) NOT NULL,
title varchar2(200) NOT NULL,
content varchar2(2000) NOT NULL,
--category VARCHAR2(50) NOT NULL,
writer varchar2(50) NOT NULL,
viewcnt number,
replycnt number,
regdate date default sysdate,
updatedate date default sysdate,
CONSTRAINT pk_board PRIMARY KEY(bno)
);

--alter table board add constraint pk_board primary key(bno);

-- Board_seq 시퀀스 생성
create sequence Board_seq
increment by 1
start with 0
maxvalue 9999999
minvalue 0;

-- Board_reply 테이블 생성
CREATE TABLE Board_reply (
rno number(10, 0) NULL,
bno number(10, 0) NOT NULL,
reply varchar2(1000) NOT NULL,
replyer varchar2(50) NOT NULL,
regdate date default sysdate,
updatedate date default sysdate
);

-- Board_reply_seq 시퀀스 생성
create sequence Board_reply_seq
increment by 1
start with 0
maxvalue 9999999
minvalue 0;

INSERT INTO board(bno, id, title, content, writer) VALUES(board_seq.nextval, 'jang', '새벽에 자주깨고 깊이 못자는 폭꿈러들 이 운동 해봐!! ', '전체 내용1', 'jangnara');
INSERT INTO board(bno, id, title, content, writer) VALUES(board_seq.nextval, 'kang', '헤어진지 얼마안된 폭꿈러있어? 초성 맞춰주라..', '전체 내용2', 'kangjihee');
INSERT INTO board(bno, id, title, content, writer) VALUES(board_seq.nextval, 'kim', '요즘 등산 자주했더니 효과 진짜 좋은듯!', '전체 내용3', 'kimheesun');
INSERT INTO board (bno, id, title, content, writer) VALUES (board_seq.nextval, 'ksy', '수면일기 쓰는 사람 있어?ㅠㅠ 이거 이렇게 쓰는거 맞아..', '전체 내용1', '기성용');
INSERT INTO board (bno, id, title, content, writer) VALUES (board_seq.nextval, 'lee', '취뽀 하자마자 불면증 나았음 취준생들 불안해 하지말고..', '전체 내용2', 'by');
INSERT INTO board (bno, id, title, content, writer) VALUES (board_seq.nextval, 'kim', '도시락 싸려고 일찍 일어나다보니 오후에 좀 졸립다 이거..', '전체 내용3', 'kimheesun');
INSERT INTO board (bno, id, title, content, writer) VALUES (board_seq.nextval, 'jang', '잘 시간엔 잠이 안오는데 왜 점심만 먹으면 졸릴까 병원가..', '전체 내용1', 'jangnara');
INSERT INTO board (bno, id, title, content, writer) VALUES (board_seq.nextval, 'kang', '광고 절대아님 영수증 있음 디스크있는 폭꿈러들 강추 드..', '전체 내용2', 'kangjihee');
INSERT INTO board (bno, id, title, content, writer) VALUES (board_seq.nextval, 'cho', '수영해도 잠 못잤는데 매일 만보 걸으니까 기분도 좋고 뭔..', '전체 내용3', 'cristal');


COMMIT;

rollback;

-- bno 칼럼 값을 역순으로 정렬
select * from board order by bno desc;

-- 재귀 복사를 통해서 데이터의 개수를 늘린다. 반복해서 여러번 실행
INSERT INTO board (bno, id, title, content, writer) (select board_seq.nextval, id, title, content, writer from board);

select count(*) from board;
--기존 테이블 여기까지--------------------------------