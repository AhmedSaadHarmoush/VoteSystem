package com.ahmed.spring;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.ahmed.DAO.PersonDAO;
import com.ahmed.DAO.UserDAO;
import com.ahmed.entities.Person;
import com.ahmed.entities.User;

@Controller
public class UserController {
	
	@RequestMapping(value = "/submitRequest")
	public String submitRequest() {
		return "submitRequest";
	}
	@RequestMapping(value = "/requestPending")
	public String requestPending(HttpSession session) {
		Person person = (Person) session.getAttribute("person");
		PersonDAO uao = new PersonDAO();
		uao.requestPending(person.getId());
		session.setAttribute("pending", 1);
		return "index";
	}
	@RequestMapping(value = "/setUser", method = RequestMethod.POST)
	public String setUser(@RequestParam("fname")String first ,@RequestParam("lname")String last ,@RequestParam("mail")String mail ,@RequestParam("address")String add ,@RequestParam("bday")Date bday ,HttpSession session,Model model) throws UnsupportedEncodingException {
		Person person = (Person) session.getAttribute("person");
		UserDAO uao = new UserDAO();
		uao.setUser(first, last, add, bday, mail, person.getId());
		User user =new User(first, last, mail, add, bday, person.getId());
		model.addAttribute("user",user);
		return "profileEditable";
	}
}
