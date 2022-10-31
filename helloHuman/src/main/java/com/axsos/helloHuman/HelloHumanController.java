package com.axsos.helloHuman;

import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class HelloHumanController {
    
    @RequestMapping("")
    public String index(@RequestParam(value="name", required=false) String searchQueryname,
    		@RequestParam(value="last_name", required=false) String searchQuerylastname,
    		@RequestParam(value="times", required=false) Integer searchQuerytimes){
    	if(searchQueryname == null) {
    		return "Hello Human";
    	}
    	if(searchQuerylastname == null) {
    		return "Hello " + searchQueryname;
    	}
    	if(searchQuerytimes == null) {
    		return "Hello " + StringUtils.capitalize(searchQueryname) + " " + StringUtils.capitalize(searchQuerylastname);
    	}
    	else {
    		return ("Hello " + StringUtils.capitalize(searchQueryname) + " " + StringUtils.capitalize(searchQuerylastname) + ". " ).repeat(searchQuerytimes);
    	}
    }
}
    