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
import org.springframework.web.bind.annotation.RequestParam;
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

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String showProjectMain(Principal principal, HttpSession session, Model model) {
		String memberId = principal.getName();
		Member member = memberService.getMemberByMId(memberId);
		int mNum = member.getmNum();
		session.setAttribute("member", member);

		List<Map<String, Object>> projectInfoList = new ArrayList<Map<String, Object>>();
		List<Project> projectList = projectService.getProjectList(mNum);
		for (Project project : projectList) {
			int pNum = project.getpNum();
			Map<String, Object> projectInfo = new HashMap<String, Object>();
			projectInfo.put("project", project);
			projectInfo.put("projectMemberList", memberService.getProjectMemberListExceptMe(pNum, mNum));
			projectInfoList.add(projectInfo);
		}

		model.addAttribute("projectInfoList", projectInfoList);
		return "/project/projectMain";
	}

	@RequestMapping(value = "/projectAddForm", method = RequestMethod.GET)
	public String showProjectAddForm() {
		return "/project/projectAddForm";
	}

	@RequestMapping(value = "/addProject", method = RequestMethod.POST)
	public String addProject(HttpSession session, Project project) {
		Member member = (Member) session.getAttribute("member");
		projectService.addProject(project, member.getmNum());
		return "redirect:/project/main";
	}

	@RequestMapping(value = "/projectModifyForm", method = RequestMethod.GET)
	public String showProjectModifyForm(@RequestParam(value = "pNum") int pNum, Model model) {
		model.addAttribute("project", projectService.getProject(pNum));
		return "/project/projectModifyForm";
	}

	@RequestMapping(value = "/modifyProject", method = RequestMethod.POST)
	public String modifyProject(Project project) {
		projectService.modifyProject(project);
		return "redirect:/project/main";
	}

	@RequestMapping(value = "/removeProject", method = RequestMethod.GET)
	public String removeProject(HttpSession session, int pNum) {
		Member member = (Member) session.getAttribute("member");
		List<Alarm> alarmList = alarmService.getAlarmListByPNum(pNum);
		projectService.removeProjectMember(member.getmNum(), pNum);
		for (Alarm alarm : alarmList) {
			smt.convertAndSend("/category/invite/" + alarm.getaMemberTo(), "");
		}
		return "redirect:/project/main";
	}

	@RequestMapping(value = "/inviteProjectMemberForm", method = RequestMethod.GET)
	public String inviteProjectMemberForm(@RequestParam(value = "pNum") int pNum, Model model) {
		model.addAttribute("projectNum", pNum);
		return "/project/projectMemberInviteForm";
	}

	@RequestMapping(value = "/inviteProjectMember", method = RequestMethod.POST)
	public String inviteProjectMember(Alarm alarm) {
		alarmService.addAlarm(alarm);
		smt.convertAndSend("/category/invite/" + alarm.getaMemberTo(), "");
		return "redirect:/project/main";
	}

	@ResponseBody
	@RequestMapping(value = "/searchMemberList", method = RequestMethod.GET)
	public List<Member> searchMemberList(@RequestParam(value = "keyword") String keyword, @RequestParam(value = "pNum") int pNum) {
		return memberService.searchMemberList(keyword, pNum);
	}

	@ResponseBody
	@RequestMapping(value = "/showAlarmList", method = RequestMethod.GET)
	public List<Alarm> showAlarmList(int mNum) {
		return alarmService.getAlarmList(mNum);
	}

	@RequestMapping(value = "/acceptInvite", method = RequestMethod.GET)
	public String acceptInvite(int aNum, int pNum, int mNum) {
		alarmService.acceptInviteAlarm(aNum, pNum, mNum);
		return "redirect:/project/main";
	}

	@RequestMapping(value = "/rejectInvite", method = RequestMethod.GET)
	public String rejectInvite(int aNum) {
		alarmService.rejectInviteAlarm(aNum);
		return "redirect:/project/main";
	}

}
