package pocsin.work.user;

import java.util.List;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service  // 계층 구조상 주로 비즈니스 영역을 담당하는 객체임을 표시하기 위해 사용함.
@AllArgsConstructor
@Primary
public class MemberServiceImpl implements MemberService {
	// @Setter(onMethod_ = @Autowired)
	// Spring 4.3 이상에서는 단일 파라미터를 받는 생성자의 경우 자동 처리
	// (파라미터를 자동으로 주입할 수 있음. 즉, 위에 @Setter 구문 안써도 됨)
	private MemberMapper mapper;
	
	@Override
	public boolean modify(MemberVO member) {
		log.info("modify... 회워정보를 수정 처리 합니다!" + member);
		// 정상적으로 수정이 이루어지면 1이라는 값이 반환되기 때문에
		// '==' 연산자를 이용해서 true/false를 처리할 수 있습니다.
		return mapper.update(member) == 1;
	}

	@Override
	public boolean remove(String id) {
		log.info("remove... 회원탈퇴 처리 합니다!" + id);
		// 정상적으로 삭제가 이루어지면 1이라는 값이 반환되기 때문에
		// '==' 연산자를 이용해서 true/false를 처리할 수 있습니다.
		return mapper.delete(id) == 1;
	}

	@Override
	public List<MemberVO> getList() {
		log.info("getList... 목록 리스트 정보를 보여줍니다!");
		return mapper.getList();
	}

	@Override
	public void register(MemberVO member) {
		log.info("register 게시글등록 서비스 실행!" + member);
		mapper.insert(member);
	}

	@Override
	public MemberVO get(String id) {
		log.info("회원정보조회" + id);
		return mapper.read(id);
	}
	
	// 로그인
	@Override
	public MemberVO login(String id, String pw) {
		log.info("login name : "+mapper.login(id, pw));
		return mapper.login(id, pw);
	}
	
//	@Override
//	public MemberVO Login(MemberVO vo) {
//	MemberVO VO = mapper.MemberLogin(vo);
//	
//	return VO;	
//	}

}
