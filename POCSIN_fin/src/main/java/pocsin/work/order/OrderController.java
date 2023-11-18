package pocsin.work.order;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;
import pocsin.work.board.Criteria;
import pocsin.work.user.MemberVO;

@Controller
@Log4j
@RequestMapping("/order/*")

public class OrderController {

	private OrderService orderService;

//	@GetMapping("/list")
//	public void list(Model model) {
//		log.info("list 글 목록 조회를 처리합니다!");
//		model.addAttribute("list", service.getList());
//	}
	
	//배송지입력 조회처리
	@GetMapping("/register")
	public void order(Model model) {
		log.info("/register 조회 처리");
//		model.addAttribute("order", service.getList());
	}

	@PostMapping("/register")
	public String register(OrderVO order) {
		log.info("register(등록) : " + order);
		orderService.order(order);
		
		return "/work/product/productDetail";
	}

//	
//	 @GetMapping("/paygo")
//		public void order(@RequestParam("per_num") String per_num, Model model) {
//		 	model.addAttribute("product", orderService.order(per_num));
//			log.info("/paygo");
//		}



}
