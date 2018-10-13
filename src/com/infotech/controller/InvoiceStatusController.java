package com.infotech.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.infotech.dto.Invoice;
import com.infotech.dto.Organization;
import com.infotech.dto.PurchaseOrder;
import com.infotech.service.UserDetailsService;

@Controller
@RequestMapping(value="/invoiceStatus/")
public class InvoiceStatusController {
	
	@Autowired
	private UserDetailsService userService;

	public UserDetailsService getUserService() {
		return userService;
	}

	public void setUserService(UserDetailsService userService) {
		this.userService = userService;
	}
	
	@RequestMapping(value="/")
	public ModelAndView showinfo(HttpServletRequest request, HttpServletResponse response){
		ModelAndView model = new ModelAndView("invoiceStatus");
		
		List<Organization> listOrgName = userService.fetchOrganizationName();
	    System.out.println("listOrgName===="+listOrgName.get(0).getOrgName());
	    request.setAttribute("OrganizationName", listOrgName);
	    
	    List<PurchaseOrder> listDescription = userService.fetchPurchaseOrder();
	    System.out.println("listDescription===="+listDescription.get(0).getDescription());
	    request.setAttribute("Description", listDescription);
	    
	    List<Invoice> listInvoice = userService.fetchInvoiceProfile();
	    System.out.println("listInvoices===="+listInvoice.get(0).getDescription());
	    request.setAttribute("Invoice", listInvoice);
	    
		return model;
	}
	
	@RequestMapping(value="/invoiceStatusProcess", method=RequestMethod.POST)
	public ModelAndView ShowInvoiceStatus(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("invoiceStatus") Invoice invoice){
		ModelAndView model = null;
		userService.fetchInvoiceStatus(invoice);
		model = new ModelAndView("invoiceShow");
		
		List<Invoice> listInvoice = userService.fetchInvoiceStatus(invoice);
		System.out.println("listInvoice=="+listInvoice.get(0).getDescription());
		request.setAttribute("Invoice",listInvoice );
		
		return model;
	}
}
