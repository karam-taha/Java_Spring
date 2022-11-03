package com.axsos.OmikujiForm;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/omikuji")
public class HomeController {
    @RequestMapping("")
    // 3. Method that maps to the request route above
    public String welcome() {
            return "index.jsp";
    }
    
    @RequestMapping(value="/submit", method=RequestMethod.POST)
    public String submit(
        @RequestParam(value="number") Integer number,
        @RequestParam(value="city") String city,
    	@RequestParam(value="person") String person,
		@RequestParam(value="hobby") String hobby,
		@RequestParam(value="live") String live,
		@RequestParam(value="desc") String desc,
		HttpSession session,
		Model model
		){
    	session.setAttribute("number", number);
    	session.setAttribute("city", city);
    	session.setAttribute("person", person);
    	session.setAttribute("hobby", hobby);
    	session.setAttribute("live", live);
    	session.setAttribute("desc", desc);
    	
        return "redirect:/omikuji/show";
    }
    

    @RequestMapping("/show")
    public String show(HttpSession session){            
        return "show.jsp";
    }
}
