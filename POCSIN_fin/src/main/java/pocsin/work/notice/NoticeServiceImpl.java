package pocsin.work.notice;

import java.util.List;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
@Primary
public class NoticeServiceImpl implements NoticeService{
	
	private NoticeMapper mapper;
	
	@Override
	public List<NoticeVO> getList() {
		log.info("getList... 목록 리스트 정보!");
		return mapper.getList();
	}
	
	
	//글 등록
	@Override
	public void register(NoticeVO notice) {
		log.info("register 공지글 등록 서비스 실행!" + notice);
		mapper.insert(notice);
	}

	//글 상세 조회
	@Override
	public NoticeVO get(Long nbno) {
		log.info("get 특정 공지글 내용을 조회!" + nbno);
		return mapper.read(nbno);
	}

	//글 수정
	@Override
	public boolean modify(NoticeVO notice) {
		log.info("modify 공지글을 수정 !" + notice);
		return mapper.update(notice) == 1;
	}

	//글 삭제
	@Override
	public boolean remove(Long nbno) {
		log.info("remove 공지글을 삭제!" + nbno);
		return mapper.delete(nbno) == 1;
	}


}
