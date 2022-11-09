package com.axsos.ProductsCategories.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.axsos.ProductsCategories.models.Category;
import com.axsos.ProductsCategories.models.Product;
import com.axsos.ProductsCategories.repositories.ProductRepository;

@Service
public class ProductService {
	@Autowired
	ProductRepository productRepository;
	
	public List<Product> AllProducts(){
		return productRepository.findAll();
	}
	
	public List<Product> getAssignedCategories(Category category){
		return productRepository.findAllByCategories(category);
	}
	
	public List<Product> getUnassignedCategories(Category category){
		return productRepository.findByCategoriesNotContains(category);
	}
	
	public Product findProduct(Long id) {
		Optional<Product> optionalProduct = productRepository.findById(id);
		if(optionalProduct.isPresent()) {
			return optionalProduct.get();
		}else {
			return null;
		}
	}
	
	public Product AddProduct(Product product) {
		return productRepository.save(product);
	}
	
	public Product updateProduct(Product product) {
		return productRepository.save(product);
	}
	
	public void deleteProduct(Product product) {
		productRepository.delete(product);
	}
}
