package com.ahmed.DAO;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.ahmed.entities.CountedVote;
import com.ahmed.entities.PendingRequest;
import com.ahmed.entities.Person;
import com.ahmed.entities.Votes;
import com.ahmed.entities.Winners;
import com.ahmed.utils.HibernateUtils;

public class WinnersDAO implements Serializable {

	public ArrayList printAllWinners(){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			Query query = session.createQuery("from Winners");
	        List<Winners> psnList = query.list();
	        
	        ArrayList<Person> users =new ArrayList<Person>();
	        
			
	        for (Iterator iterator = psnList.iterator(); iterator.hasNext();) {
				Winners winner = (Winners) iterator.next();
				query = session.createQuery("from Person where id='"+winner.getPersonId()+"'");
				Object ob = query.uniqueResult();
				Person user=(Person)ob;
				users.add(user);
			}
	        session.getTransaction().commit();
	        return users;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return null;
	}
	
}
