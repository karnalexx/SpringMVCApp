package org.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class LinkController {

	@RequestMapping
	public String getHomePage() {
		return "home";
	}

    @RequestMapping("/index")
    public String getIndexPage() {
        return "home";
    }

	@RequestMapping("/user")
	public String getUserPage() {
		return "user";
	}

	@RequestMapping("/admin")
	public String getAdminPage() {
		return "admin";
	}
}
