package pocsin.work.notice;

import java.util.List;

public interface NoticeService {
	
		//목록조회 
		public List<NoticeVO> getList();
		// register = insert
		public void register(NoticeVO notice);
		// get = read 상세보기
		public NoticeVO get(Long nbno);
		// modify = update
		public boolean modify(NoticeVO notice);
		// remove = delete
		public boolean remove(Long nbno);
		
		
		//페이징 처리가 적용되는 getList() 메서드 선언
		//public List<NoticeVO> getList(Criteria cri);
		
		//전체 데이터스를 구해주는 getTotal()메서드 선언
		//public int getTotal(Criteria cri);

}
