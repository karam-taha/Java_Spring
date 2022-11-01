package com.axsos.Counter;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/your_server")
public class HomeController {
    @RequestMapping("")
    // 3. Method that maps to the request route above
    public String welcome(HttpSession session) {
    	if (session.getAttribute("count") == null) {
			session.setAttribute("count", 0);
		}else {
			Integer currentCount = (Integer) session.getAttribute("count");
			currentCount++;
			session.setAttribute("count", currentCount);
		}
            return "index.jsp";
    }
    
    @RequestMapping("/counter")
    public String counter(HttpSession session, Model model, HttpServletRequest request) {
    	Integer currentCount = 0;
		
		if (session.getAttribute("count") == null) {
			session.setAttribute("count", 0);
		}else {
			currentCount = (Integer) session.getAttribute("count");
		} 
		String homeUrl = request.getRequestURL().toString();

		model.addAttribute("count", currentCount);
		model.addAttribute("page", homeUrl.substring(0,homeUrl.length()-8)); 
	    return "counter.jsp";
    }
    
    @RequestMapping("/double-counter")
	public String doubleCounter(HttpSession session, Model model) {
		
		if (session.getAttribute("count") == null) {
			session.setAttribute("count", 0);
		}else {
			Integer currentCount = (Integer) session.getAttribute("count");
			currentCount+=2;
			session.setAttribute("count", currentCount);
		}

	    return "doubleCounter.jsp";
	}
    
    @RequestMapping("/reset-counter")
	public String resetCounter(HttpSession session, Model model, HttpServletRequest request) {
		
		session.setAttribute("count", 0);

		return "redirect:/your_server/counter";
    }
}
