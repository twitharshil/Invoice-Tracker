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

import com.infotech.dto.ClientManager;
import com.infotech.dto.Organization;
import com.infotech.dto.PurchaseOrder;
import com.infotech.service.UserDetailsService;

@Controller
@RequestMapping(value="/clientmanager/")
public class ClientManagerController {
	
	@Autowired
	private UserDetailsService userService;

	public UserDetailsService getUserService() {
		return this.userService;
	}

	public void setUserService(UserDetailsService userService) {
		this.userService = userService;
	}
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	  public ModelAndView showClientManager(HttpServletRequest request, HttpServletResponse response) {
		  ModelAndView model = new ModelAndView("clientmanager");
		  
		  List<Organization> listOrgName = userService.fetchOrganizationName();
		    System.out.println("listOrgName===="+listOrgName.get(0).getOrgName());
		    request.setAttribute("OrganizationName", listOrgName);
		  
		  model.addObject("clientmanager", new ClientManager());
		  return model;
		  }
		  
		  @RequestMapping(value = {"/clientRegisterProcess"}, method = RequestMethod.POST)
		  public ModelAndView addClientManager(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("clientmanager") ClientManager clientManager)
			  {
				  ModelAndView model = null;
				  Boolean user1 = userService.clientRegister(clientManager);
				  model = new ModelAndView("redirect:/clientmanager/");
				  if (user1==false){
					  
					    model.addObject("message", "It looks like, this email belongs to an existing accont. Try again with a different email address. ");  
				  }
				  else{

					  model.addObject("message","Client Sucessfully Created");
				  }
			  
			  return model ;
			  }
		
			
} 
