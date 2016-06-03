package com.lifeeditor.service;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.lifeeditor.model.user_spec.user_specDAO;
import com.lifeeditor.model.user_spec.user_specDAO_interface;
import com.lifeeditor.model.user_spec.user_specVO;


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
		user_specVO.setLevel(1);
		user_specVO.setPicture(picture);
		user_specVO.setRegTime(new Timestamp(System.currentTimeMillis()));
		user_specVO.setHotMan(0);
		user_specVO.setSuspendType(0);
		

		dao.insert(user_specVO);

		return user_specVO;
	}

	public user_specVO updateUser(Integer userID,String account, String pswd, String lastName,String firstName,
			String gender,java.sql.Date birthdate,String email,	String address,String phone,Integer genkiBarTol, 
			Integer level,Blob picture,Timestamp regTime,Integer hotMan,Integer suspendType) {
		
		user_specVO user_specVO = new user_specVO();
		
		user_specVO.setUserID(userID);
		user_specVO.setAccount(account);
		user_specVO.setPswd(pswd);
		user_specVO.setLastName(lastName);
		user_specVO.setFirstName(firstName);
		user_specVO.setGender(gender);
		user_specVO.setBirthdate(birthdate);
		user_specVO.setEmail(email);
		user_specVO.setAddress(address);
		user_specVO.setPhone(phone);
		user_specVO.setGenkiBarTol(genkiBarTol);
		user_specVO.setLevel(level);
		user_specVO.setPicture(picture);
		user_specVO.setRegTime(regTime);
		user_specVO.setHotMan(hotMan);
		user_specVO.setSuspendType(suspendType);
		
		
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

	public void updateHotMan(Integer hotMan,Integer userID){
		user_specVO user =dao.findByPrimaryKey(userID);
		 user.setHotMan(hotMan);
		 dao.update(user);
	}

	public user_specVO checkIDPassword(String account, String pswd) {
		System.out.println("checkIDPassword()");
		//user_specDAO dao = new user_specDAO();
		// 透過變數dao，呼叫它的select()方法，要傳入參數 。將傳回值放入變數
        //user_specVO vo 內。
		user_specVO vo = dao.findByAccount(account);	
        // 如果vo不等於 null 而且參數 password等於vo內的password) {
        if ( vo != null && pswd.equals(vo.getPswd())) {
        	System.out.println("帳密吻合");
        	// 傳回 vo物件，代表帳密吻合，同時結束本方法
        	 return vo;
        }
        // 傳回null物件
		return null;
	}

	




}
