package com.protech.pharmaplus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

	@PostMapping("/adminlogin")
	public ModelAndView simple(@RequestParam String user, @RequestParam String pass) {

		ModelAndView view = new ModelAndView();

		if (user.equals("admin")) {
			if (pass.equals("admin")) {
				view.setViewName("/adminoperation");
				view.addObject("pass", "Login Success");
			} else {
				view.setViewName("/adminlogin");
				view.addObject("fail", "Enter proper Password");
			}
		} else {
			view.setViewName("/adminlogin");
			view.addObject("fail", "Enter proper Email");
		}

		return view;
	}

	@GetMapping("/")
	public ModelAndView home() {
		ModelAndView view = new ModelAndView();
		view.setViewName("/home");
		return view;
	}
}
