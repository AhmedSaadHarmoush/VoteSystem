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

public class VotesDAO implements Serializable {

	public boolean setVote(int id ,int candidate_id){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			Votes votes = new Votes();
			votes.setUserId(id);
			votes.setCandidateId(candidate_id);
			session.save(votes);
			
	        session.getTransaction().commit();
	        return true;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return false;
	}
	public ArrayList printAllVotes(){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			Query query = session.createQuery("from Votes");
	        List<Votes> psnList = query.list();
	        
	        ArrayList<CountedVote> users =new ArrayList<CountedVote>();
	        
			
	        for (Iterator iterator = psnList.iterator(); iterator.hasNext();) {
				Votes votes = (Votes) iterator.next();
				CountedVote countedVote = new CountedVote();
				query = session.createQuery("from Person where id='"+votes.getUserId()+"'");
				Object ob = query.uniqueResult();
				Person user=(Person)ob;
				countedVote.setUser(user);
				query = session.createQuery("from Person where id='"+votes.getCandidateId()+"'");
				ob = query.uniqueResult();
				user=(Person)ob;
				countedVote.setCandidate(user);
				users.add(countedVote);
			}
	        session.getTransaction().commit();
	        return users;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return null;
	}
	public boolean endSystem(int id){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			Winners winner = new Winners();
			winner.setPersonId(id);
			session.save(winner);
	        session.getTransaction().commit();
	        return true;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return false;
	}
	
	
}
