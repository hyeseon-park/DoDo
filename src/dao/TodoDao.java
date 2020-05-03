package dao;

import model.Todo;

public interface TodoDao {
	
	public int insertTodo(Todo todo);
	public int updateTodo(Todo todo);
	
}
