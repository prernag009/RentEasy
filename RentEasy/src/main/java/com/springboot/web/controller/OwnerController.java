package com.springboot.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.springboot.web.model.Owner;
import com.springboot.web.service.OwnerService;

import jakarta.servlet.http.HttpSession;

@Controller
public class OwnerController {
	@Autowired
	private OwnerService ownerservice;
	
	@GetMapping("/Registration")
	public String showOwnerSignupForm(Model model) {
		model.addAttribute("ownobj", new Owner());
	    return "Registration";
	}
	
	@PostMapping("/Registration")
	public String addOwner(@ModelAttribute("ownobj") Owner ownobj, Model model,HttpSession session)
	{
		ownerservice.addOwner(ownobj);
		session.setAttribute("name", ownobj.getName());
		session.setAttribute("role", "owner");
		return "redirect:/homepage";
	}
}
