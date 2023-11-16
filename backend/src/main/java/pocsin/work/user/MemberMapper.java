package pocsin.work.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MemberMapper {
	
//	SELECT * from tbl_board WHERE bno > 0;
//	@Select("SELECT * from tbl_board WHERE bno > 0") // 마이바티스 애노테이션 활용 DB정보 SELECT 구문
	public List<MemberVO> getList();
	
	public MemberVO read(String id);

	// insert만 처리되고 생성된 PK 값을 알 필요가 없는 경우에 활용하는 insert() 추상 메서드 선언
	public void insert(MemberVO member);
	
	// delete 처리를 위한 delete() 추상 메서드 정의
	public int delete(String id);
	
	// update 처리 : 게시물의 업데이트는 제목, 내용, 작성자를 수정 처리 합니다.
	// 업데이트할 때는 최종 수정 시간을 데이터베이스 내 현재 시간으로 수정 처리 합니다.
	// update는 delete와 마찬가지로 "몇 개의 데이터가 수정되었는가"를 처리할 수 있도록
	// int 타입으로 메서드를 설계합니다.
	// update 처리를 위한 update() 추상 메서드 정의
	public int update(MemberVO member);
	
	// 로그인
	public MemberVO login(@Param("id") String id, @Param("pw") String pw);
//	public MemberVO MemberLogin(MemberVO vo);

}
