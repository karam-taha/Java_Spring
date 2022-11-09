package com.axsos.ProductsCategories.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.axsos.ProductsCategories.models.Category;
import com.axsos.ProductsCategories.models.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long>{
	
    List<Product> findAll();
    Product findByIdIs(Long id);
    List<Product> findAllByCategories(Category category);
	List<Product> findByCategoriesNotContains(Category category);
}
