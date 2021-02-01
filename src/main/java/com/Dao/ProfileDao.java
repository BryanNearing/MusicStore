package com.Dao;

import javax.servlet.http.HttpSession;

import com.Entity.Profile;

public interface ProfileDao {

	public boolean verifyLogin(String username, String password, HttpSession session);
	
	public void addAccount(Profile l);
	
	public void editAccount(Profile l);
	
	public Profile getProfile(String username);
	
}
