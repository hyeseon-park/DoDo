package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member")
public class MemberController {

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String showLoginForm() {
		return "/member/loginForm";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String showJoinForm() {
		return "/member/joinForm";
	}

}
