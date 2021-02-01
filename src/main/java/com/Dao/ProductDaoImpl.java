package com.Dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.Entity.Product;
import com.Entity.Profile;
import com.Utility.HibernateUtility;

public class ProductDaoImpl implements ProductDao{
	
	Session hsesh = HibernateUtility.getSession();

	@Override
	public Product getProductByName(String name) {
		return (Product) hsesh.createQuery("from Product where name = " + name);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Product getProductById(int id) {
		List<Product> productList = new ArrayList<>();
		Product p = null;
		
		Query q = hsesh.createQuery("from Product P where P.id = :id");
		q.setParameter("id", id);
		productList = (List<Product>) q.getResultList();
		p = productList.get(0);
		
		return p;
	}

	@Override
	public List<Product> getProductsByCategory(String category) {
		@SuppressWarnings("unchecked")
		List<Product> pList = hsesh.createQuery("from Product where category where Product.category = " + category).list();
		return pList;
	}

	@Override
	public List<Product> getAllProducts() {
		return hsesh.createQuery("from Product where Order_Contents = NULL", Product.class).getResultList();
	}

	@Override
	public void addProduct(Product p) {
		Transaction tx = hsesh.beginTransaction();
		hsesh.save(p);
		tx.commit();
	}

	@Override
	public void editProduct(Product p) {
		Transaction tx = hsesh.beginTransaction();
		hsesh.save(p);
		tx.commit();
	}

}
