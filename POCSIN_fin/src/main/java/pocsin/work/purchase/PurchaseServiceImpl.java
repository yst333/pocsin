package pocsin.work.purchase;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
@Primary
public class PurchaseServiceImpl implements PurchaseService{
	
	private PurchaseMapper mapper;

	//글 상세 조회
	@Override
	public PurchaseVO get() {
		log.info("get 특정 공지글 내용을 조회!");
		return mapper.read();
	}

	


}
