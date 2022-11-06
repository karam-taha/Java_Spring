package com.axsos.BooksAPI.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.axsos.BooksAPI.models.Book;
import com.axsos.BooksAPI.services.BookService;

@Controller
public class BookController {
	@Autowired
	BookService bookService;
	
	@GetMapping("/books")
	public String index(Model model) {
		
		List<Book> books = bookService.allBooks();
		model.addAttribute("books", books);
		
		return "/show.jsp";
	}
		
}
