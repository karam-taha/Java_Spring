package com.axsos.ProjectManager.Repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.axsos.ProjectManager.Models.Project;
import com.axsos.ProjectManager.Models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    
	List<User> findAll();
	Optional<User> findByEmail(String email);
	User findByIdIs(Long id);
	List<User> findAllByProjects(Project project);
	List<User> findByProjectsNotContains(Project project);
    
}
