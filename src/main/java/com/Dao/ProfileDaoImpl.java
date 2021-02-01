package com.Dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.Entity.Profile;
import com.Utility.HibernateUtility;

public class ProfileDaoImpl implements ProfileDao{

	Session hsesh = HibernateUtility.getSession();
	
	@SuppressWarnings("unchecked")
	@Override
	public boolean verifyLogin(String username, String password, HttpSession session) {
		
		List<Profile> profileList = new ArrayList<>();
		session.setAttribute("username", null);
		
		try {
			Query q = hsesh.createQuery("from Profile P where P.username = :username");
			q.setParameter("username", username);
			profileList = (List<Profile>) q.getResultList();
		}
		catch(Exception e) {
			System.out.println(e);
			return false;
		}
		
		if(profileList.size() == 0)
			return false;
		else if(profileList.get(0).getUsername().equals(username) && profileList.get(0).getPassword().equals(password)) {
			session.setAttribute("username", username);
			return true;
		}
		else
			return false;
		
	}

	@Override
	public void addAccount(Profile l) {
		Transaction tx = hsesh.beginTransaction();
		hsesh.save(l);
		tx.commit();
	}

	@Override
	public void editAccount(Profile l) {
		Transaction tx = hsesh.beginTransaction();
		hsesh.update(l);
		tx.commit();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Profile getProfile(String username) {
		
		List<Profile> profileList = new ArrayList<>();
		Profile p = null;
		
		try {
			Query q = hsesh.createQuery("from Profile P where P.username = :username");
			q.setParameter("username", username);
			profileList = (List<Profile>) q.getResultList();
			p = profileList.get(0);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return p;
	}
	
	

}
