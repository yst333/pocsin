package pocsin.work.product.service;

import java.util.List;

import pocsin.work.product.ProductVO;

public interface ProductService {
	
	// 제품 리스트 페이지
	public List<ProductVO> select1();
	
	public List<ProductVO> select2();
	
	public List<ProductVO> select3();
	
	public List<ProductVO> select4();
	
	public List<ProductVO> select5();
	
	// 제품 상세 페이지
	public ProductVO read(String per_num);
	
	// 제품상세 - 배송지 입력 페이지
//	public ProductVO order(String per_num);
}
