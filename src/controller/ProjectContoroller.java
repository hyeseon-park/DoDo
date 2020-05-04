package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectContoroller {
	
	@Autowired
	private ProjectService projectService;

	
	@RequestMapping("/main")
	public String showProjectMain(Model model) {
		model.addAttribute("projectList", projectService.getProjectList(1));
		return "/project/projectMain";
	}
}
