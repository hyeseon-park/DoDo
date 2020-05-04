package controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.Project;
import service.MemberService;
import service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectContoroller {
	
	@Autowired
	private ProjectService projectService;
	@Autowired
	private MemberService memberService;

	
	@RequestMapping("/main")
	public String showProjectMain(Principal principal, Model model) {
		String memberId = principal.getName();
		int mNum = memberService.getMemberByMId(memberId).getmNum();
		model.addAttribute("projectList", projectService.getProjectList(mNum));
		return "/project/projectMain";
	}
	
	@RequestMapping("/projectForm")
	public String showProjectForm() {
		return "/project/projectForm";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String createProject(Principal principal, Project project) {
		String memberId = principal.getName();
		int mNum = memberService.getMemberByMId(memberId).getmNum();
		projectService.addProject(project, mNum);
		return "redirect:/project/main";
	}
}
