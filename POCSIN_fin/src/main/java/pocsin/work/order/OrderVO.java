package pocsin.work.order;



import lombok.Data;

@Data
public class OrderVO {
	private String pname;
	private String per_num;
	private int pay_amount;
	private String pbuyer;
	private String padress;
}