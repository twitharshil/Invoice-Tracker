package com.infotech.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.infotech.dto.ClientManager;
import com.infotech.dto.UserManager;
import com.infotech.service.UserDetailsService;

@Controller
@RequestMapping(value = "/usermanager/")
public class UserManagerController {
	  @Autowired
	  private UserDetailsService userService;
	  
	  public UserDetailsService getUserService() {
		return this.userService;
	  }
	  
	  public void setUserService(UserDetailsService userService) {
		this.userService = userService;
	  }
			
			
	  @RequestMapping(value = "/", method = RequestMethod.GET)
	  public ModelAndView showUserManager(HttpServletRequest request, HttpServletResponse response) {
		  ModelAndView model = new ModelAndView("usermanager");
		  
		  List<ClientManager> listClientSpoc = userService.fetchClient();
		    System.out.println("listClientSpoc===="+listClientSpoc.get(0).getClientSpoc());
		    request.setAttribute("ClientName", listClientSpoc);
		    
		  
		  return model;
		  }
		  
		  @RequestMapping(value = "/registerProcess", method = RequestMethod.POST)
		  public ModelAndView addUserManager(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("usermanager") UserManager userManager)
			  {
			 
				  ModelAndView model = null;
				  Boolean user1 = userService.register(userManager);
				  model = new ModelAndView("redirect:/usermanager/");
				  if (user1==false){
					 
					    model.addObject("message", "It looks like, this email belongs to an existing accont. Try again with a different email address. ");  
				  }
				  else{
					  
					  model.addObject("message","User Sucessfully Created");
				  }
			  
			  return model ;
			  }		
} 
