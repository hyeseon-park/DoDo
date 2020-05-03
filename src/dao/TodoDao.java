package dao;

import java.util.List;

import model.Todo;

public interface TodoDao {
	
	public int insertTodo(Todo todo);
	public int updateTodo(Todo todo);
	public int deleteTodo(int tNum);
	public Todo selectTodoByTNum(int tNum);
	public List<Todo> selectTodoByPNum(int pNum);
	public List<Todo> selectTodoByMNum(int mNum);
	
}
