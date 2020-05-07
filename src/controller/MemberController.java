package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Member;
import service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	MemberService memberService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String showLoginForm() {
		return "/member/loginForm";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String showJoinForm() {
		return "/member/joinForm";
	}

	@RequestMapping(value = "/joinMember", method = RequestMethod.POST)
	public String joinMember(Member member) {
		memberService.joinMember(member);
		return "redirect:login";
	}

	@ResponseBody
	@RequestMapping(value = "/checkDuplication", method = { RequestMethod.POST, RequestMethod.GET })
	public boolean checkDuplication(@RequestParam(value = "mId") String mId) {
		if (memberService.getMemberByMId(mId) != null) {
			return true;
		} else {
			return false;
		}
	}
}
