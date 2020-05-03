package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/project")
public class ProjectContoroller {

	@RequestMapping("/main")
	public String showProjectMain() {
		return "/project/projectMain";
	}
}
