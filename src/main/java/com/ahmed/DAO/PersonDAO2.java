package com.ahmed.DAO;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.ahmed.entities.Person;
import com.ahmed.utils.HibernateUtils;

public class PersonDAO2 implements Serializable {

	public boolean register(String user , String pass ){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			Person p=new Person("",user, pass, 1,"");
			session.save(p);
				 session.getTransaction().commit();
				 return true;
			 
			 
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean setDetails(String user , String checks ,int id){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			Person person = (Person) session.load(Person.class, new Integer(id));
			person.setFuzzy(checks);
			person.setUsername(user);
			session.update(person);
		 session.getTransaction().commit();
				 return true;
			 
			 
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean newPerson(int id){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			Query query = session.createSQLQuery("select * from person p where id = :id ").addEntity(Person.class).setParameter("id", id);
			Object ob = query.uniqueResult();
			 Person person=(Person)ob;
			if(person.getFuzzy().equals("")){
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
	public Person printById(int id){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			Query query = session.createSQLQuery("select * from person p where id = :id ").addEntity(Person.class).setParameter("id", id);
			Object ob = query.uniqueResult();
			 Person person=(Person)ob;
			if(person!= null){
				 return person;
			}
			session.getTransaction().commit();
				 return null;
			 
			 
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return null;
	}
	public List<Person> printAll(){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			Query query = session.createQuery("from Person");
	        List<Person> psnList = query.list();
	        session.getTransaction().commit();
	        return psnList;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return null;
	}
	public Person login(String user, String pass){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			Query query = session.createSQLQuery("select * from person p where p.national_id = :user and p.password = :pass").addEntity(Person.class).setParameter("user", user).setParameter("pass", pass);
			 Object ob = query.uniqueResult();
			 Person person=(Person)ob;
			
			if(person != null){
				session.getTransaction().commit();
				return person;
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
