package pocsin.work.notice;

import java.util.List;

public interface NoticeMapper {

	//글 목록조회 List로 감싸서 getList
	public List<NoticeVO> getList();

	//글 등록 insert만 처리 (pk값 알아내는 insertSelectKey() 사용X)
	public void insert(NoticeVO notice);

	// read(select) 처리를 위한 read() 추상 메서드 정의
	public NoticeVO read(Long nbno);
	
	//글 삭제 delete 처리를 위한 delete() 추상 메서드 정의
	public int delete(Long nbno);

	//글 수정 update 처리를 위한 update() 추상 메서드 정의
	public int update(NoticeVO notice);

	// Criteria 타입을 파라미터로 사용하는 getListWithPaging()
//	public List<NoticeVO> getListWithPaging(Criteria cri);

	// 전체 데이터의 개수를 반환해주는 getTotalCount()메서드 정의
//	public int getTotalCount(Criteria cri);

}
