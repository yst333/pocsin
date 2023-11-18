package pocsin.work.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BoardMapper {

	public List<BoardVO> getList();
	
	//Criteria 타입을 파라미터로 사용하는 getListWithPaging()
	public List<BoardVO> getListWithPaging(Criteria cri);

//	public void insert(BoardVO board);

	public void insertSelectKey(BoardVO board);

	public BoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(BoardVO board);
	
	
	//전체 데이터의 개수를 반환해주는 getTotalCount()메서드 정의
	public int getTotalCount(Criteria cri);

    // 댓글
	public void updateReplyCnt(@Param("bno")Long bno, @Param("amount")int amount);
	
	// 조회수
//	public void updateViewCnt(@Param("bno")Long bno, @Param("amount")int amount);
	
}
