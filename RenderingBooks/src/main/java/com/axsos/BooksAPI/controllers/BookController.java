package com.axsos.BooksAPI.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.axsos.BooksAPI.models.Book;
import com.axsos.BooksAPI.services.BookService;

@Controller
public class BookController {
	@Autowired
	BookService bookService;
	
	@GetMapping("/books/3")
	public String index() {
		
//		System.out.println(id);
//		Book book = bookService.findBook(id);
//		System.out.println(book);
//		model.addAttribute("book", book);
		
		return "show.jsp";
	}
		
}
