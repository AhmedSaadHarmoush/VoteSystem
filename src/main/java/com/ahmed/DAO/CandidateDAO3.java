package com.ahmed.DAO;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.ahmed.entities.CandidateInformation;
import com.ahmed.entities.PendingRequest;
import com.ahmed.entities.Person;
import com.ahmed.entities.Status;
import com.ahmed.entities.User;
import com.ahmed.utils.HibernateUtils;

public class CandidateDAO3 implements Serializable {

	
	public ArrayList<Person> printAll(){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			Query query = session.createQuery("from PendingRequest");
	        List<PendingRequest> psnList = query.list();
	        ArrayList<Person> users =new ArrayList<Person>();
	        for (Iterator iterator = psnList.iterator(); iterator.hasNext();) {
				PendingRequest pendingRequest = (PendingRequest) iterator.next();
				query = session.createQuery("from Person where id='"+pendingRequest.getUserId()+"'");
				List<Person> user = query.list();
		        users.addAll(user);
			}

	        session.getTransaction().commit();
	        return users;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return null;
	}
	public ArrayList<Person> printAllCandidates(){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			Query query = session.createQuery("from Person where type =0");
	        List<Person> psnList = query.list();
	       ArrayList<Person> users =new ArrayList<Person>();
	       	users.addAll(psnList);
	        session.getTransaction().commit();
	        return users;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean acceptCandidate(int id){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			Query query = session.createQuery("from PendingRequest p where userId ="+id);
			Object ob = query.uniqueResult();
			PendingRequest p=(PendingRequest)ob;
			session.delete(p);
			Person person = (Person) session.load(Person.class, new Integer(id)); 
			person.setType(0);
			session.update(person);
			
	        session.getTransaction().commit();
	        return true;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return false;
	}
	public boolean rejectCandidate(int id){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			Query query = session.createQuery("from PendingRequest p where userId ="+id);
			Object ob = query.uniqueResult();
			PendingRequest p=(PendingRequest)ob;
			session.delete(p);
			
	        session.getTransaction().commit();
	        return true;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return false;
	}
	public boolean removeCandidate(int id){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			Person person = (Person) session.load(Person.class, new Integer(id)); 
			person.setType(1);
			session.update(person);
			
	        session.getTransaction().commit();
	        return true;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return false;
	}
}
