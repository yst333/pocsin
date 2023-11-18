package pocsin.work.pay;

import java.util.Date;

import lombok.Data;

@Data
public class PayVO {
	
	String imp_uid; //가맹점 번호
	Date paid_at; //결제 날짜
	String merchant_uid; //주문 번호
	String apply_num; //상품번호
	String pname; //상품명
	int paid_amount; //상품가격
	String pcount; //결제수량
	String pbuyer; //구매자 이름
	String padress; //구매자 주소
	
	
}
