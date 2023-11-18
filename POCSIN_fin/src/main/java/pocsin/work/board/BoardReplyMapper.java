package pocsin.work.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BoardReplyMapper {
	
	public int insert(BoardReplyVO vo);

	//특정 댓글 상세 조회
	public BoardReplyVO read(Long rno); 
	
	//특정 댓글 삭제 기능 정의
	public int delete(Long rno); 
	
	//댓글 수정
	public int update(BoardReplyVO reply); 
	
	//특정 게시글의 댓글 조회시 댓글이 많은 리스트형 댓글들에 대해 페이징 처리.
	public List<BoardReplyVO> getListWithPaging(
			@Param("cri") Criteria cri, //pageNum ,amount 정보가 넘어간다. 
			@Param("bno") Long bno);
	
	
	//특정 게시글의 댓글 숫자 파악 기능 구현.
	public int getCountByBno(Long bno);
}
