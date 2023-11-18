package pocsin.work.board;

import java.util.Date;

import lombok.Data;

@Data
public class BoardReplyVO {
	
	private Long rno; //댓글 번호rno 필드 선언
	private Long bno; //게시글 번호bno wfflabboard 참조
	
	private String reply; //댓글 필드reply 선언
	private String replyer; //댓글 등록자replyer 필드 선언
	
	private Date replyDate; //댓글 등록일replyDate 필드선언
	private Date updateDate; //댓글 갱신일/수정일updateDate 필드 선언
}
