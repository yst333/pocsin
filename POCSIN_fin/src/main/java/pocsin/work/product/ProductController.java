package pocsin.work.product;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import pocsin.work.product.service.ProductService;

@Controller
@AllArgsConstructor
@RequestMapping("/work/product/*")
@Log4j
public class ProductController {
	
	 private ProductService productService; //스프링에서 만든 서비스 객체를 연결시킴
	    
	 // 상품 리스트 조회
	 @GetMapping("/product")
	 public void select(Model model) {
		 log.info("상품 조회 실행!");
		 model.addAttribute("list1",productService.select1());
		 model.addAttribute("list2",productService.select2());
		 model.addAttribute("list3",productService.select3());
		 model.addAttribute("list4",productService.select4());
		 model.addAttribute("list5",productService.select5());
		 
	 }
	 @PostMapping("/work/product/productDetail")
	 public void cancle() {
		 
	 }
	 
	 // 상품 상세 페이지 조회
	 @GetMapping("/productDetail")
	 public void read(@RequestParam("per_num") String per_num, Model model) {
		 model.addAttribute("product", productService.read(per_num));
	 }
	 
	 // 배송지 입력 등록
	 @GetMapping("/register")
		public void order(@RequestParam("per_num") String per_num, Model model) {
		 	model.addAttribute("product", productService.read(per_num));
			log.info("/register 조회 처리");
		}
}
