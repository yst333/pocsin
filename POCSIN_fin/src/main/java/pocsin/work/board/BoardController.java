package pocsin.work.board;

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
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	private BoardService boardservice;

	// 게시글 등록
	@GetMapping("/register")
	public void register() { //void -> string to change!
		//Request method 'GET' not supported error!!
	}
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("register(등록) : " + board);
		
		boardservice.register(board);
		rttr.addFlashAttribute("result", board.getBno());		
		return "redirect:/board/list";
	}
	
	// 게시글 페이징 처리 list
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("list : "+cri);
		model.addAttribute("list", boardservice.getList(cri));
		int total = boardservice.getTotal(cri);
		
		log.info("total"+total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	// 게시글 조회
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("/get 조회 처리");
		log.info("/get or modify 조회 처리");
		model.addAttribute("board", boardservice.get(bno));
	}
	
	// 게시글 수정
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		   log.info("modify: 수정 처리" + board);
		   
		   if (boardservice.modify(board)) {
			   rttr.addFlashAttribute("result","success");
		   }
		   
		   rttr.addAttribute("pageNum", cri.getPageNum());
		   rttr.addAttribute("amount", cri.getAmount());	
		   rttr.addAttribute("type", cri.getType());	
		   rttr.addAttribute("keyword", cri.getKeyword());		
		  		   
		   return "redirect:/board/list";
	   }
	   
	// 게시글 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove: 삭제 처리 " + bno);
		
		if(boardservice.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());	
		rttr.addAttribute("type", cri.getType());	
		rttr.addAttribute("keyword", cri.getKeyword());
	
		return "redirect:/board/list";
	}	
}
