package com.Entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity
public class OrderInfo {
	
	@Id
	@GeneratedValue
	private int id;
	@OneToMany
	@JoinColumn(name = "Order_Contents")
	private List<Product> orderContents;
	
	public OrderInfo(List<Product> orderContents) {
		super();
		this.orderContents = orderContents;
	}
	
	public OrderInfo() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<Product> getOrderContents() {
		return orderContents;
	}

	public void setOrderContents(List<Product> orderContents) {
		this.orderContents = orderContents;
	}
	
	

}
