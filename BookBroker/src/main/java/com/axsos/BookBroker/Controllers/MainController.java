package com.axsos.BookBroker.Controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.axsos.BookBroker.Models.Book;
import com.axsos.BookBroker.Models.LoginUser;
import com.axsos.BookBroker.Models.User;
import com.axsos.BookBroker.Services.BookService;
import com.axsos.BookBroker.Services.UserService;

@Controller
public class MainController {
	@Autowired
	UserService userService;
	@Autowired
	BookService bookService;
	
	@GetMapping("/")
	public String index(Model model) {
	 
	    // Bind empty User and LoginUser objects to the JSP to capture the form input
	    model.addAttribute("newUser", new User());
	    model.addAttribute("newLogin", new LoginUser());
	    return "index.jsp";
	    
	}
	 
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {
	     
		User user = userService.register(newUser, result);
		
	    if(result.hasErrors()) {
	        // Be sure to send in the empty LoginUser before re-rendering the page.
	        model.addAttribute("newLogin", new LoginUser());
	        return "index.jsp";
	    }
	    
	    session.setAttribute("userId", user.getId());
	 
	    return "redirect:/books";
	}
	 
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model, HttpSession session) {
	     
		User user = userService.login(newLogin, result);
	 
	    if(result.hasErrors() || user==null) {
	        model.addAttribute("newUser", new User());
	        return "index.jsp";
	    }
	     
	    session.setAttribute("userId", user.getId());
	 
	    return "redirect:/books";
	}
	
	@GetMapping("/books")
    public String success(Model model, HttpSession session) {
    	if (session.getAttribute("userId")!=null) {
    		Long userId = (Long) session.getAttribute("userId");
    		User currentUser = userService.findById(userId);
    		List<Book> allBooks = bookService.AllBooks();
    		model.addAttribute("currentUser", currentUser);
    		model.addAttribute("allBooks", allBooks);
    		return "success.jsp";
    	}
    	return "redirect:/";
    }
//	
//	@GetMapping("/books")
//	public String success(HttpSession session, Model model) {
//	 
//		// If no userId is found, redirect to logout
//		if(session.getAttribute("userId") == null) {
//			return "redirect:/logout";
//		}
//		
//		// We get the userId from our session (we need to cast the result to a Long as the 'session.getAttribute("userId")' returns an object
//		Long userId = (Long) session.getAttribute("userId");
//		model.addAttribute("user", userService.findById(userId));
//		
//	    return "success.jsp";
//	    
//	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
	 
		// Set userId to null and redirect to login/register page
		session.setAttribute("userId", null);
	     
	    return "redirect:/";
	}
	
    @GetMapping("/books/new")
    public String addBook(Model model, HttpSession session, @ModelAttribute("book") Book book) {
    	Long userId = (Long) session.getAttribute("userId");
		User user = userService.findById(userId);
		model.addAttribute("user", user);
    	return "newbook.jsp";
    }
    
    @PostMapping("/books/new")
    public String createBook(@Valid @ModelAttribute("book") Book book, BindingResult result) {
    	if (result.hasErrors()) {
    		return "newbook.jsp";
    	}
    	bookService.createBook(book);
    	return "redirect:/books";
    }
    @GetMapping("/books/{id}")
    public String showBook(@PathVariable("id") Long id, Model model, HttpSession session) {
    	Long userId = (Long) session.getAttribute("userId");
    	Book book = bookService.findBook(id);
    	User reader = userService.findById(userId);
    	model.addAttribute("book", book);
    	model.addAttribute("userId", userId);
    	model.addAttribute("reader", reader);
    	return "showbook.jsp";
    }
	 @GetMapping("/books/{id}/edit")
	    public String edit(@PathVariable("id") Long id, Model model, HttpSession session) {
			Book book = bookService.findBook(id);
		 	if (session.getAttribute("userId")==null || session.getAttribute("userId")!=book.getUser().getId()) {
	    		return "redirect:/";
	    	}
	        model.addAttribute("book", book);
	        return "editbook.jsp";
	    }
	    
	 @PutMapping("/books/{id}")
	    public String update(@Valid @ModelAttribute("book") Book book, BindingResult result, HttpSession session) {
		 	if (session.getAttribute("userId")==null || session.getAttribute("userId")!=book.getUser().getId()) {
	    		return "redirect:/";
	    	}
	        if (result.hasErrors()) {
	            return "editbook.jsp";
	        }
	        bookService.updateBook(book);
	        return "redirect:/books";
	  }
	  @DeleteMapping("/books/{id}")
	    public String destroy(@PathVariable("id") Long id, HttpSession session) {
		  Book book = bookService.findBook(id);
		  if (session.getAttribute("userId")==null || session.getAttribute("userId")!=book.getUser().getId()) {
	    		return "redirect:/";
	    	}
		  bookService.deleteBook(id);
	      return "redirect:/books";
	    }
	  
	  @GetMapping("/bookmarket")
	  public String bookMarket(Model model, HttpSession session) {
		  if (session.getAttribute("userId")!=null) {
	    		Long userId = (Long) session.getAttribute("userId");
	    		User currentUser = userService.findById(userId);
	    		List<Book> allBooks = bookService.AllBooks();
	    		List<Book> restBooks = bookService.restBooks();
	    		model.addAttribute("currentUser", currentUser);
	    		model.addAttribute("allBooks", allBooks);
	    		model.addAttribute("restBooks", restBooks);
	    		return "bookmarket.jsp";
		  }
		  return "redirect:/";
	    }
	  @GetMapping("/bookmarket/borrow/{id}")
	  public String borrow(@PathVariable("id") Long id, HttpSession session) {
		  Book book = bookService.findBook(id);
		  Long userId = (Long) session.getAttribute("userId");
  		  User currentUser = userService.findById(userId);
  		  book.setBorrower(currentUser);
  		  bookService.updateBook(book);
		  return "redirect:/bookmarket";
	  }
	  @GetMapping("/bookmarket/return/{id}")
	  public String unBorrow(@PathVariable("id") Long id, HttpSession session) {
		  Book book = bookService.findBook(id);
  		  book.setBorrower(null);
  		  bookService.updateBook(book);
		  return "redirect:/bookmarket";
	  }

}