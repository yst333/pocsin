package pocsin.work.pay;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import lombok.extern.log4j.Log4j;

@Log4j
@Repository
public class PayDAO {
	private static SqlSessionFactory sqlMapper;

	private static SqlSessionFactory getInstance() {
		if (sqlMapper == null) {
			String resource = "mybatis-config.xml";
			Reader reader;
			try {
				reader = Resources.getResourceAsReader(resource);
				sqlMapper = new SqlSessionFactoryBuilder().build(reader);
				reader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return sqlMapper;
	}

	public void insertPaySuccess(PayVO vo) {
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		session.insert("pay.insertPaySuccess", vo);
		session.commit();
	}
	
}
