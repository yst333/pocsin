package pocsin.work.board;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

	private Long bno; // 게시글 번호 필드 선언
	private String id; // 외래키 id 필드 선언
	private String title; // 게시글 제목 필드 선언
	private String content; // 게시글 내용 필드 선언
	private String writer; // 게시글 작성자 필드 선언
	private Date regdate; // 게시글 등록일자 필드 선언
	private Date updateDate; // 게시글 수정일자(갱신일자) 필드 선언
	
	private int replyCnt; //게시글의 댓글 숫자(댓글 수) 필드 선언
	private int viewCnt; //게시글의 조회 숫자(조회 수) 필드 선언

}
