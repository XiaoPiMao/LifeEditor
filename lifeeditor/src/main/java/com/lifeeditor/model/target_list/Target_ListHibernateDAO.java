package com.lifeeditor.model.target_list;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lifeeditor.model.target.TargetVO;
import com.lifeeditor.model.user_spec.user_specDAO_interface;
import com.lifeeditor.model.user_spec.user_specVO;

@Transactional(readOnly = true)
public class Target_ListHibernateDAO implements Target_ListDAO_interface{

	private static final String GET_ALL_BY_USER = "from Target_ListVO order by userID";
	private static final String GET_ALL_BY_TARGET = "from Target_ListVO order by targetID";
	private static final String GET_ALL_BY_ID = "from Target_ListVO order by targetListID";
		
	private HibernateTemplate hibernateTemplate;    
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 
        this.hibernateTemplate = hibernateTemplate;
    }
	

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void insert(Target_ListVO trg_listVO) {
		hibernateTemplate.saveOrUpdate(trg_listVO);	
	}
    
	

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void delete(Target_ListVO trg_listVO) {
		hibernateTemplate.delete(trg_listVO);
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void delete(Integer targetID) {
		TargetVO trgVO= (TargetVO) hibernateTemplate.get(TargetVO.class, targetID);
		hibernateTemplate.delete(trgVO);
	}

	
	
	
	@Override
	public List<Target_ListVO> findByUserID(Integer userID) {

		try {
			System.out.println("findByUserID()");
			@SuppressWarnings("unchecked")
			List<Target_ListVO> list = hibernateTemplate.find("FROM Target_ListVO u WHERE u.userVO.userID = ? ORDER BY u.targetListID DESC", userID);
			
			return list;
			
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Target_ListVO findByTargetID(Integer targetID) {
		
		try {
			System.out.println("findByTargetID()");
			@SuppressWarnings("unchecked")
			List<Target_ListVO> list = hibernateTemplate.find("FROM Target_ListVO u WHERE u.trgVO.targetID = ?", targetID);
			if(list.size()>=1){
				Target_ListVO Target_ListVO = list.get(0);
				return Target_ListVO;
			}
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Target_ListVO> getAllByUser() {
		List<Target_ListVO> list = null;
		list = hibernateTemplate.find(GET_ALL_BY_USER);
		return list;
	}

	@Override
	public List<Target_ListVO> getAllByTarget() {
		List<Target_ListVO> list = null;
		list = hibernateTemplate.find(GET_ALL_BY_TARGET);
		return list;
	}

	@Override
	public List<Target_ListVO> getAll() {
		System.out.println(hibernateTemplate);
		List<Target_ListVO> list = null;
		list = hibernateTemplate.find(GET_ALL_BY_ID);
		return list;
	}
	
	
	
	public static void main(String[] args) {
	
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config1-DriverManagerDataSource.xml");
		Target_ListDAO_interface dao =(Target_ListDAO_interface) context.getBean("Target_ListHibernateDAO");

	
		
		//*******************查詢-75號會員有哪些目標***********************
		
		List<Target_ListVO> list = dao.findByUserID(75);
		System.out.println("此會員的目標有:");	
		for (Target_ListVO aTrgList : list) {

 		System.out.print(aTrgList.getUserVO().getUserID() + ",");
		System.out.print(aTrgList.getTrgVO().getTargetID());
		System.out.println("\n---------------------");

 		}	
		
		
		//*******************查詢-22號目標被哪個會員給立訂***********************
	
		Target_ListVO trg_listVO = dao.findByTargetID(22);
		System.out.println("此目標的立訂者為:"+ trg_listVO.getUserVO().getUserID() +"號會員");	
		System.out.println("\n---------------------");

		
		//*******************getAll() 按照流水編號往下排*****************
//		List<Target_ListVO> list = dao.getAll();
//		for (Target_ListVO aTrgList : list) {
//
//			System.out.print(aTrgList.getTargetListID() + ",");
//			System.out.print(aTrgList.getTrgVO().getTargetID() + ",");
//			System.out.print(aTrgList.getUserVO().getUserID() + ",");
//			System.out.println();
//		}	

		
		//*******************getAllByUser() 按照會員編號往下排*****************
//		List<Target_ListVO> list = dao.getAllByUser();
//		for (Target_ListVO aTrgList : list) {
//
//			System.out.print(aTrgList.getTargetListID() + ",");
//			System.out.print(aTrgList.getTrgVO().getTargetID() + ",");
//			System.out.print(aTrgList.getUserVO().getUserID() + ",");
//			System.out.println();
//		}	

		//*******************getAllByTarget() 按照目標編號往下排*****************
//		List<Target_ListVO> list = dao.getAllByTarget();
//		for (Target_ListVO aTrgList : list) {
//
//			System.out.print(aTrgList.getTargetListID() + ",");
//			System.out.print(aTrgList.getTrgVO().getTargetID() + ",");
//			System.out.print(aTrgList.getUserVO().getUserID() + ",");
//			System.out.println();
//		}	
//		
	}





	
	
}
