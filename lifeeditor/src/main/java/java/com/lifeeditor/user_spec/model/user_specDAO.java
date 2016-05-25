package java.com.lifeeditor.user_spec.model;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;






@Transactional(readOnly = true)
public class user_specDAO implements user_specDAO_interface{
	
	private static final String GET_ALL_USER = "from user_specVO order by userID";
	private static final String GET_ALL_HOTMAN = "from user_specVO order by hotMan";
	
	
	private HibernateTemplate hibernateTemplate;    
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 
        this.hibernateTemplate = hibernateTemplate;
    }

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void insert(user_specVO user_specVO) {
		hibernateTemplate.saveOrUpdate(user_specVO);
		
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void update(user_specVO user_specVO) {
		hibernateTemplate.saveOrUpdate(user_specVO);
		
	}

	@Override
	public user_specVO findByPrimaryKey(Integer user_specID) {
		user_specVO user_specVO = (user_specVO) hibernateTemplate.get(user_specVO.class, user_specID);
		return user_specVO;
	}

	@Override
	public List<user_specVO> getAll() {
		List<user_specVO> list = null;
		list = hibernateTemplate.find(GET_ALL_USER);
		return list;
	}

	@Override
	public List<user_specVO> getAllByHotMan() {
		List<user_specVO> list = null;
		list = hibernateTemplate.find(GET_ALL_HOTMAN);
		return list;
	}
	public static void main(String[] args) {

		
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config1-DriverManagerDataSource.xml");
        
       
		user_specDAO_interface dao =(user_specDAO_interface) context.getBean("user_specDAO");

		

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



		//�� �d��-getAll (�h��emp2.hbm.xml�����]��lazy="false")(�u!)
		List<user_specVO> list = dao.getAll();
		for (user_specVO aUser : list) {
			System.out.print(aUser.getUserID() + ",");
			System.out.print(aUser.getAccount() + ",");
			System.out.print(aUser.getPswd() + ",");
			System.out.print(aUser.getLastName() + ",");
			System.out.print(aUser.getFirstName() + ",");
			System.out.print(aUser.getGender() + ",");
			System.out.print(aUser.getBirthdate() + ",");
			System.out.print(aUser.getEmail() + ",");
			System.out.print(aUser.getAddress() + ",");
			System.out.print(aUser.getPhone() + ",");
			System.out.print(aUser.getGenkiBarTol() + ",");
			System.out.print(aUser.getLevel() + ",");
			System.out.print(aUser.getPicture() + ",");
			System.out.print(aUser.getRegTime() + ",");
			System.out.print(aUser.getHotMan() + ",");
			System.out.print(aUser.getSuspendType() + ",");
			System.out.println();
		}

}
}
