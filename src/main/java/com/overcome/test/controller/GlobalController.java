package com.overcome.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller 
public class GlobalController {

	@RequestMapping("/login")
	public ModelAndView showLogin() {
		return new ModelAndView("page.login");
	}
}
