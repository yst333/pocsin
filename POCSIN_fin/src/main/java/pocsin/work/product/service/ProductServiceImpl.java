package pocsin.work.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import pocsin.work.product.ProductVO;
import pocsin.work.product.mapper.ProductMapper;

@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductMapper mapper;
	
	@Override
	public List<ProductVO> select1() {
		return mapper.select1();
	}
	
	@Override
	public List<ProductVO> select2() {
		return mapper.select2();
		
	}

	@Override
	public List<ProductVO> select3() {
		return mapper.select3();
	}

	@Override
	public List<ProductVO> select4() {
		return mapper.select4();
	}

	@Override
	public List<ProductVO> select5() {
		return mapper.select5();
	}

	@Override
	public ProductVO read(String per_num) {
		return mapper.read(per_num);
	}

//	@Override
//	public ProductVO order(String per_num) {
//		return mapper.order(per_num);
//	}

	
}
