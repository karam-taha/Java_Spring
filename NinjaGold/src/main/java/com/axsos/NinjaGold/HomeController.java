package com.axsos.NinjaGold;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	@RequestMapping("/gold")
	public String gold(HttpSession session) {
		if (session.getAttribute("score") == null) {
			session.setAttribute("score", 0);
			ArrayList<String> messages = new ArrayList<String>();
			session.setAttribute("messages", messages);
		}
		return "index.jsp";
	}
	@RequestMapping(value="/process", method=RequestMethod.POST)
	public String process_money(HttpSession session,
			@RequestParam(value="gold") String location) {
		Date date = new Date();
		SimpleDateFormat newDate = new SimpleDateFormat("MMMM dd ,yyyy hh:mm a");
		String actionDate = newDate.format(date);
		
		Random rand = new Random();
		int intRandom = 0;
		int currentScore = (int) session.getAttribute("score"); 
		
		if (location.equals("farm")) {
			intRandom = rand.nextInt(10,21);
			currentScore += intRandom;
		}
		else if (location.equals("cave")) {
			intRandom = rand.nextInt(5,11);
			currentScore += intRandom;
		}
		else if (location.equals("house")) {
			intRandom = rand.nextInt(2,6);
			currentScore += intRandom;
		}
		else if (location.equals("quest")) {
			intRandom = rand.nextInt(-50,51);
			currentScore += intRandom;
		}
		if (intRandom > 0) {
			String message = "You entered a "+ location+" and earned "+intRandom+" gold. ("+actionDate+")";
			@SuppressWarnings("unchecked")
			ArrayList<String> messages = (ArrayList<String>) session.getAttribute("messages");
			messages.add(0, message);
			session.setAttribute("messages", messages);
			System.out.println("1"+ message);
		}
		else {
			String message = "You failed a "+ location+" and lost "+intRandom*-1+" gold. Ouch! ("+actionDate+")";
			@SuppressWarnings("unchecked")
			ArrayList<String> messages = (ArrayList<String>) session.getAttribute("messages");
			messages.add(0, message);
			session.setAttribute("messages2", messages);
			System.out.println("2"+ message);
		}
		session.setAttribute("score", currentScore);
		return "redirect:/gold";
	}
	
	@RequestMapping("/reset")
	public String reset(HttpSession session) {
		session.removeAttribute("score");
		session.removeAttribute("messages");
		return "redirect:/gold";
	}
}
