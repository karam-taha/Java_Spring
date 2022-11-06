package com.axsos.BooksAPI.controllers;

import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.axsos.BooksAPI.models.Book;
import com.axsos.BooksAPI.services.BookService;

@RestController
public class BooksApi {
private final BookService bookService;
	
	public BooksApi(BookService bookService) {
		this.bookService = bookService;
	}
	
	@RequestMapping("/api/books")
	public List<Book> index() {
		return bookService.allBooks();
	}
	
	@PostMapping("/api/books")
	public Book create(
			@RequestParam(value="title") String title, 
			@RequestParam(value="description") String desc, 
			@RequestParam(value="language") String lang, 
			@RequestParam(value="pages") Integer numOfPages){
		Book book = new Book(title, desc, lang, numOfPages);
		return bookService.createBook(book);
	}
	
	@RequestMapping("/api/books/{id}")
	public Book show(@PathVariable("id") Long id) {
		Book book = bookService.findBook(id);
		return book;
	}
	
	// to update a row in our database, we use the 'PUT' method
	// you will also need to change the Postman method to 'PUT' in order for this to work
	// the update process in Postman is very similar to adding rows with a 'POST' method
	@PutMapping("/api/books/{id}")
	// first we get the Book ID from our path, we then get the title, description, language, and pages values
    public Book update(@PathVariable("id") Long id, @RequestParam(value="title") String title, @RequestParam(value="description") String desc, @RequestParam(value="language") String lang, @RequestParam(value="pages") Integer numOfPages) {
		// we create a new Book object with the values we passed in
		Book book = new Book(title, desc, lang, numOfPages);
		// we then set the ID of the new Book object to equal the ID of the Book we are updating
		book.setId(id);
		// now we can use our bookService to update the book
		Book updatedBook = bookService.updateBook(book);
        return updatedBook;
    }
    
	// to delete a row, we must use the 'DELETE' method
	// in Postman, you will also have to use the 'DELETE' method
    @DeleteMapping("/api/books/{id}")
    // we only need the Book ID to delete the book in our bookService
    public void destroy(@PathVariable("id") Long id) {
        bookService.deleteBook(id);
    }
}

