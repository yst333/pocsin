package pocsin.work.product.mapper;

import java.util.List;

import pocsin.work.product.ProductVO;

public interface ProductMapper {
	
	public List<ProductVO> select1();
	
	public List<ProductVO> select2();
	
	public List<ProductVO> select3();
	
	public List<ProductVO> select4();
	
	public List<ProductVO> select5();
	
	public ProductVO read(String per_num);

	public ProductVO order(String per_num);

}
