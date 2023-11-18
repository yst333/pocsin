package pocsin.work.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
@AllArgsConstructor
public class MemberController {

	private MemberService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list 글 목록 조회를 처리합니다!");
		model.addAttribute("list", service.getList());
	}
	
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register") 
	public String register(MemberVO member, RedirectAttributes rttr) {
		log.info("register(등록) : " + member);
		service.register(member);
		rttr.addFlashAttribute("result", member.getId());		
		return "/user/login";
	}
	
	
//	@GetMapping({"/get", "/modify"})
//	public void get(@RequestParam("id") String id, Model model) {
//		log.info("/get 조회 처리");
//		log.info("/get or modify 조회 처리");
//		model.addAttribute("member", service.get(id));
//	}
//	
	@GetMapping("/get")
	public void get(@RequestParam("id") String id, Model model) {
		log.info("/get 조회 처리");
		model.addAttribute("member", service.get(id));
	}
//	

//	@PostMapping("/modify")
//	public String modify(MemberVO member, RedirectAttributes rttr) {
//		log.info("modify: 수정 처리 " + member);
//		if(service.modify(member)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//
//		return "redirect:/board/modify";
//	}
	
	
//	@GetMapping("modify")
//	public void modify(@RequestParam("id") String id, Model model) {
//		model.addAttribute("member", service.get(id));
//	}
//	
//	@PostMapping("/modify")
//	public String modify(MemberVO member, RedirectAttributes rttr) {
//		log.info("modify: 수정 처리 " + member);
//		if(service.modify(member)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//
//		return "redirect:/user/modify";
//	}
	
    @GetMapping("/modify")
    public void modify(@ModelAttribute("loginMember") MemberVO loginMember, Model model) {
        // loginMember을 사용하여 세션에서 정보를 가져옴
        model.addAttribute("member", service.get(loginMember.getId()));
    }

    @PostMapping("/modify")
    public String modify(@ModelAttribute("loginMember") MemberVO loginMember, MemberVO member, RedirectAttributes rttr) {
        log.info("modify: 수정 처리 " + member);
        // 세션에서 가져온 사용자 정보로 수정 로직 수행
        if (service.modify(member)) {
            rttr.addFlashAttribute("result", "success");
        }
        return "/main";
    }
	
	
    @GetMapping("/remove")
    public void remove() {
    }
	
	@PostMapping("/remove")
	public String remove(@RequestParam("id") String id, RedirectAttributes rttr) {
		log.info("remove: 삭제 처리 " + id);
		if(service.remove(id)) {
			rttr.addFlashAttribute("result", "success");
		}else {
			rttr.addFlashAttribute("result", "false");
			
		}
		return "redirect:/user/login";
	}
	
	
	// 로그인
	@GetMapping("/login")
	public void login() {
		
	}
	
	@PostMapping("/login")
	public String login(@RequestParam("id")String id, @RequestParam("pw") String pw, HttpServletRequest req) throws Exception {
		MemberVO login = service.login(id, pw);
		
		if(login != null) {
			HttpSession session = req.getSession();
			
			session.setAttribute("member", login);
			session.setAttribute("name", login.getName());
			session.setAttribute("id", login.getId());
			session.setAttribute("pw", login.getPw());
			session.setAttribute("email", login.getEmail());
			session.setAttribute("phoneNum", login.getPhoneNum());
			session.setAttribute("postNum", login.getPostNum());
			session.setAttribute("address", login.getAddress());
			log.info(login);
		}
		return "/main";
		
	}
	
//	@PostMapping("/login")
//	public String Login(MemberVO vo, HttpSession session) {
//		
//		MemberVO Login = service.Login(vo);
//		
//		if(Login!=null) {
//			session.setAttribute("LoginVo", Login);
//		}
//		
//		return "redirect:/main";
//	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		return "redirect:/main";
	}

}
