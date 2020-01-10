package com.ahmed.spring;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ahmed.DAO.CandidateDAO3;
import com.ahmed.DAO.PersonDAO;
import com.ahmed.DAO.PersonDAO2;
import com.ahmed.DAO.UserDAO;
import com.ahmed.DAO.VotesDAO;
import com.ahmed.DAO.WinnersDAO;
import com.ahmed.entities.Person;
import com.ahmed.entities.User;
import com.ahmed.entities.CandidateInfo;
import com.ahmed.entities.CountedVote;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "index";
	}
	@RequestMapping(value = "/profile")
	public String profile(HttpSession session,Model model) {
		UserDAO uao = new UserDAO();
		Person person = (Person) session.getAttribute("person");
		if(uao.userIsSet(person.getId())){
			User user =uao.getUserData(person.getId());
			if(user!=null){
				model.addAttribute("set",true);
			}
			model.addAttribute("user",user);
			model.addAttribute("editable",true);
			return "profileEditable";
		}
		return "profileEdit";
	}
	@RequestMapping(value="/previousWinners")
	public String previousWinners(Model model){
		WinnersDAO wao =new WinnersDAO();
		ArrayList<Person> winners = new ArrayList<Person>();
		winners=wao.printAllWinners();
		for (Iterator iterator = winners.iterator(); iterator.hasNext();) {
			Person person = (Person) iterator.next();
			System.out.println(person.getUsername());
		}
		model.addAttribute("users",winners);
		return "previousWinners";
	}
	@RequestMapping(value="/endSystem")
	public String endSystem(){
		VotesDAO vao = new VotesDAO();
		CandidateDAO3 cao = new CandidateDAO3();
		
		ArrayList<Person> candidates =new ArrayList<Person>();
		ArrayList<CountedVote> votes =new ArrayList<CountedVote>();
		
		candidates=cao.printAllCandidates();
		votes=vao.printAllVotes();
		
		int[][] votesCounted = new int[candidates.size()][2];
		int max=0;
		int winner=0;
		
		for (int i = 0; i < votesCounted.length; i++) {
			Person person = new Person();
			person=candidates.get(i);
			votesCounted[i][0]=person.getId();
			votesCounted[i][1]=0;
		}
		for (int i = 0; i < votes.size(); i++) {
			CountedVote countedVote =votes.get(i);
			for (int j = 0; j < votesCounted.length; j++) {
				if(countedVote.getCandidate().getId()==votesCounted[j][0]){
					votesCounted[j][1]++;
				}
			}
		}
		for (int i = 0; i < votesCounted.length; i++) {
			if(votesCounted[i][1]>max){
				winner=votesCounted[i][0];
				max=votesCounted[i][1];
			}
		}
		vao.endSystem(winner);
		
		return "index";
	}
	@RequestMapping(value = "/getCandidateUserData", method = RequestMethod.POST)
	public String getCandidateUserData(@RequestParam("txt_id")int idTxt ,HttpSession session,Model model) {
		UserDAO uao = new UserDAO();
			User user =uao.getUserData(idTxt);
			if(user!=null){
				model.addAttribute("set",true);
			}
			model.addAttribute("user",user);
			return "profileEditable";
		
	}
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(HttpSession session) {
		return "index";
	}
	@RequestMapping(value="/learn")
	public String learn(Model model){
		ArrayList<CandidateInfo> candidatesInfo = new ArrayList<CandidateInfo>();
		ArrayList<CountedVote> countedVotes = new ArrayList<CountedVote>();
		ArrayList<Person> candidates = new ArrayList<Person>();
		ArrayList<Person> learned =new ArrayList<Person>();
		
		int counter=0;
		
		PersonDAO pao2 =new PersonDAO();
		PersonDAO2 pao =new PersonDAO2();
		VotesDAO vao = new VotesDAO();
		
		List<Person> psnList =pao.printAll();
		
		for (Iterator iterator = psnList.iterator(); iterator.hasNext();) {
			Person person = (Person) iterator.next();
			if(person.getType()==0){
				CandidateInfo candidate = new CandidateInfo();
				candidate.setUsername(person.getUsername());
				candidate.setId(person.getId());
				candidatesInfo.add(candidate);
				candidates.add(person);
			}
		}
		countedVotes = vao.printAllVotes();
		for (Iterator iterator = countedVotes.iterator(); iterator.hasNext();) {
			CountedVote counted = (CountedVote) iterator.next();
			for (Iterator iterator2 = candidatesInfo.iterator(); iterator2.hasNext();) {
				CandidateInfo candidateInf = (CandidateInfo) iterator2.next();
				if(counted.getCandidate().getId()==candidateInf.getId()){
					candidateInf.setDelegates(candidateInf.getDelegates()+1);
					counter++;
				}
			}
		}
		for (Iterator iterator = candidatesInfo.iterator(); iterator.hasNext();) {
			CandidateInfo candidateInf = (CandidateInfo) iterator.next();
				candidateInf.setPercentage((candidateInf.getDelegates()*1.0/counter)*100);
		}
		
		
		
		for(int i=0;i<countedVotes.size();i++){
			CountedVote countedvote = countedVotes.get(i);
			Person voter = countedvote.getUser();
			String voterFuzzyStrings[]=voter.getFuzzy().split(",");
			double[] voterFuzzyVals = new double[voterFuzzyStrings.length];
			for (int j = 0; j < voterFuzzyStrings.length; j++) {
				voterFuzzyVals[j]=Double.parseDouble(voterFuzzyStrings[j]);
			}
			double[] fuzzyValues = new double[candidates.size()];
			for(int j=0;j<candidates.size();j++){
				Person candidate =candidates.get(j);
				String candidateFuzzyStrings[]=candidate.getFuzzy().split(",");
				double[] candidateFuzzyVals = new double[candidateFuzzyStrings.length];
				for (int k = 0; k < candidateFuzzyVals.length; k++) {
					candidateFuzzyVals[k]=Double.parseDouble(candidateFuzzyStrings[k]);
				}
				double sum=0;
				for (int k = 0; k < candidateFuzzyVals.length; k++) {
					sum+=(5-Math.abs(candidateFuzzyVals[k]-voterFuzzyVals[k]))/5;
				}
				fuzzyValues[j]=sum;
				sum=0;
			}
			int max=0;
			for (int j = 0; j < fuzzyValues.length; j++) {
				if(fuzzyValues[j]>fuzzyValues[max]){
					max=j;
				}
			}
			countedvote.setExpected(candidates.get(max));
		}
		for(int i=0;i<countedVotes.size();i++){
			CountedVote countedvote = countedVotes.get(i);
			Person voter = countedvote.getUser();
			String voterFuzzyStrings[]=voter.getFuzzy().split(",");
			double[] voterFuzzyVals = new double[voterFuzzyStrings.length];
			Person realVote = countedvote.getCandidate();
			String candidateFuzzyStrings[]=realVote.getFuzzy().split(",");
			double[] candidateFuzzyVals = new double[candidateFuzzyStrings.length];
			for (int j = 0; j < candidateFuzzyVals.length; j++) {
				voterFuzzyVals[j]=Double.parseDouble(voterFuzzyStrings[j]);
				candidateFuzzyVals[j]=Double.parseDouble(candidateFuzzyStrings[j]);
				voterFuzzyVals[j]=(voterFuzzyVals[j]+candidateFuzzyVals[j])/2.0;
			}
			String newFuzzy = voterFuzzyVals[0]+","+voterFuzzyVals[1]+","+voterFuzzyVals[2]+","+voterFuzzyVals[3]+","+voterFuzzyVals[4]+","+voterFuzzyVals[5]+","+voterFuzzyVals[6]+","+voterFuzzyVals[7]+","+voterFuzzyVals[8]+","+voterFuzzyVals[9]+","+voterFuzzyVals[10]+","+voterFuzzyVals[11]+","+voterFuzzyVals[12]+","+voterFuzzyVals[13]+","+voterFuzzyVals[14]+","+voterFuzzyVals[15]+","+voterFuzzyVals[16]+","+voterFuzzyVals[17]+","+voterFuzzyVals[18]+","+voterFuzzyVals[19]+","+voterFuzzyVals[20]+","+voterFuzzyVals[21]+","+voterFuzzyVals[22]+","+voterFuzzyVals[23]+","+voterFuzzyVals[24]+","+voterFuzzyVals[25]+","+voterFuzzyVals[26]+","+voterFuzzyVals[27]+","+voterFuzzyVals[28];
			voter.setFuzzy(newFuzzy);
			learned.add(voter);
		}
		
		pao2.learnSet(learned);
		model.addAttribute("total", candidatesInfo);
		model.addAttribute("countedVotes",countedVotes);
		return "results";
	}
	@RequestMapping(value = "/results")
	public String results(Model model) {
		ArrayList<CandidateInfo> candidatesInfo = new ArrayList<CandidateInfo>();
		ArrayList<CountedVote> countedVotes = new ArrayList<CountedVote>();
		ArrayList<Person> candidates = new ArrayList<Person>();
		
		int counter=0;
		
		PersonDAO2 pao =new PersonDAO2();
		VotesDAO vao = new VotesDAO();
		
		List<Person> psnList =pao.printAll();
		
		for (Iterator iterator = psnList.iterator(); iterator.hasNext();) {
			Person person = (Person) iterator.next();
			if(person.getType()==0){
				CandidateInfo candidate = new CandidateInfo();
				candidate.setUsername(person.getUsername());
				candidate.setId(person.getId());
				candidatesInfo.add(candidate);
				candidates.add(person);
			}
		}
		countedVotes = vao.printAllVotes();
		for (Iterator iterator = countedVotes.iterator(); iterator.hasNext();) {
			CountedVote counted = (CountedVote) iterator.next();
			for (Iterator iterator2 = candidatesInfo.iterator(); iterator2.hasNext();) {
				CandidateInfo candidateInf = (CandidateInfo) iterator2.next();
				if(counted.getCandidate().getId()==candidateInf.getId()){
					candidateInf.setDelegates(candidateInf.getDelegates()+1);
					counter++;
				}
			}
		}
		for (Iterator iterator = candidatesInfo.iterator(); iterator.hasNext();) {
			CandidateInfo candidateInf = (CandidateInfo) iterator.next();
				candidateInf.setPercentage((candidateInf.getDelegates()*1.0/counter)*100);
		}
		
		
		
		for(int i=0;i<countedVotes.size();i++){
			CountedVote countedvote = countedVotes.get(i);
			Person voter = countedvote.getUser();
			String voterFuzzyStrings[]=voter.getFuzzy().split(",");
			double[] voterFuzzyVals = new double[voterFuzzyStrings.length];
			for (int j = 0; j < voterFuzzyStrings.length; j++) {
				voterFuzzyVals[j]=Double.parseDouble(voterFuzzyStrings[j]);
			}
			double[] fuzzyValues = new double[candidates.size()];
			for(int j=0;j<candidates.size();j++){
				Person candidate =candidates.get(j);
				String candidateFuzzyStrings[]=candidate.getFuzzy().split(",");
				double[] candidateFuzzyVals = new double[candidateFuzzyStrings.length];
				for (int k = 0; k < candidateFuzzyVals.length; k++) {
					candidateFuzzyVals[k]=Double.parseDouble(candidateFuzzyStrings[k]);
				}
				double sum=0;
				for (int k = 0; k < candidateFuzzyVals.length; k++) {
					sum+=(5-Math.abs(candidateFuzzyVals[k]-voterFuzzyVals[k]))/5;
				}
				fuzzyValues[j]=sum;
				sum=0;
			}
			int max=0;
			for (int j = 0; j < fuzzyValues.length; j++) {
				if(fuzzyValues[j]>fuzzyValues[max]){
					max=j;
				}
			}
			countedvote.setExpected(candidates.get(max));
		}
		model.addAttribute("total", candidatesInfo);
		model.addAttribute("countedVotes",countedVotes);
		return "results";
	}
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(Model model) {
		PersonDAO2 pao =new PersonDAO2();
		List<Person> psnList =pao.printAll();
		
	//separate candidates from users
		ArrayList<Person> candidates = new ArrayList<Person>();
		ArrayList<Person> users = new ArrayList<Person>();
		for (Iterator iterator = psnList.iterator(); iterator.hasNext();) {
			Person person = (Person) iterator.next();
			if(person.getFuzzy().equals(""))
				continue;
			if(person.getType()==0){
				candidates.add(person);
			}else
				users.add(person);
		}
		int[] delegates = new int[candidates.size()];
		double[] fuzzyValues = new double[candidates.size()];
	//deal with each user	
		for (int i = 0; i < users.size(); i++) {
			
			//get a user
			Person user =users.get(i);
			String userFuzzyNo = user.getFuzzy();
			String userFuzzyVals[]=userFuzzyNo.split(",");
			
		//create a array to save fuzzy comparisson values
			double[] fuzzycomparison = new double[userFuzzyVals.length];
			for (int j = 0; j < fuzzycomparison.length; j++) {
				fuzzycomparison[j]=0;
			}
		//iterates over candidates	
			for (int l=0;l<candidates.size();l++) {
		//compare with each candidate
				Person candidate = candidates.get(l);
				String candidateFuzzyNo = candidate.getFuzzy();
				String candidateFuzzyVals[]=candidateFuzzyNo.split(",");
				
				for (int j = 0; j < userFuzzyVals.length; j++) {
					double x= Double.parseDouble(candidateFuzzyVals[j]);
					double y= Double.parseDouble(userFuzzyVals[j]);
					double max=x;
					double min=y;
					if(y>x){
						max=y;
						min=x;
					}
					fuzzycomparison[j]=5-(max-min)/5.0;
				}
				int sum=0;
				for (int j = 0; j < fuzzycomparison.length; j++) {
					sum+=fuzzycomparison[j];
				}
				fuzzyValues[l]=sum;
			}// end comparison with candidates
			int max=0;
			for (int j = 0; j < fuzzyValues.length; j++) {
				if(fuzzyValues[j]>fuzzyValues[max])max=j;
			}
			delegates[max]++;
			
			
		}//end of user
		ArrayList vals = new ArrayList();
		for (int j = 0; j < delegates.length; j++) {
			vals.add(delegates[j]);
			}
		ArrayList<CandidateInfo>aryNumbers =new ArrayList<CandidateInfo>();
		for (int j = 0; j < delegates.length; j++) {
			CandidateInfo ci =new CandidateInfo();
			ci.setUsername(candidates.get(j).getUsername());
			ci.setDelegates(delegates[j]);
			ci.setPercentage(delegates[j]*1.0/users.size()*100);
			aryNumbers.add(ci);
			}
		model.addAttribute("total", aryNumbers);
		model.addAttribute("vals", delegates);
		model.addAttribute("psnList", candidates);
		return "view";
	}
	
	@RequestMapping(value="/register" ,method=RequestMethod.POST)
	public String register(@RequestParam("nationalId")String user ,@RequestParam("pass")String pass ,Model model) {
		PersonDAO2 pao =new PersonDAO2();
		pao.register(user, pass);
		return "index";
		
	}
	@RequestMapping(value="/vote" )
	public String vote(Model model) {
		CandidateDAO3 cao = new CandidateDAO3();
		ArrayList<Person> users=new ArrayList<Person>(); 
		users=cao.printAllCandidates();
		model.addAttribute("users", users);
		return "vote";
		
	}
	@RequestMapping(value="/setVote" )
	public String setVote(@RequestParam("selected")int candidate_id,Model model,HttpSession session) {
		Person person = (Person) session.getAttribute("person");
		VotesDAO vao = new VotesDAO();
		vao.setVote(person.getId(), candidate_id);
		session.setAttribute("voted", 1);
		return "index";
	}
	@RequestMapping(value="/details" ,method=RequestMethod.POST)
	public String details(@RequestParam("user")String user ,@RequestParam("check1")int check1,@RequestParam("check2")int check2,@RequestParam("check3")int check3,@RequestParam("check4")int check4,@RequestParam("check5")int check5,@RequestParam("check6")int check6,@RequestParam("check7")int check7,@RequestParam("check8")int check8,@RequestParam("check9")int check9,@RequestParam("check10")int check10,@RequestParam("check11")int check11,@RequestParam("check12")int check12,@RequestParam("check13")int check13,@RequestParam("check14")int check14,@RequestParam("check15")int check15,@RequestParam("check16")int check16,@RequestParam("check17")int check17,@RequestParam("check18")int check18,@RequestParam("check19")int check19,@RequestParam("check20")int check20,@RequestParam("check21")int check21,@RequestParam("check22")int check22,@RequestParam("check23")int check23,@RequestParam("check24")int check24,@RequestParam("check25")int check25,@RequestParam("check26")int check26,@RequestParam("check27")int check27,@RequestParam("check28")int check28,@RequestParam("check29")int check29,Model model,
	        HttpSession session) {
		PersonDAO2 pao =new PersonDAO2();
		Person person = (Person) session.getAttribute("person");
		String checks = check1+","+check2+","+check3+","+check4+","+check5+","+check6+","+check7+","+check8+","+check9+","+check10+","+check11+","+check12+","+check13+","+check14+","+check15+","+check16+","+check17+","+check18+","+check19+","+check20+","+check21+","+check22+","+check23+","+check24+","+check25+","+check26+","+check27+","+check28+","+check29;
			pao.setDetails(user,checks,person.getId());
		return "index";
		
	}
	
}
