package pocsin.work.board;

import java.util.List;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service  // 계층 구조상 주로 비즈니스 영역을 담당하는 객체임을 표시하기 위해 사용함.
@AllArgsConstructor
@Primary
public class BoardServiceImpl implements BoardService {
	
	private BoardMapper boardmapper;

	// 게시글 등록
	@Override
	public void register(BoardVO board) {
		log.info("register 게시글등록 서비스 실행!" + board);
		boardmapper.insertSelectKey(board);
	}
		
	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("get List with criteria: "+cri);
		return boardmapper.getListWithPaging(cri);
	}
	
	@Override
	public BoardVO get(Long bno) {
		log.info("get... 특정 글 내용을 조회 합니다!" + bno);
		return boardmapper.read(bno);
	}	
	
	
	// 게시글 수정
	@Override
	public boolean modify(BoardVO board) {
		log.info("modify... 게시글을 수정 처리합니다!" + board);
		return boardmapper.update(board) == 1;
	}

	// 게시글 삭제
	@Override
	public boolean remove(Long bno) {
		log.info("remove... 게시글을 삭제 처리 합니다!" + bno);
		// 정상적으로 삭제가 이루어지면 1이라는 값이 반환되기 때문에
		// '==' 연산자를 이용해서 true/false를 처리할 수 있습니다.
		return boardmapper.delete(bno) == 1;
	}


	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return boardmapper.getTotalCount(cri);
	}
	
}


