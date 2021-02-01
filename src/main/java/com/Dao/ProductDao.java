package com.Dao;

import java.util.List;

import com.Entity.Product;

public interface ProductDao {

	public Product getProductByName(String name);
	
	public Product getProductById(int id);
	
	public List<Product> getProductsByCategory(String category);
	
	public List<Product> getAllProducts();
	
	public void addProduct(Product p);
	
	public void editProduct(Product p);
	
}
