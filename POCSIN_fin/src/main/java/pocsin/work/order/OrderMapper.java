package pocsin.work.order;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pocsin.work.product.ProductVO;
import pocsin.work.user.MemberVO;

public interface OrderMapper {
	
//	SELECT * from tbl_board WHERE bno > 0;
//	@Select("SELECT * from tbl_board WHERE bno > 0") // 마이바티스 애노테이션 활용 DB정보 SELECT 구문
//	public List<OrderVO> getList();
	
//	public OrderVO read(String id);

	// insert만 처리되고 생성된 PK 값을 알 필요가 없는 경우에 활용하는 insert() 추상 메서드 선언
	public void insert(OrderVO order);
	
	public List<OrderVO> getList();
	
	public OrderVO order(OrderVO order);

}
