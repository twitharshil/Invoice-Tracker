package com.infotech.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.infotech.dto.Invoice;
import com.infotech.dto.UserManager;
import com.infotech.service.UserDetailsService;

@Controller
@RequestMapping(value="/userProfile/")
public class UserProfileController {
	
	@Autowired
	private UserDetailsService userService;

	public UserDetailsService getUserService() {
		return this.userService;
	}

	public void setUserService(UserDetailsService userService) {
		this.userService = userService;
	}
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView ShowUserProfile(HttpServletRequest request, HttpServletResponse response){
		ModelAndView model = new ModelAndView("userProfile");
		
		List<UserManager> listUser = userService.fetchUser();
		System.out.println("listUser=="+listUser.get(0).getName());
		request.setAttribute("User", listUser);
		
		return model;
	}
	
	@RequestMapping(value="/userShowProcess", method = RequestMethod.POST)
	public ModelAndView ShowUser(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("userShow") UserManager userManager){
		ModelAndView model = null;
		
		model = new ModelAndView("userShow");
		
		List<UserManager> listUser = userService.fetchUserProfile(userManager);
		System.out.println("listUser=="+listUser.get(0).getName());
		request.setAttribute("User",listUser );
		
		List<UserManager> listClient = userService.clientAssigned(userManager);
		System.out.println("listClient=="+listClient.get(0).getClientSpoc());
		request.setAttribute("Client",listClient );
		
		return model;
	}

}
