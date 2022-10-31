package com.axsos.daikichiroutes;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

	@RestController
	@RequestMapping("/daikichi")
	public class DaikichiRoutesController {
	    @RequestMapping("")
	    // 3. Method that maps to the request route above
	    public String welcome() { // 3
	            return "Welcome!";
	    }
	    
	    @RequestMapping("/today")
	    public String today() {
	    	return "today you will find luck in all your endeavors!";
	    }
	    
	    @RequestMapping("/tomorrow")
	    public String tomorrow() {
	    	return "Tomorrow, an opportunity will arise, so be sure to be open to new ideas!";
	    }
}
