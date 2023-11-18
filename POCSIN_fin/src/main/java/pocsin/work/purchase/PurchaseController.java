package pocsin.work.purchase;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/purchase/*")
@AllArgsConstructor
public class PurchaseController {
	
	private PurchaseService service;

	//글 상세조회
	@GetMapping({"/get", "/modify"})
	public void get(Model model) {
		
		PurchaseVO purchase = service.get();
		log.info("/get 조회 처리" + purchase);
		model.addAttribute("purchase", service.get());
		
	}

}
