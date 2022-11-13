package com.axsos.BookBroker.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.axsos.BookBroker.Models.Book;
import com.axsos.BookBroker.Repositories.BookRepository;

@Service
public class BookService {
	@Autowired
	BookRepository bookRepository;
	
	public List<Book> AllBooks(){
		return bookRepository.findAll();
	}
	
	public List<Book> restBooks(){
    	return bookRepository.findAllByBorrowerIsNull();
    }
	
	public Book createBook(Book book) {
		return bookRepository.save(book);
	}
	
	public Book updateBook(Book b) {
    	return bookRepository.save(b);
    }
    public void deleteBook(Long id) {
    	bookRepository.deleteById(id);
    }
	
	public Book findBook(Long id) {
		Optional<Book> optionalBook = bookRepository.findById(id);
		if(optionalBook.isPresent()) {
			return optionalBook.get();
		}else {
			return null;
		}
	}
}
