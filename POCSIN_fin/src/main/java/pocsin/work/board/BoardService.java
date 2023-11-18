package pocsin.work.board;

import java.util.List;

public interface BoardService {

	// register = insert
	public void register(BoardVO board);
	
	// get = 상세보기
	public BoardVO get(Long board);
	
	// modify = update
	public boolean modify(BoardVO board);
	
	// remove = delete
	public boolean remove(Long bno);
	
	// Page299 : 페이징 처리가 적용되는 getList() 메서드 선언
	public List<BoardVO> getList(Criteria cri);
	
	// 323p : 전체 데이터스를 구해주는 getTotal()메서드 선언
	public int getTotal(Criteria cri);
	
	// 조회수 올리기
	
}

