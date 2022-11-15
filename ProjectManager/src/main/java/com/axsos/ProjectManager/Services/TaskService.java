package com.axsos.ProjectManager.Services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.axsos.ProjectManager.Models.Task;
import com.axsos.ProjectManager.Repository.TaskRepository;

@Service
public class TaskService {
	private final TaskRepository taskRepository;
	
	public TaskService(TaskRepository taskRepository) {
		this.taskRepository = taskRepository;
	}
	
	public List<Task> allTasks(){
		return taskRepository.findAll();
	}
	
	public List<Task> projectTasks(Long projectId){
		return taskRepository.findByProjectIdIs(projectId);
	}
	
	public Task addTask(Task task) {
		return taskRepository.save(task);
	}
	
	public void deleteTask(Task task) {
		taskRepository.delete(task);
	}
}
