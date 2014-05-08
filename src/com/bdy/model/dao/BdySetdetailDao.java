package com.bdy.model.dao;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.StaleStateException;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.hibernate.exception.ConstraintViolationException;

import com.bdy.model.BdySetdetail;

public class BdySetdetailDao {

private SessionFactory sf = null;
	
	public void setSessionFactory(SessionFactory sf){
		this.sf = sf;
	}
	public BdySetdetailDao(){
		
	}
	@SuppressWarnings("unchecked")
	public List<BdySetdetail> getAllSetdetail(){
		Session session = sf.openSession();
		List<BdySetdetail> result = session.createCriteria(BdySetdetail.class).list();
		session.close();
		return result;
	}
	
	public BdySetdetail getSetdetail(int sdId) {
		Session session = sf.openSession();
		Iterator iter = session.createCriteria(BdySetdetail.class)
							   .add(Restrictions.eq("sdId", sdId))
							   .list()
							   .iterator();
		BdySetdetail result = null;
		if (iter.hasNext()) {
			result = (BdySetdetail) iter.next();
		}
		session.close();
		return result;
	}
	
	public int insert(BdySetdetail setdetail) {
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		
		try {
			session.save(setdetail);
			tx.commit();
		} catch (ConstraintViolationException e) {
			System.out.println("新增失敗 : 鍵值重複");
			session.close();
			return 0;
		}
		session.close();
		return 1;
	}
	
	public int delete(int sdId) {
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		
		Iterator iter = session.createCriteria(BdySetdetail.class)
							   .add(Restrictions.eq("sdId", sdId))
							   .list().iterator();
		while (iter.hasNext()) {
			BdySetdetail set = (BdySetdetail) iter.next();
			session.delete(set);
		}
		
		try {
			tx.commit();
		} catch (StaleStateException e) {
			System.out.println("刪除失敗 : 資料不存在 ( " + e.getMessage()+" )");
			session.close();
			return 0;
		}
		session.close();
		return 1;
	}
	
	public int update(BdySetdetail setdetail) {
		Session session = sf.openSession();
		Criteria criteria = session.createCriteria(BdySetdetail.class);
		Transaction tx = session.beginTransaction();
		Iterator iter = criteria.add(Restrictions.eq("sdId", setdetail.getSdId())).list().iterator();
		if (iter.hasNext()) {
			BdySetdetail tmpSetdetail = (BdySetdetail) iter.next();
			tmpSetdetail.setSdId(setdetail.getSdId());			
			tmpSetdetail.setBdySet(setdetail.getBdySet());
			tmpSetdetail.setBdyFoodkind(setdetail.getBdyFoodkind());
			tmpSetdetail.setPrice(setdetail.getPrice());
			
			
		} else {
			System.out.println("修改失敗 : 資料不存在 (odId:"+setdetail.getSdId()+")");
			session.close();
			return 0;
		}
		
		try {
			tx.commit();
		} catch (StaleStateException e) {
			System.out.println("修改失敗 : 資料不存在 ( " + e.getMessage()+" )");
			session.close();
			return 0;
		}
		
		session.close();
		return 1;
	}
	




}
