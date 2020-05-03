package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.TodoDao;
import model.Todo;

@Service
public class TodoService {
	@Autowired
	TodoDao todoDao;

	public boolean addTodo(Todo todo) {
		if(todoDao.insertTodo(todo) > 0) {
			return true;
		}
		return false;
	}

	public boolean modifyTodo(Todo todo) {
		if(todoDao.updateTodo(todo) > 0) {
			return true;
		}
		return false;
	}
}
