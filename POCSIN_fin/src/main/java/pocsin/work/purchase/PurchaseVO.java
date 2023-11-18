package pocsin.work.purchase;

import java.util.Date;

import lombok.Data;

@Data
public class PurchaseVO {

	String pay_id; //가맹점번호
	Date per_time; //주문일자
	String import_id; //주문번호 
	String per_num; //상품번호 
	String pname; //상품명
	int pay_amount; //상품가격
	String pcount; //결제수량
	String pbuyer; //구매자이름
	String padress; //구매자주소

}




