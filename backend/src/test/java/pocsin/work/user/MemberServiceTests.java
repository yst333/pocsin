package pocsin.work.user;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private MemberService service;

	// 등록(register) 작업의 기능 구현과 테스트
	@Test
	public void testRegister() {
		MemberVO member = new MemberVO();
		member.setId("shm");
		member.setPw("shm");
		member.setName("손흥민");
		member.setEmail("shm@naver.com");
		member.setPhoneNum("010-7777-7777");
		
		service.register(member);
		log.info("새로 등록된 회원 : " + member.getId());
	}

	// 글목록(리스트) 작업의 기능 구현과 테스트
	@Test
	public void testGetList() {
		// Page300 소스 코딩할 때, 아래 1줄 소스는 주석 처리해 줍니다.
//		service.getList().forEach(board -> log.info(board));
		// Page300 : 페이징 매개변수가 적용된 getList() 메서드 테스트를 합니다.
		service.getList().forEach(member -> log.info(member));
	}
	
	@Test
	public void testGet() {
		log.info(service.get("ksy"));
	}
	
	// 글 수정 기능 구현과 테스트
	@Test
	public void testModify() {
		MemberVO member = service.get("ksy");
		if (member == null) {
			return;
		}
		member.setId("ksy");
		member.setPw("111");
		member.setEmail("ksy@gmail.com");
		member.setPhoneNum("010-1111-9999");
		member.setEmail("ksy@daum.net");
		log.info("MODIFY RESULT : " + service.modify(member));
	}

	// 글 삭제 기능 구현과 테스트
	@Test
	public void testRemove() {
		// 게시물 번호의 존재 여부를 확인하고 테스트를 진행 처리함.
		// testDelete()의 경우, 해당 게시물이 존재할 때 true를 반환하는 것을 확인합니다.
		log.info("REMOVE RESULT : " + service.remove("ksy"));
	}

}
