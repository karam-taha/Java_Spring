package com.axsos.daikichiroutes;

import org.springframework.web.bind.annotation.PathVariable;
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
	    
	@RequestMapping("/travel/{place}")
	public String travel(@PathVariable("place") String place) {
	    return "Congratulations! You will travel to " + place;
	}
	    
	@RequestMapping("/lotto/{number}")
	public String lotto(@PathVariable("number") Integer number) {
	    if(number %2 == 0) {
	    	return "You will take a grand journey in the near future, but be weary of tempting offers";
	    }
	    else {
	    	return "You have enjoyed the fruits of your labor but now is a great time to spend time with family and friends.";
	    }
	}
}
