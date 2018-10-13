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
import com.sun.security.ntlm.Client;

@Controller
@RequestMapping(value="/clientProfile/")
public class ClientProfileController {
	
	@Autowired
	private UserDetailsService userService;

	public UserDetailsService getUserService() {
		return this.userService;
	}

	public void setUserService(UserDetailsService userService) {
		this.userService = userService;
	}
	
	 @RequestMapping(value="/", method = RequestMethod.GET)
	  public ModelAndView showClientProfile(HttpServletRequest request, HttpServletResponse response) {
		  ModelAndView model = new ModelAndView("clientProfile");
		  
		  
		  List<Organization> listOrgName = userService.fetchOrganizationName();
		  System.out.println("listOrgName===="+listOrgName.get(0).getOrgName());
		  request.setAttribute("OrganizationName", listOrgName);
		    
		  List<ClientManager> listClient = userService.fetchClient();
		  System.out.println("listClient==="+listClient.get(0).getClientSpoc());
		  request.setAttribute("Client", listClient);
		    
		  List<PurchaseOrder> listDescription = userService.fetchPurchaseOrder();
		  System.out.println("listDescription==="+listDescription.get(0).getDescription());
		  request.setAttribute("Description", listDescription);
		  
		  
		  model.addObject("clientProfile", new Organization());
		  return model;
	}
	
	@RequestMapping(value="/clientProfileProcess", method = RequestMethod.POST)
	public ModelAndView ShowProfile(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("clientProfile") ClientManager clientManager ){
		ModelAndView model = new ModelAndView();
		userService.fetchClient();
		model = new ModelAndView("clientProfileShow");
		
		List<ClientManager> listClient = userService.fetchClientProfile(clientManager);
		System.out.println("listClient==="+listClient.get(0).getClientSpoc());
		request.setAttribute("Client", listClient);
		
		
		return model;
	}
	
}
