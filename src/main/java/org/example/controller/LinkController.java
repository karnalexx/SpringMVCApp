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
	
	@RequestMapping(value="/user")
	public String getUserPage() {
		return "user";
	}
	
	@RequestMapping(value="/admin")
	public String getAdminPage() {
		return "admin";
	}

    @RequestMapping(value="/manager")
    public String getManagerPage() {
        return "manager";
    }
}
