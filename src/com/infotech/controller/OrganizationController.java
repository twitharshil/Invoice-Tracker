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

import com.infotech.dto.Country;
import com.infotech.dto.Organization;
import com.infotech.dto.State;
import com.infotech.service.UserDetailsService;

@Controller
@RequestMapping(value="/organization/")
public class OrganizationController {
	
	@Autowired
	private UserDetailsService userService;

	public UserDetailsService getUserService() {
		return userService;
	}

	public void setUserService(UserDetailsService userService) {
		this.userService = userService;
	}
	
	 @RequestMapping(value="/", method = RequestMethod.GET)
	  public ModelAndView showOrganization(HttpServletRequest request, HttpServletResponse response) {
		  ModelAndView model = new ModelAndView("organization");
		 
		  List<Country> listCountry = userService.fetchCountry();
		  System.out.println("listCountry===="+listCountry.get(0).getCountry());
		  request.setAttribute("CountryName", listCountry);
		    
		  List<State> listState = userService.fetchState();
		  System.out.println("listState===="+listState.get(0).getState());
		  request.setAttribute("StateName", listState);
		  
		  model.addObject("organization", new Organization());
		  return model;
		  }
	@RequestMapping(value="/organizationProcess")
	
	public ModelAndView Addorganization(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("organization") Organization organization)
	{
		ModelAndView model = null;
		Boolean User1=userService.orgRegister(organization);
		 model = new ModelAndView("redirect:/organization/");
		if(User1==true){
			
			 model.addObject("message", "Organization Sucessfully Created");
		  }
		  else{
			 
			  model.addObject("message","It looks like, this organization already exists.");
		  }  
		return model;
	}
}
