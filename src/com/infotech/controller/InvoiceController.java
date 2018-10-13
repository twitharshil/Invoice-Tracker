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
import com.infotech.dto.PurchaseOrder;
import com.infotech.service.UserDetailsService;

@Controller
@RequestMapping(value="/invoice/")
public class InvoiceController {
	
	@Autowired
	private UserDetailsService userService;

	public UserDetailsService getUserService() {
		return userService;
	}

	public void setUserService(UserDetailsService userService) {
		this.userService = userService;
	}
	
	@RequestMapping(value="/")
	public ModelAndView showInvoice(HttpServletRequest request, HttpServletResponse response){
		ModelAndView model = new ModelAndView("invoice");
		
		List<PurchaseOrder> listDescription = userService.fetchPurchaseOrder();
	    System.out.println("listDescription===="+listDescription.get(0).getDescription());
	    request.setAttribute("Description", listDescription);
	    
		model.addObject("invoice", new Invoice());
		return model;
	}
	
	@RequestMapping(value="/invoiceRegister", method = RequestMethod.POST)
	public ModelAndView addInvoice(HttpServletRequest request, HttpServletResponse response, @ModelAttribute Invoice invoice){
		
		ModelAndView model = null;
		
		Boolean User1 = userService.invoiceRegister(invoice);
		 model = new ModelAndView("redirect:/invoice/");
		if(User1==true){
			
			model.addObject("message","Invoice Sucessfully Created");
		}
		else{
			
			model.addObject("message","Session Time Expired!");
			
		}
			
		 return model;
	}
	
	
}



