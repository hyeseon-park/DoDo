package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import model.Todo;

public interface TodoDao {
	public int insertTodo(Todo todo);
	public int updateTodo(Todo todo);
	public int deleteTodo(int tNum);
	public Todo selectTodoByTNum(int tNum);
	public List<Todo> selectTodoByPNum(int pNum);
	public List<Todo> selectTodoByMNum(int mNum);
	public List<Todo> selectTodoByPNumAndMNum(@Param("pNum") int pNum, @Param("mNum") int mNum);
}
