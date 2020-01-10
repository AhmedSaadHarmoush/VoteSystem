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
import com.ahmed.entities.Votes;
import com.ahmed.utils.HibernateUtils;

public class StatusDAO implements Serializable {

	public boolean votingIsActive(){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			Query query = session.createQuery("from Status");
			List<Status> stList = query.list();
			for (Iterator iterator = stList.iterator(); iterator.hasNext();) {
				Status status = (Status) iterator.next();
				if(status.getOn()==2){
					session.getTransaction().commit();
					return true;
				}
			}
			
	        session.getTransaction().commit();
	        return false;
		} catch (Exception e) {
				session.getTransaction().rollback();
				e.printStackTrace();
			}
			return false;
		}
	public boolean requestIsActive(){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			Query query = session.createQuery("from Status ");
			List<Status> stList = query.list();
			for (Iterator iterator = stList.iterator(); iterator.hasNext();) {
				Status status = (Status) iterator.next();
				if(status.getOn()==1){
					session.getTransaction().commit();
					return true;
				}
			}
	        session.getTransaction().commit();
	        return false;
		} catch (Exception e) {
				session.getTransaction().rollback();
				e.printStackTrace();
			}
			return false;
		}
	public boolean pendingIsActive(int id){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			Query query = session.createQuery("from PendingRequest where userId="+id);
			Object ob = query.uniqueResult();
			 PendingRequest pendingRequest=(PendingRequest)ob;
			if(pendingRequest != null){
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
	public boolean haveVoted(int id){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			Query query = session.createQuery("from Votes where userId="+id);
			Object ob = query.uniqueResult();
			Votes votes=(Votes)ob;
			if(votes != null){
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
	public boolean setVoting(){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			Status status = (Status) session.load(Status.class, new Integer(2));
			status.setOn(2);
			session.update(status);
		 session.getTransaction().commit();
				 return true;
			 
			 
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return false;
	}
	public boolean setRequest(){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			Status status = (Status) session.load(Status.class, new Integer(3));
			status.setOn(1);
			session.update(status);
		 session.getTransaction().commit();
				 return true;
			 
			 
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return false;
	}
	public boolean stopVoting(){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			Status status = (Status) session.load(Status.class, new Integer(2));
			status.setOn(0);
			session.update(status);
		 session.getTransaction().commit();
				 return true;
			 
			 
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return false;
		}
	public boolean stopRequest(){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			Status status = (Status) session.load(Status.class, new Integer(3));
			status.setOn(0);
			session.update(status);
		 session.getTransaction().commit();
				 return true;
			 
			 
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return false;
		}
	
	
	
}
