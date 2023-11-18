package pocsin.work.board;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class BoardReplyPageDTO {

	private int replyCnt;
	private List<BoardReplyVO> list;
	
	private int viewCnt;
	
}
