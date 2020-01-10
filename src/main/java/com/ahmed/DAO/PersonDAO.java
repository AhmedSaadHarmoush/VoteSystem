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

public class PersonDAO implements Serializable {

	public boolean requestPending(int id ){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			PendingRequest pending = new PendingRequest();
			pending.setUserId(id);
			session.save(pending);
				 session.getTransaction().commit();
				 return true;
			 
			 
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return false;
	}
	public boolean removeUsers(int id){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			Person person = (Person) session.load(Person.class, new Integer(id)); 
			session.delete(person);
			
	        session.getTransaction().commit();
	        return true;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return false;
	}
	public boolean updateUsers(int id , String name , String national , String pass){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			Person person = (Person) session.load(Person.class, new Integer(id)); 
			person.setUsername(name);
			person.setNationalId(national);
			person.setPassword(pass);
			session.update(person);
			
	        session.getTransaction().commit();
	        return true;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return false;
	}
	public boolean learnSet(ArrayList<Person> persons){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try{
			session.getTransaction().begin();
			for (Iterator iterator = persons.iterator(); iterator.hasNext();) {
				Person personIterator = (Person) iterator.next();
				String hql = "UPDATE Person set fuzzy = :fuzzy "  + 
			             "WHERE id = :person_id";
					Query query = session.createQuery(hql);
					query.setParameter("fuzzy", personIterator.getFuzzy());
					query.setParameter("person_id", personIterator.getId());
					int result = query.executeUpdate();
			}
			session.getTransaction().commit();
			return true;
		}catch(Exception e){
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return false;
		
	}
}
