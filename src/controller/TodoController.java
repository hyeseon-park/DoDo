package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/todo")
public class TodoController {

	@RequestMapping("/main")
	public String showTodoMain() {
		return "/todo/todoMain";
	}

}
