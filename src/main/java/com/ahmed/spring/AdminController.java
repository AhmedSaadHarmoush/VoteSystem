package com.ahmed.spring;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.ahmed.DAO.CandidateDAO3;
import com.ahmed.DAO.PersonDAO;
import com.ahmed.DAO.PersonDAO2;
import com.ahmed.DAO.StatusDAO;
import com.ahmed.entities.Person;

@Controller
public class AdminController {
	
	@RequestMapping(value = "/addUser")
	public String addUser(HttpSession session) {
		Person person = (Person) session.getAttribute("person");
		if(person ==null){
			return "access";
		}
		else if(person.getType()!=2){
			return "access";
		}
	return "control/addUser";
		
	}
	@RequestMapping(value = "/removeUser")
	public String removeUser(HttpSession session,Model model) {
		Person person = (Person) session.getAttribute("person");
		if(person ==null){
			return "access";
		}
		else if(person.getType()!=2){
			return "access";
		}
		PersonDAO2 pao =new PersonDAO2();
		List<Person> psnList =pao.printAll();
		ArrayList<Person> users = new ArrayList<Person>();
		users.addAll(psnList);
		for(int i=0;i<users.size();i++){
			Person iterate =users.get(i);
			if (iterate.getType()==2)
				{
				users.remove(i);
				i--;
				}
				
			
		}
		model.addAttribute("users", users);
		return "control/removeUser";
	}
	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public String updateUser(@RequestParam("txt_id")String idTxt ,HttpSession session,Model model) {
		Person person = (Person) session.getAttribute("person");
		if(person ==null){
			return "access";
		}
		else if(person.getType()!=2){
			return "access";
		}
		int id = Integer.parseInt(idTxt);
		PersonDAO2 pao =new PersonDAO2();
		Person psn =pao.printById(id);
		model.addAttribute("user", psn);
		return "control/updateUser";
	}
	@RequestMapping(value = "/updateUsers", method = RequestMethod.POST)
	public String updateUsers(@RequestParam("txt_id")String idTxt ,@RequestParam("txt_name")String name ,@RequestParam("txt_national")String national ,@RequestParam("txt_pass")String pass ,HttpSession session,Model model) {
		Person person = (Person) session.getAttribute("person");
		if(person ==null){
			return "access";
		}
		else if(person.getType()!=2){
			return "access";
		}
		int id = Integer.parseInt(idTxt);
		PersonDAO pao =new PersonDAO();
		pao.updateUsers(id , name ,national , pass);
		return "control";
	}
	@RequestMapping(value = "/removeUsers", method = RequestMethod.POST)
	public String removeUsers(@RequestParam("txt_id")String idTxt,HttpSession session ,Model model) {
		Person person = (Person) session.getAttribute("person");
		if(person ==null){
			return "access";
		}
		else if(person.getType()!=2){
			return "access";
		}
		int id = Integer.parseInt(idTxt);
		PersonDAO pao = new PersonDAO();
		pao.removeUsers(id);
		removeUser(session,model);
		return "control/removeUser";
	}
	@RequestMapping(value = "/voteProcess")
	public String voteProcess(HttpSession session ,Model model) {
		Person person = (Person) session.getAttribute("person");
		if(person ==null){
			return "access";
		}
		else if(person.getType()!=2){
			return "access";
		}
		StatusDAO sao =new StatusDAO();
		if(sao.votingIsActive()){
			model.addAttribute("voting", 1);
		}else {
			model.addAttribute("voting", 0);
		}
		if(sao.requestIsActive()){
			model.addAttribute("request", 1);
		}else {
			model.addAttribute("request", 0);
		}
		return "control/voteProcess";
	}
	@RequestMapping(value = "/candidates")
	public String candidates(Model model) {
		CandidateDAO3 cao =new CandidateDAO3();
		ArrayList<Person> psnList =cao.printAll();
		ArrayList<Person> users = new ArrayList<Person>();
		users.addAll(psnList);
		model.addAttribute("users", users);
		return "control/candidates";
	}
	
	@RequestMapping(value = "/acceptCandidate", method = RequestMethod.POST)
	public String acceptCandidate(@RequestParam("txt_id")String idTxt ,Model model) {
		int id = Integer.parseInt(idTxt);
		CandidateDAO3 cao = new CandidateDAO3();
		cao.acceptCandidate(id);
		candidates(model);
		return "control/candidates";
	}
	@RequestMapping(value = "/rejectCandidate", method = RequestMethod.POST)
	public String rejectCandidate(@RequestParam("txt_id")String idTxt ,Model model) {
		int id = Integer.parseInt(idTxt);
		CandidateDAO3 cao = new CandidateDAO3();
		cao.rejectCandidate(id);
		candidates(model);
		return "control/candidates";
	}
	@RequestMapping(value = "/removeCandidate", method = RequestMethod.POST)
	public String removeCandidate(@RequestParam("txt_id")String idTxt ,Model model) {
		int id = Integer.parseInt(idTxt);
		CandidateDAO3 cao = new CandidateDAO3();
		cao.removeCandidate(id);
		viewCandidates(model);
		return "control/removeCandidate";
	}
	
	@RequestMapping(value = "/viewCandidates")
	public String viewCandidates(Model model) {
		CandidateDAO3 cao =new CandidateDAO3();
		ArrayList<Person> psnList =cao.printAllCandidates();
		model.addAttribute("users", psnList);
		return "control/removeCandidate";
	}
	
	//actions for voting , requests controllers
	@RequestMapping(value = "/turnVoting")
	public String turnVoting(Model model) {
		StatusDAO sao =new StatusDAO();
		if(sao.votingIsActive()){
			sao.stopVoting();
		}else {
			sao.setVoting();
		}
		
		if(sao.votingIsActive()){
			model.addAttribute("voting", 1);
		}else {
			model.addAttribute("voting", 0);
		}
		if(sao.requestIsActive()){
			model.addAttribute("request", 1);
		}else {
			model.addAttribute("request", 0);
		}
		return "control/voteProcess";
	}
	
	@RequestMapping(value = "/turnRequest")
	public String turnRequest(Model model) {
		StatusDAO sao =new StatusDAO();
		if(sao.requestIsActive()){
			sao.stopRequest();
		}else {
			sao.setRequest();
		}
		
		if(sao.votingIsActive()){
			model.addAttribute("voting", 1);
		}else {
			model.addAttribute("voting", 0);
		}
		if(sao.requestIsActive()){
			model.addAttribute("request", 1);
		}else {
			model.addAttribute("request", 0);
		}
		return "control/voteProcess";
	}
	
}
