package pocsin.work.user;

import pocsin.work.user.MemberVO;

import lombok.Data;

@Data
public class MemberVO {

	private String id;
	private String pw;
	private String name;
	private String email;
	private String phoneNum;
	private String postNum;
	private String address;

}