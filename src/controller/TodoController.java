package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Todo;
import service.TodoService;

@Controller
@RequestMapping("/todo")
public class TodoController {
	@Autowired
	private TodoService todoService;

	@RequestMapping("/main")
	public String showTodoMain(HttpSession session, Model model, @RequestParam(value = "pNum") int pNum) {
		Map<Integer, Object> todoMap = new HashMap<Integer, Object>();
		List<Todo> todoList = todoService.getTodoByPNum(pNum);

		for (int i = 0; i < todoList.size(); i++) {
			int mNum = todoList.get(i).getmNum();
			List<Todo> todoListByMNum = todoService.getTodoByMNum(mNum);
			todoMap.put(mNum, todoListByMNum);
		}

		model.addAttribute("todoMap", todoMap);
		session.setAttribute("pNum", pNum);
		return "/todo/todoMain";
	}

	@RequestMapping(value = "/todoAddForm", method = RequestMethod.GET)
	public String showTodoAddForm() {
		return "/todo/todoAddForm";
	}

	@RequestMapping(value = "/addTodo", method = RequestMethod.POST)
	public String addTodo(HttpSession session, Todo todo) {
		todoService.addTodo(todo);
		int pNum = (int) session.getAttribute("pNum");
		return "redirect:main?pNum=" + pNum;
	}

	@RequestMapping(value = "/todoModifyForm", method = RequestMethod.GET)
	public String showTodoModifyForm(Model model, @RequestParam(value = "tNum") int tNum) {
		model.addAttribute("todo", todoService.getTodoByTNum(tNum));
		return "/todo/todoModifyForm";
	}

	@RequestMapping(value = "/modifyTodo", method = RequestMethod.POST)
	public String modifyTodo(HttpSession session, Todo todo) {
		todoService.modifyTodo(todo);
		int pNum = (int) session.getAttribute("pNum");
		return "redirect:main?pNum=" + pNum;
	}

	@RequestMapping(value = "/removeTodo")
	public String removeTodo(HttpSession session, @RequestParam(value = "tNum") int tNum) {
		todoService.removeTodo(tNum);
		int pNum = (int) session.getAttribute("pNum");
		return "redirect:main?pNum=" + pNum;
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

	@ResponseBody
	@RequestMapping(value = "/getTodoByMNum", method = RequestMethod.POST)
	public List<Todo> getTodoByMNum(int mNum) {
		return todoService.getTodoByMNum(mNum);
	}
}
