package com.ahmed.DAO;

import java.io.Serializable;
import java.sql.Date;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.ahmed.entities.Person;
import com.ahmed.entities.User;
import com.ahmed.utils.HibernateUtils;

public class UserDAO implements Serializable {
	public boolean setUser(String fname , String lname ,String address,Date bday ,String mail,int personId ){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			User u = new User();
			u.setFirstName(fname);
			u.setLastName(lname);
			u.setAddress(address);
			u.setBirthdate(bday);
			u.setMail(mail);
			u.setPersonId(personId);
			session.save(u);
				 session.getTransaction().commit();
				 return true;
			 
			 
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return false;
	}
	public boolean userIsSet(int id){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			Query query = session.createQuery("from User where personId = '"+id+"' ");
			Object ob = query.uniqueResult();
			 User user=(User)ob;
			if(user != null){
				return true;
			}
		 session.getTransaction().commit();
				 return false;
			 
			 
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return false;
	}
	public User getUserData(int id){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try{
			if(session.getTransaction().isActive()){
				
			}else{
				session.getTransaction().begin();	
			}
			Query query = session.createQuery("from User where personId = '"+id+"' ");
			Object ob = query.uniqueResult();
			 User user=(User)ob;
			if(user != null){
				return user;
			}
		 session.getTransaction().commit();
				 return null;
			 
			 
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return null;
	}
	
}
