package com.axsos.ProjectManager.Repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.axsos.ProjectManager.Models.Task;

@Repository
public interface TaskRepository extends CrudRepository<Task, Long> {
	List<Task> findAll();
	List<Task> findByProjectIdIs(Long id);
}
