package java.com.lifeeditor.user_spec.model;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class user_specService {

	private user_specDAO_interface dao;

	public user_specService() {
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config2-JndiObjectFactoryBean.xml");
		dao =(user_specDAO_interface) context.getBean("user_specDAO");
	}

	public user_specVO addUser(String account, String pswd, String lastName,String firstName,
			String gender,java.sql.Date birthdate,String email,	String address,String phone, 
			Blob picture) {
		
		user_specVO user_specVO = new user_specVO();
		
		user_specVO.setAccount(account);
		user_specVO.setPswd(pswd);
		user_specVO.setLastName(lastName);
		user_specVO.setFirstName(firstName);
		user_specVO.setGender(gender);
		user_specVO.setBirthdate(birthdate);
		user_specVO.setEmail(email);
		user_specVO.setAddress(address);
		user_specVO.setPhone(phone);
		user_specVO.setGenkiBarTol(0);
		user_specVO.setLevel(0);
		user_specVO.setPicture(picture);
		user_specVO.setRegTime(new Timestamp(System.currentTimeMillis()));
		user_specVO.setHotMan(0);
		user_specVO.setSuspendType(0);
		

		dao.insert(user_specVO);

		return user_specVO;
	}

	public user_specVO updateUser(String account, String pswd, String lastName,String firstName,
			String gender,java.sql.Date birthdate,String email,	String address,String phone, 
			Blob picture) {
		
		user_specVO user_specVO = new user_specVO();
		
		user_specVO.setAccount(account);
		user_specVO.setPswd(pswd);
		user_specVO.setLastName(lastName);
		user_specVO.setFirstName(firstName);
		user_specVO.setGender(gender);
		user_specVO.setBirthdate(birthdate);
		user_specVO.setEmail(email);
		user_specVO.setAddress(address);
		user_specVO.setPhone(phone);		
		user_specVO.setPicture(picture);

		dao.update(user_specVO);

		return user_specVO;
	}
	
	public user_specVO getOneUser(Integer userID) {
		return dao.findByPrimaryKey(userID);
	}

	public List<user_specVO> getAll() {
		return dao.getAll();
	}
	
	public List<user_specVO> getAllByHotMan() {
		return dao.getAllByHotMan();
	}
}
