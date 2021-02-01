package com.Entity;

import java.util.ArrayList;
import java.util.List;

public class Cart {

	List<Product> cart = new ArrayList<>();
	
	public Cart() {
		
	}
	
	public List<Product> getCart(){
		return this.cart;
	}
	
	public void addToCart(Product p) {
		cart.add(p);
	}
	
	public void clearCart() {
		cart.removeAll(cart);
	}
	
	public void remove(int id) {
		
		for(int i = 0; i < cart.size(); i++) {
			if(cart.get(i).getId() == id) {
				cart.remove(cart.get(i));
			}
		}
	}
	
}
