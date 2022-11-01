package com.axsos.DisplayDate;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.Date;
import java.text.SimpleDateFormat;

@Controller
public class HomeController {
	// class definition and imports here...
    @RequestMapping("/")
    public String index(Model model) {
        
        return "index.jsp";
    }
    @RequestMapping("/date")
    public String date(Model model) {
    	
    	SimpleDateFormat dayNameFormat = new SimpleDateFormat("EEEE");
    	SimpleDateFormat dayFormat = new SimpleDateFormat("dd");
    	SimpleDateFormat monthFormat = new SimpleDateFormat("MMMM");
    	SimpleDateFormat yearFormat = new SimpleDateFormat("Y");
    	
        Date date = new Date();
        
    	String dayNameString = dayNameFormat.format(date);
    	String dayString = dayFormat.format(date);
    	String monthString = monthFormat.format(date);
    	String yearString = yearFormat.format(date);
    	
    	String dateString = dayNameString + ", " + "the " + dayString + " of " + monthString + ", " + yearString;
    	
    	model.addAttribute("dateString", dateString);
    	
        return "date.jsp";
    }
    @RequestMapping("/time")
    public String time(Model model) {
    	
    	SimpleDateFormat format = new SimpleDateFormat("h:mm a");
    	
    	Date date = new Date();
    	
    	String timeString = format.format(date);
    	
    	model.addAttribute("timeString", timeString);
        return "time.jsp";
    }
    
    

}

