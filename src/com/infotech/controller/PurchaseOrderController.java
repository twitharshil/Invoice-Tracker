package com.infotech.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.infotech.dto.ClientManager;
import com.infotech.dto.Organization;
import com.infotech.dto.PurchaseOrder;
import com.infotech.service.UserDetailsService;

@Controller
@RequestMapping(value="/purchaseorder/")
public class PurchaseOrderController {
	
	@Autowired
	private UserDetailsService userService;
	

	public UserDetailsService getUserService() {
		return userService;
	}

	public void setUserService(UserDetailsService userService) {
		this.userService = userService;
	}
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView showPurchaseOrder(HttpServletRequest request, HttpServletResponse response){
	ModelAndView model = new ModelAndView("purchaseorder");
	
	List<Organization> listOrgName = userService.fetchOrganizationName();
    System.out.println("listOrgName===="+listOrgName.get(0).getOrgName());
    request.setAttribute("OrganizationName", listOrgName);
    
    List<ClientManager> listClientSpoc = userService.fetchClient();
    System.out.println("listClientSpoc===="+listClientSpoc.get(0).getClientSpoc());
    request.setAttribute("ClientName", listClientSpoc);
	
	
	return model;
	}
	
	@RequestMapping(value = {"/PoRegisterProcess"}, method=RequestMethod.POST)
	public ModelAndView addPurchaseOrder(HttpServletRequest request, HttpServletResponse response, @ModelAttribute PurchaseOrder purchaseOrder)
	{	
        ModelAndView model = null;
		
		Boolean User1 = userService.PoRegister(purchaseOrder);
		 model = new ModelAndView("redirect:/purchaseorder/");
		if(User1==true){
			
			model.addObject("message","PO Sucessfully Created");
		}
		
		 return model;
	}
	
	@RequestMapping(value="/fetchDropdown", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String Submit(@RequestParam("orgId") String orgId) {
	    // your logic here
	    return orgId;
	    }
	
	public List<ClientManager> ShowDropDown(HttpServletRequest request, HttpServletResponse response, @RequestBody ClientManager clientManager)
	{
		
		List<ClientManager> listClientSpoc = userService.fetchClientDropdown(clientManager);
	    System.out.println("listClientSpoc===="+listClientSpoc.get(0).getClientSpoc());
	    request.setAttribute("ClientName", listClientSpoc);
		
		
		return listClientSpoc;
	}
	
}
