package com.axsos.ProductsCategories.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.axsos.ProductsCategories.models.Category;
import com.axsos.ProductsCategories.models.Product;
import com.axsos.ProductsCategories.repositories.CategoryRepository;

@Service
public class CategoryService {
	@Autowired
	CategoryRepository categoryRepository;
	
	public List<Category> AllCategories(){
		return categoryRepository.findAll();
	}
	
	public List<Category> getAssignedProducts(Product product){
		return categoryRepository.findAllByProducts(product);
	}
	
	public List<Category> getUnassignedProducts(Product product){
		return categoryRepository.findByProductsNotContains(product);
	}
	
	public Category findCategory(Long id) {
		Optional<Category> optionalCategory = categoryRepository.findById(id);
		if(optionalCategory.isPresent()) {
			return optionalCategory.get();
		}else {
			return null;
		}
	}
	
	public Category AddCategory(Category category) {
		return categoryRepository.save(category);
	}
	
	public Category updateCategory(Category category) {
		return categoryRepository.save(category);
	}
	
	public void deleteCategory(Category category) {
		categoryRepository.delete(category);
	}
}
