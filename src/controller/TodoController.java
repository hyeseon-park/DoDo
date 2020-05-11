package controller;

import java.util.ArrayList;
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

import model.Member;
import model.Project;
import model.Todo;
import service.MemberService;
import service.ProjectService;
import service.TodoService;

@Controller
@RequestMapping("/todo")
public class TodoController {
	@Autowired
	private TodoService todoService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ProjectService projectService;

	@RequestMapping("/main")
	public String showTodoMain(HttpSession session, Model model, @RequestParam(value = "pNum") int pNum) {
		Map<String, List<Todo>> todoMap = new HashMap<String, List<Todo>>();
		List<Member> projectMemberList = projectService.getProjectMemberList(pNum);
		List<Todo> todoList = todoService.getTodoByPNum(pNum);

		for (int i = 0; i < projectMemberList.size(); i++) {
			List<Todo> todoListPerMember = new ArrayList<Todo>();
			todoMap.put(projectMemberList.get(i).getmId(), todoListPerMember);
		}

		for (int i = 0; i < todoList.size(); i++) {
			int mNum = todoList.get(i).getmNum();
			String mId = memberService.getMemberByMNum(mNum).getmId();

			List<Todo> todoListPerMember = todoMap.get(mId);
			todoListPerMember.add(todoList.get(i));
			todoMap.put(mId, todoListPerMember);
		}

		model.addAttribute("todoMap", todoMap);
		model.addAttribute("progress", projectService.getProject(pNum).getpProgress());
		session.setAttribute("pNum", pNum);
		return "/todo/todoMain";
	}

	@RequestMapping(value = "/todoAddForm", method = RequestMethod.GET)
	public String showTodoAddForm(HttpSession session, Model model, @RequestParam(value = "mId") String mId) {

		int pNum = (int) session.getAttribute("pNum");
		List<Member> projectMemberList = projectService.getProjectMemberList(pNum);

		model.addAttribute("mNum", memberService.getMemberByMId(mId).getmNum());
		model.addAttribute("pNum", pNum);
		model.addAttribute("projectMemberList", projectMemberList);

		return "/todo/todoAddForm";
	}

	@RequestMapping(value = "/addTodo", method = RequestMethod.POST)
	public String addTodo(HttpSession session, Todo todo) {
		todoService.addTodo(todo);
		int pNum = (int) session.getAttribute("pNum");
		return "redirect:main?pNum=" + pNum;
	}

	@RequestMapping(value = "/todoModifyForm", method = RequestMethod.GET)
	public String showTodoModifyForm(HttpSession session, Model model, @RequestParam(value = "tNum") int tNum) {

		int pNum = (int) session.getAttribute("pNum");
		List<Member> projectMemberList = projectService.getProjectMemberList(pNum);
		Todo todo = todoService.getTodoByTNum(tNum);
		model.addAttribute("todo", todo);
		model.addAttribute("mNum", todo.getmNum());
		model.addAttribute("projectMemberList", projectMemberList);

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

	@ResponseBody
	@RequestMapping("/getCompleteProgress")
	public Map<String, Object> getCompleteProgress(@RequestParam(value = "tNum") int tNum) {
		Map<String, Object> progressMap = new HashMap<String, Object>();

		Todo todo = todoService.getTodoByTNum(tNum);
		if (todo.gettIsComplete() == 0) {
			todo.settIsComplete(1);
		} else {
			todo.settIsComplete(0);
		}
		todoService.modifyTodo(todo);

		int pNum = todo.getpNum();
		List<Todo> todoList = todoService.getTodoByPNum(pNum);

		int allTodoCount = todoList.size();
		int completedTodoCount = 0;
		for (Todo t : todoList) {
			if (t.gettIsComplete() == 1) {
				completedTodoCount++;
			}
		}

		double progress = calculateProgress(pNum, completedTodoCount, allTodoCount);
		progressMap.put("tIsComplete", todo.gettIsComplete());
		progressMap.put("progress", progress);
		return progressMap;
	}

	public double calculateProgress(int pNum, int completedTodo, int allTodo) {
		double progress = Math.round(((double) completedTodo / allTodo * 100) * 10) / 10.0;
		Project project = projectService.getProject(pNum);
		project.setpProgress(progress);
		projectService.modifyProject(project);
		return progress;
	}

	@ResponseBody
	@RequestMapping("/resortTodo")
	public void resortTodo(@RequestParam(value = "priorityArray[]") List<Integer> priorityArray, @RequestParam(value = "pNum") int pNum, @RequestParam(value = "mId") String mId) {
		int mNum = memberService.getMemberByMId(mId).getmNum();
		List<Todo> todoList = todoService.getTodoByPNumAndMNum(pNum, mNum);

		for (int i = 0; i < todoList.size(); i++) {
			Todo todo = todoList.get(i);
			int tNum = todo.gettNum();
			int tIndex = priorityArray.indexOf(tNum);
			todo.settPriority(tIndex);
			todoService.modifyTodo(todo);
		}
	}
}
