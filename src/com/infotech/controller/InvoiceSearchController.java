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
import com.infotech.service.UserDetailsService;

@Controller
@RequestMapping(value="/invoiceSearch/")
public class InvoiceSearchController {
	
	@Autowired
	private UserDetailsService userService;

	public UserDetailsService getUserService() {
		return userService;
	}

	public void setUserService(UserDetailsService userService) {
		this.userService = userService;
	}
	
	@RequestMapping(value="/")
	public ModelAndView showSearchPage(HttpServletRequest request, HttpServletResponse response){
		ModelAndView model = new ModelAndView("invoiceSearch");
		model.addObject("invoiceSearch", new Invoice());
		return model;
	}
	
	@RequestMapping(value="/invoiceSearch", method=RequestMethod.POST)
	public ModelAndView showSearch(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("invoiceSearch") Invoice invoice)
	{
		ModelAndView model = null;
		userService.fetchInvoiceProfile();
		model = new ModelAndView("invoiceSearchShow");
		
		List<Invoice> listInvoice = userService.fetchInvoiceSearch(invoice);
		System.out.println("listInvoice==="+listInvoice.get(0).getDescription());
		request.setAttribute("Invoice", listInvoice);
		
		return model;
	}
}
