package controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Member;
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
		
		List<Map<String, Object>> projectInfo = new ArrayList<Map<String,Object>>();

		List<Project> projectList = projectService.getProjectList(mNum);
		
		for(int i=0;i<projectList.size();i++) {
			int pNum = projectList.get(i).getpNum();
			Map<String, Object> projectMap = new HashMap<String, Object>();
			projectMap.put("projectList", projectList.get(i));
			projectMap.put("projectMemberList", projectService.getProjectMemberList(pNum));
			projectInfo.add(projectMap);
		}
		
		model.addAttribute("projectInfo", projectInfo);
		return "/project/projectMain";
	}
	
	@RequestMapping("/projectAddForm")
	public String projectAddForm() {
		return "/project/projectAddForm";
	}
	
	@RequestMapping(value = "/addProject", method = RequestMethod.POST)
	public String createProject(Principal principal, Project project) {
		String memberId = principal.getName();
		int mNum = memberService.getMemberByMId(memberId).getmNum();
		projectService.addProject(project, mNum);
		return "redirect:/project/main";
	}
	
	@RequestMapping(value = "/projectModifyForm", method = RequestMethod.GET)
	public String projectModifyForm(int pNum, Model model) {
		model.addAttribute("project", projectService.getProject(pNum));		
		return "/project/projectModifyForm";
	}
	
	@RequestMapping(value = "/modifyProject")
	public String projectModify(Project project) {
		projectService.modifyProject(project);
		return "redirect:/project/main";
	}
	
	@RequestMapping(value = "/inviteMemberForm")
	public String inviteMemberForm() {
		return "/project/inviteMemberForm";
	}
	
	@ResponseBody
	@RequestMapping(value = "/searchMemberList", method = RequestMethod.GET)
	public List<Member> searchMemberList(String keyword) {
		return memberService.searchMemberList(keyword);
	}
	
	@RequestMapping(value = "/inviteMember", method = RequestMethod.POST)
	public void inviteMember(String keyword) {
		System.out.println(keyword);
		
	}
	
}
