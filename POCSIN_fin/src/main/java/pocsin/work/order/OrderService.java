package pocsin.work.order;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pocsin.work.product.ProductVO;
import pocsin.work.user.MemberVO;

public interface OrderService {
	
	//배송지입력 조회처리
	public void register(OrderVO order);
	
	
	public List<OrderVO> getList();
	
	// 배송지 - 결제 페이지 
	public void order(OrderVO order);
}
