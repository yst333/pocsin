package pocsin.work.notice;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/notice/*")
@AllArgsConstructor
public class NoticeController {
	
	private NoticeService service;
	
	//글 등록
	@GetMapping("/register")
	public void register() { 
		
	}
	
	@PostMapping("/register")
	public String register(NoticeVO notice, RedirectAttributes rttr) {
		log.info("register(등록) : " + notice);
		
		service.register(notice);
		rttr.addFlashAttribute("result", notice.getNbno());		
		return "redirect:/notice/list";
	}
	
	//글목록 조회
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list 글목록 조회처리!");
		model.addAttribute("list", service.getList());
	}
	
	//글 상세조회
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("nbno") Long nbno, Model model) {
		
		log.info("/get 조회 처리");
		NoticeVO noti = service.get(nbno);
		model.addAttribute("notice", service.get(nbno));

	}
	
	//글 수정
	@PostMapping("/modify")
	public String modify(NoticeVO notice, RedirectAttributes rttr) {
		   log.info("modify: 수정 처리" + notice);
		   
		   if (service.modify(notice)) {
			   rttr.addFlashAttribute("result","success");
		   }
	   
		   return "redirect:/notice/list";
	   }
	
	
	//글 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("nbno") Long nbno, RedirectAttributes rttr) {
		log.info("remove: 삭제 처리 " + nbno);
		if(service.remove(nbno)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/notice/list";
	}
	

}
