package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Todo;
import service.TodoService;

@Controller
@RequestMapping("/todo")
public class TodoController {
	@Autowired
	private TodoService todoService;

	@RequestMapping("/main")
	public String showTodoMain() {
		return "/todo/todoMain";
	}

	@RequestMapping(value = "/addTodo", method = RequestMethod.POST)
	public String addTodo(Todo todo) {
		todoService.addTodo(todo);
		return "redirect:todoMain?pNum=" + todo.getpNum();
	}

	@RequestMapping(value = "/modifyTodo", method = RequestMethod.POST)
	public String modifyTodo(Todo todo) {
		todoService.modifyTodo(todo);
		return "redirect:todoMain?pNum=" + todo.getpNum();
	}

	@RequestMapping(value = "/removeTodo", method = RequestMethod.POST)
	public String removeTodo(int tNum, int pNum) {
		todoService.removeTodo(tNum);
		return "redirect:todoMain?pNum=" + pNum;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getTodoByTNum", method = RequestMethod.POST)
	public Todo getTodoByTNum(int tNum) {
		return todoService.getTodoByTNum(tNum);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getTodoByPNum", method = RequestMethod.POST)
	public List<Todo> getTodoByPNum(int pNum) {
		return todoService.getTodoByPNum(pNum);
	}
	
}
