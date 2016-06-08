package com.lifeeditor.model.genkiBar_list;

import java.io.Serializable;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;











@Transactional(readOnly = true)
public class genkiBar_listDAO implements genkiBar_listDAO_interface{
	
	private static final String GET_GENKINAME = "from genkiBar_listVO where targetID=?";
	
	

	
	private HibernateTemplate hibernateTemplate;    
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 
        this.hibernateTemplate = hibernateTemplate;
    }

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void insert(genkiBar_listVO user_specVO) {
		hibernateTemplate.saveOrUpdate(user_specVO);
		
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void delete(Integer genkiBarID) {
		genkiBar_listVO genkiBar_listVO = new genkiBar_listVO(); //�������h�����p���Y��A�A�R��
		genkiBar_listVO.setGenkiBarID(genkiBarID);
		hibernateTemplate.delete(genkiBar_listVO);
		
	}
	@Override
	public List<genkiBar_listVO> getGenkiName(Integer targetID) {
		System.out.println(hibernateTemplate);
		List<genkiBar_listVO> list = null;
		list = hibernateTemplate.find(GET_GENKINAME, targetID);
		return list;
	}

	
	public static void main(String[] args) {

		
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config1-DriverManagerDataSource.xml");
        
       
		genkiBar_listDAO_interface dao =(genkiBar_listDAO_interface) context.getBean("user_specDAO");

		

//		EmpVO empVO1 = new EmpVO();
//		empVO1.setEname("�d�ç�1");
//		empVO1.setJob("MANAGER");
//		empVO1.setHiredate(java.sql.Date.valueOf("2005-01-01"));
//		empVO1.setSal(new Double(50000));
//		empVO1.setComm(new Double(500));
//		empVO1.setDeptVO(deptVO);
//		dao.insert(empVO1);



		//�� �ק�
//		EmpVO empVO2 = new EmpVO();
//		empVO2.setEmpno(7001);
//		empVO2.setEname("�d�ç�2");
//		empVO2.setJob("MANAGER2");
//		empVO2.setHiredate(java.sql.Date.valueOf("2002-01-01"));
//		empVO2.setSal(new Double(20000));
//		empVO2.setComm(new Double(200));
//		empVO2.setDeptVO(deptVO);
//		dao.update(empVO2);



		//�� �R��(�p��cascade - �h��emp2.hbm.xml�p�G�]�� cascade="all"��
		// cascade="delete"�N�|�R���Ҧ��������-�]�A���ݳ����P�P�������䥦���u�N�|�@�ֳQ�R��)
//		dao.delete(7014);



		//�� �d��-findByPrimaryKey (�h��emp2.hbm.xml�����]��lazy="false")(�u!)
//		EmpVO empVO3 = dao.findByPrimaryKey(7001);
//		System.out.print(empVO3.getEmpno() + ",");
//		System.out.print(empVO3.getEname() + ",");
//		System.out.print(empVO3.getJob() + ",");
//		System.out.print(empVO3.getHiredate() + ",");
//		System.out.print(empVO3.getSal() + ",");
//		System.out.print(empVO3.getComm() + ",");
//		// �`�N�H�U�T�檺�g�k (�u!)
//		System.out.print(empVO3.getDeptVO().getDeptno() + ",");
//		System.out.print(empVO3.getDeptVO().getDname() + ",");
//		System.out.print(empVO3.getDeptVO().getLoc());
//		System.out.println("\n---------------------");



//		//�� �d��-getAll (�h��emp2.hbm.xml�����]��lazy="false")(�u!)
//		List<genkiBar_listVO> list = dao.getAll();
//		for (genkiBar_listVO aUser : list) {
//			System.out.print(aUser.getUserID() + ",");
//			System.out.print(aUser.getAccount() + ",");
//			System.out.print(aUser.getPswd() + ",");
//			System.out.print(aUser.getLastName() + ",");
//			System.out.print(aUser.getFirstName() + ",");
//			System.out.print(aUser.getGender() + ",");
//			System.out.print(aUser.getBirthdate() + ",");
//			System.out.print(aUser.getEmail() + ",");
//			System.out.print(aUser.getAddress() + ",");
//			System.out.print(aUser.getPhone() + ",");
//			System.out.print(aUser.getGenkiBarTol() + ",");
//			System.out.print(aUser.getLevel() + ",");
//			System.out.print(aUser.getPicture() + ",");
//			System.out.print(aUser.getRegTime() + ",");
//			System.out.print(aUser.getHotMan() + ",");
//			System.out.print(aUser.getSuspendType() + ",");
//			System.out.println();
//		}

}
}
