package com.Dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.Entity.OrderInfo;
import com.Entity.Product;
import com.Utility.HibernateUtility;

public class OrderInfoDaoImpl implements OrderInfoDao{
	
	Session hsesh = HibernateUtility.getSession();

	@Override
	public void createOrder(OrderInfo oi) {
		Transaction tx = hsesh.beginTransaction();
		for(int i = 0; i < oi.getOrderContents().size(); i++) {
			hsesh.save(oi.getOrderContents().get(i));
		}
		hsesh.save(oi);
		tx.commit();
	}

	@Override
	public void updateOrder(OrderInfo oi) {
		Transaction tx = hsesh.beginTransaction();
		hsesh.update(oi);
		tx.commit();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getOrderById(int id) {
		List<Product> orderList = null;
		Query q = hsesh.createQuery("from Product where Order_Contents = :id");
		q.setParameter("id", id);
		orderList = (List<Product>) q.getResultList();
		
		return orderList;
	}

}
