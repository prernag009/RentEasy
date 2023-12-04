package com.springboot.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.springboot.web.model.LoginForm;
import com.springboot.web.model.Owner;
import com.springboot.web.model.Property;
import com.springboot.web.model.Tenant;
import com.springboot.web.service.OwnerService;
import com.springboot.web.service.TenantService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
	@Autowired
	private OwnerService ownerservice;

	@Autowired
	private TenantService tenantservice;

	@GetMapping({ "/", "/homepage" })
	public String showHomePage(HttpSession session, Model model) {
		String name = (String) session.getAttribute("name");
		model.addAttribute("name", name != null ? name : " ");
		return "homepage";
	}
	
	@GetMapping("/about" )
	public String showAboutPage() {
		return "about";
	}

	@GetMapping("/login")
	public String showLoginForm(Model model) {
		model.addAttribute("loginForm", new LoginForm());
		return "login";
	}

	@PostMapping("/login")
	public String processLogin(@ModelAttribute("loginForm") LoginForm loginForm, HttpSession session, Model model,RedirectAttributes redirectAttributes) {
		String email = loginForm.getEmail();
		String password = loginForm.getPassword();
		String userType = loginForm.getUserType();

		if (userType.equals("ownobj")) {
			Owner ownobj = ownerservice.getOwnerByEmail(email);
			if (ownobj != null && ownobj.getPassword().equals(password)) {
				session.setAttribute("name", ownobj.getName());
				session.setAttribute("role", "owner");
				return "redirect:/homepage";
			}
		} else if (userType.equals("tenobj")) {
			Tenant tenobj = tenantservice.getTenantByEmail(email);
			if (tenobj != null && tenobj.getPassword().equals(password)) {
				session.setAttribute("name", tenobj.getName());
				session.setAttribute("role", "tenant");
				return "redirect:/homepage";
			}
		}
		 redirectAttributes.addFlashAttribute("loginError", "Invalid email or password or both. Please try again.");
		return "redirect:/login";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/homepage";
	}
	
	 @GetMapping("/profile")
	 public String userDetails(HttpSession session, Model model) {
		    Object roleAttribute = session.getAttribute("role");
		    if (roleAttribute != null) {
		        String role = roleAttribute.toString();

		        if ("owner".equals(role)) {
		            // Fetch owner details and their listed properties
		            Owner owner = ownerservice.getOwnerByName(session.getAttribute("name").toString());
		            List<Property> ownerProperties = ownerservice.getPropertiesForOwner(owner);

		            // Add owner and properties to the model
		            model.addAttribute("owner", owner);
		            model.addAttribute("ownerProperties", ownerProperties);
		            model.addAttribute("userType", "owner");

		            // Return the owner details view (create an appropriate view for displaying owner details)
		            return "profile"; // Update this with your view name
		        } else if ("tenant".equals(role)) {
		            // Fetch tenant details
		            Tenant tenant = tenantservice.getTenantByName(session.getAttribute("name").toString());

		            // Add tenant to the model
		            model.addAttribute("tenant", tenant);
		            model.addAttribute("userType", "tenant");

		            // Return the tenant details view (create an appropriate view for displaying tenant details)
		            return "profile"; // Update this with your view name
		        }
		    }

		    return "redirect:/homepage";
		}
}
