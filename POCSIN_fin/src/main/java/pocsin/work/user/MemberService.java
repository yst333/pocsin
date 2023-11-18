package pocsin.work.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MemberService {
	
	public void register(MemberVO member);

	public boolean modify(MemberVO member);
	
	public boolean remove(String id);
	
	public MemberVO get(String id);
	
	public List<MemberVO> getList();
	
	// 로그인
	public MemberVO login(@Param("id") String id, @Param("pw") String pw);

}
