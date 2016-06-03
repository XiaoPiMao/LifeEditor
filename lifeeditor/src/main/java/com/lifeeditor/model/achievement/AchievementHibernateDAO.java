package com.lifeeditor.model.achievement;

import java.sql.Blob;
import java.util.*;

import org.hibernate.*;

public class AchievementHibernateDAO implements AchievementDAO_interface{

	private static final String DELETE_ACH = "delete from AchievementVO where achID = ?";
	private static final String GET_ALL_STMT = "from AchievementVO order by achID";
	
	
	public int insert(AchievementVO achVO){
//		Session session = com.lifeeditor.utility.HibernateUtil.getSessionFactory().getCurrentSession(); 
//		try {
//			session.beginTransaction();
//			session.saveOrUpdate(achVO);
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
		return 0;
		
	}
	
	
	public void update(AchievementVO achVO) {
		Session session = com.lifeeditor.utility.HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(achVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}
	
	
	
	@Override
	public void delete(AchievementVO achVO) {
		// TODO Auto-generated method stub
		
	}
	
	public void delete(Integer achID) {
		int updateCount = 0;
		Session session = com.lifeeditor.utility.HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			
			Query query = session.createQuery(DELETE_ACH);
			query.setParameter(0, achID);
			updateCount = query.executeUpdate();			
						
			session.getTransaction().commit();			
			System.out.println("刪除成就" + achID + "時,共有" + updateCount
					+ "筆資料被刪除");
			
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}
	
	public AchievementVO findByPrimaryKey(Integer achID) {
		AchievementVO achVO = null;
		Session session = com.lifeeditor.utility.HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			achVO = (AchievementVO) session.get(AchievementVO.class, achID);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return achVO;
	}
	
	public List<AchievementVO> getAll() {
		List<AchievementVO> list = null;
		Session session = com.lifeeditor.utility.HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}


	@Override
	public List<AchievementVO> findByKeyword(String keyword2) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AchievementVO findPicture(Integer achID) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	
	public static void main(String[] args) {

		AchievementHibernateDAO dao = new AchievementHibernateDAO();
		
		// 新增
//		AchievementVO achVO1 = new AchievementVO();
//		achVO1.setAchName("求職達人");
//		achVO1.setAchDesc("獲得十場以上面試通知，且錄取率達百分之90以上者，可獲得此項稱號。");
//		Blob rewardPic1 = null;
//		achVO1.setRewardPic(rewardPic1);
//		dao.insert(achVO1);
		
		// 修改
//		AchievementVO achVO2 = new AchievementVO();
//		achVO2.setAchName("求職狂人");
//		achVO2.setAchDesc("獲得20場以上面試通知，且錄取率達百分之95以上者，可獲得此項稱號。");
//		Blob rewardPic2 = null;
//		achVO2.setRewardPic(rewardPic2);
//		dao.insert(achVO2);		
		
		//刪除
		//dao.delete(6);

		// 查詢
//		AchievementVO achVO3 = dao.findByPrimaryKey(6);
//		System.out.print(achVO3.getAchID() + ",");
//		System.out.print(achVO3.getAchName() + ",");
//		System.out.println(achVO3.getAchDesc());
//		System.out.println("---------------------");
		
		
		// 查詢部門
		List<AchievementVO> list = dao.getAll();
		for (AchievementVO aAchmt : list) {
			System.out.print(aAchmt.getAchID() + ",");
			System.out.print(aAchmt.getAchName() + ",");
			System.out.print(aAchmt.getAchDesc());
			System.out.println();
		}		
		
		
	}


	



}
