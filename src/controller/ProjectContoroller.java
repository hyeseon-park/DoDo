package controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Alarm;
import model.Member;
import model.Project;
import service.AlarmService;
import service.MemberService;
import service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectContoroller {
	
	@Autowired
	private ProjectService projectService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private AlarmService alarmService;
	@Autowired
	private SimpMessagingTemplate smt;

	
	@RequestMapping("/main")
	public String showProjectMain(Principal principal ,HttpSession session, Model model) {
		String memberId = principal.getName();
		Member member = memberService.getMemberByMId(memberId);
		session.setAttribute("member", member);
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
	
	@RequestMapping(value = "/exitProject")
	public String exitProject(int pNum, Principal principal) {
		String memberId = principal.getName();
		Member member = memberService.getMemberByMId(memberId);
		projectService.deleteProjectMember(member.getmNum(), pNum);
		return "redirect:/project/main";
	}
	
	@RequestMapping(value = "/inviteMemberForm")
	public String inviteMemberForm(int pNum, Model model) {
		model.addAttribute("projectNum", pNum);
		return "/project/inviteMemberForm";
	}
	
	@ResponseBody
	@RequestMapping(value = "/searchMemberList", method = RequestMethod.GET)
	public List<Member> searchMemberList(String keyword) {
		return memberService.searchMemberList(keyword);
	}
	
	@RequestMapping(value = "/inviteMember", method = RequestMethod.POST)
	public String inviteMember(Alarm alarm) {
		int aNum = alarmService.addAlarm(alarm);
		smt.convertAndSend("/category/invite/"+alarm.getaMemberTo(),alarmService.getAlarm(aNum));
		return "redirect:/project/main";
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/showAlarmList")
	public List<Alarm> showAlarmList(int mNum){
		return alarmService.getAlarmList(mNum);
	}
	

	@RequestMapping(value = "/acceptInvite")
	public String acceptInvite(int aNum, int pNum, int mNum) {
		alarmService.acceptInviteAlarm(aNum, pNum, mNum);
		return "redirect:/project/main";
	}
	

	@RequestMapping(value = "/rejectInvite")
	public String rejectInvite(int aNum) {
		System.out.println("rejectInvite");
		alarmService.rejectInviteAlarm(aNum);
		return "redirect:/project/main";
	}
	
	
}
