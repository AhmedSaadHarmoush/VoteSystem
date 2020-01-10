package com.ahmed.spring;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.ahmed.DAO.PersonDAO2;
import com.ahmed.DAO.StatusDAO;
import com.ahmed.entities.Person;
import com.ahmed.entities.Status;

@Controller
public class LoginController {
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam("txtName")String name ,@RequestParam("txtPass")String pass ,@ModelAttribute(value = "person") Person person,HttpSession session) {
		
		PersonDAO2 pao =new PersonDAO2();
		Person result =pao.login(name, pass);
		if(result != null){
			session.setAttribute("person", result);
			StatusDAO sao = new StatusDAO();
			if(sao.pendingIsActive(result.getId())){
				session.setAttribute("pending", 1);
			}else {
				session.setAttribute("pending", 0);
			}
			
			if(sao.haveVoted(result.getId())){
				session.setAttribute("voted", 1);
			}else {
				session.setAttribute("voted", 0);
			}
			
			
			if(sao.votingIsActive()){
				session.setAttribute("voting", 1);
			}else {
				session.setAttribute("voting", 0);
			}
			if(sao.requestIsActive()){
				session.setAttribute("request", 1);
			}else {
				session.setAttribute("request", 0);
			}
			if(pao.newPerson(result.getId())){
				return "details";
			}
		    return  "index";
		}else{
			return "index";
		}
	    
	}
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate(); 
		return  "index";
	}
			
		
	public String loginpage() {
		return "login";
	}
	@RequestMapping(value = "/control")
	public String control(HttpSession session) {
		Person person = (Person) session.getAttribute("person");
		if(person !=null){
			if(person.getType()==2)
				return "control";
		}
		return "access";
	}
}
