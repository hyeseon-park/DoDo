package service;

import java.util.List;

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
	
	public boolean removeTodo(int tNum) {
		if(todoDao.deleteTodo(tNum) > 0) {
			return true;
		}
		return false;
	}
	
	public Todo getTodoByTNum(int tNum) {
		return todoDao.selectTodoByTNum(tNum);
	}
	
	public List<Todo> getTodoByPNum(int pNum) {
		return todoDao.selectTodoByPNum(pNum);
	}
	
	public List<Todo> getTodoByMNum(int mNum) {
		return todoDao.selectTodoByMNum(mNum);
	}

	public List<Todo> getTodoByPNumAndMNum(int pNum, int mNum) {
		return todoDao.selectTodoByPNumAndMNum(pNum, mNum);
	}
}
