package com.Dao;

import java.util.List;

import com.Entity.OrderInfo;
import com.Entity.Product;

public interface OrderInfoDao {

	public void createOrder(OrderInfo oi);
	
	public void updateOrder(OrderInfo oi);
	
	public List<Product> getOrderById(int id);
	
	
}
