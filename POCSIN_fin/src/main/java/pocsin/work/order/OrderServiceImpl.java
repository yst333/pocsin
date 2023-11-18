package pocsin.work.order;

import java.util.List;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import pocsin.work.pay.PayVO;

@Log4j
@Service  // 계층 구조상 주로 비즈니스 영역을 담당하는 객체임을 표시하기 위해 사용함.
@AllArgsConstructor
@Primary
public class OrderServiceImpl implements OrderService {
	// @Setter(onMethod_ = @Autowired)
	// Spring 4.3 이상에서는 단일 파라미터를 받는 생성자의 경우 자동 처리
	// (파라미터를 자동으로 주입할 수 있음. 즉, 위에 @Setter 구문 안써도 됨)
	private OrderMapper mapper;

	@Override
	public void register(OrderVO order) {
		mapper.insert(order);
	}

	@Override
	public List<OrderVO> getList() {
		log.info("getList... 목록 리스트 정보를 보여줍니다!");
		return mapper.getList();
	}

	@Override
	public void order(OrderVO order) {
		mapper.order(order);
	}


	

}
