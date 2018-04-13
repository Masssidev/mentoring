package net.skhu.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class HomeController {
	@RequestMapping("/403")
	public String accessDenied() {
	    return "access-denied";
	}
}
