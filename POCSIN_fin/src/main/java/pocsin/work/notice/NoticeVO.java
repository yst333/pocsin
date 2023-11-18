package pocsin.work.notice;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {

	private Long nbno; // 게시글 번호 필드 선언	
	private String title; // 게시글 제목 필드 선언
	private String content; // 게시글 내용 필드 선언
	private String admin; // 게시글 작성자 필드 선언
	private Date regdate; // 게시글 등록일자 필드 선언

}
