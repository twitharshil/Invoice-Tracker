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
@RequestMapping(value="/poProfile/")
public class PoProfileController {
	
	@Autowired
	private UserDetailsService userService;

	public UserDetailsService getUserService() {
		return userService;
	}

	public void setUserService(UserDetailsService userService) {
		this.userService = userService;
	}
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public ModelAndView ShowPoProfile(HttpServletRequest request, HttpServletResponse response){
		ModelAndView model = new ModelAndView("poProfile");
		
		List<Organization> listOrganizations = userService.fetchOrganizationName();
		System.out.println("listOrganizations=="+listOrganizations.get(0).getOrgName());
		request.setAttribute("OrganizationName", listOrganizations);
		
		List<ClientManager> listClient = userService.fetchClient();
		System.out.println("listClient==="+listClient.get(0).getClientSpoc());
		request.setAttribute("Client", listClient);
		
		List<PurchaseOrder> listDescription = userService.fetchPurchaseOrder();
		System.out.println("listDescription==="+listDescription.get(0).getPoId());
		request.setAttribute("Description", listDescription);
		
		return model;
	}
	
	@RequestMapping(value="/poShowProcess", method=RequestMethod.POST)
	public ModelAndView ShowPo(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("poShow") PurchaseOrder purchaseOrder)
	{
		ModelAndView model = new ModelAndView();
		model = new ModelAndView("poShow");
		
		List<PurchaseOrder> listPo =  userService.fetchPurchaseOrder(purchaseOrder);
		System.out.println("listPo=="+listPo.get(0).getDescription());
		request.setAttribute("PurchaseOrder", listPo);
		
		
		return model;
	}
}
