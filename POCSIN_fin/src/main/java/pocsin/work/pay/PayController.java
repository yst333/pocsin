package pocsin.work.pay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController

public class PayController {

	@Autowired
	private PayService service;
	
	@RequestMapping(value="/pay/paypg") //결제하는 애 ? PG창
	public void payDone(@RequestBody PayVO vo) { //리턴필요X 카드정보만 DB에 넘김
		service.insertPaySuccess(vo);
	}
	
	@RequestMapping(value="/pay/paygo")
	public ModelAndView PayPage() {
		return new ModelAndView("/pay/paygo");
	}


}
