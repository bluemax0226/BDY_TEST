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

import com.bdy.model.BdyBill;

public class BdyBillDao {
	private SessionFactory sf = null;

	public void setSessionFactory(SessionFactory sf) {
		this.sf = sf;
	}

	public BdyBillDao() {

	}

	@SuppressWarnings("unchecked")
	public List<BdyBill> getAllBill() {
		Session session = sf.openSession();
		List<BdyBill> result = session.createCriteria(BdyBill.class).list();
		session.close();
		return result;
	}

	public BdyBill getOrder(int billId) {
		Session session = sf.openSession();
		Iterator iter = session.createCriteria(BdyBill.class)
				.add(Restrictions.eq("billId", billId)).list().iterator();
		BdyBill result = null;
		if (iter.hasNext()) {
			result = (BdyBill) iter.next();
		}
		session.close();
		return result;
	}

	public int insert(BdyBill bill) {
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();

		try {
			session.save(bill);
			tx.commit();
		} catch (ConstraintViolationException e) {
			System.out.println("新增失敗 : 鍵值重複");
			session.close();
			return 0;
		}
		session.close();
		return 1;
	}

	public int delete(int billId) {
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();

		Criteria criteria = session.createCriteria(BdyBill.class);
		Iterator iter = criteria.add(Restrictions.eq("billId", billId)).list()
				.iterator();
		while (iter.hasNext()) {
			BdyBill bill = (BdyBill) iter.next();
			session.delete(bill);
		}

		try {
			tx.commit();
		} catch (StaleStateException e) {
			System.out.println("刪除失敗 : 資料不存在 ( " + e.getMessage() + " )");
			session.close();
			return 0;
		}
		session.close();
		return 1;
	}

	public int update(BdyBill bill) {
		Session session = sf.openSession();
		Criteria criteria = session.createCriteria(BdyBill.class);
		Transaction tx = session.beginTransaction();
		Iterator iter = criteria
				.add(Restrictions.eq("billId", bill.getBillId())).list()
				.iterator();
		if (iter.hasNext()) {
			BdyBill tmpBill = (BdyBill) iter.next();
			tmpBill.setBillId(bill.getBillId());
			tmpBill.setBdyDiscount(bill.getBdyDiscount());
			tmpBill.setBdyOrder(bill.getBdyOrder());
			tmpBill.setBdyEmp(bill.getBdyEmp());
			tmpBill.setEndDate(bill.getEndDate());
			tmpBill.setPrice(bill.getPrice());
			tmpBill.setCustNum(bill.getCustNum());
		} else {
			System.out
					.println("修改失敗 : 資料不存在 (billId:" + bill.getBillId() + ")");
			session.close();
			return 0;
		}

		try {
			tx.commit();
		} catch (StaleStateException e) {
			System.out.println("修改失敗 : 資料不存在 ( " + e.getMessage() + " )");
			session.close();
			return 0;
		}

		session.close();
		return 1;
	}

}
