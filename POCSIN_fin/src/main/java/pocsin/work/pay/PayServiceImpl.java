package pocsin.work.pay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;


@Service("PayService")
@Primary
public class PayServiceImpl implements PayService{

	@Autowired
	private PayDAO dao;
	
	@Override
	public void insertPaySuccess(PayVO vo) {
		dao.insertPaySuccess(vo); //dao의 insert기능을 할것이다
		
	}


}
