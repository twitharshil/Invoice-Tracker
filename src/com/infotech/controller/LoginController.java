package com.infotech.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.infotech.dto.ClientManager;
import com.infotech.dto.Invoice;
import com.infotech.dto.User;
import com.infotech.service.UserDetailsService;

@Controller
public class LoginController {
	

	@Autowired
    private UserDetailsService userService;

	public UserDetailsService getUserService() {
		return this.userService;
	}

	public void setUserService(UserDetailsService userService) {
		this.userService = userService;
	}
	
	@RequestMapping(value={"/"})
	public ModelAndView gologin(){
		ModelAndView model = new ModelAndView("login");
		return model;
	}
	
	
	@RequestMapping(value={"/loginProcess"}, method = RequestMethod.POST)
	public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("login") User login) {
			    ModelAndView mav = null;
			
			Boolean user1 = userService.validateUser(login);
			if (user1==true) {
			   if(login.getUsername().equals("admin@gmail.com"))
			   {
				mav = new ModelAndView("admin");
			    mav.addObject("username", login.getUsername());
			   }  
			   else{
				    mav = new ModelAndView("userpage");
				    
				    List<User> listUserClient = userService.userClientAssign(login);
				    System.out.println("listUserClient===="+listUserClient.get(0).getUserId());
				    request.setAttribute("User", listUserClient);
				    
				    mav.addObject("username", login.getUsername());    
			   }
			 } 
			else {
			    mav = new ModelAndView("login");
			    mav.addObject("message", "Username or Password is wrong!!");
			    
			    }
			return mav;
		}
	
	@RequestMapping(value="/invoiceStatusProcess", method=RequestMethod.POST)
	public ModelAndView ShowInvoiceStatus(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("invoiceStatus") Invoice invoice){
		ModelAndView model = null;
		userService.fetchInvoiceStatus(invoice);
		model = new ModelAndView("userPageProfile");
		
		List<Invoice> listInvoice = userService.fetchInvoiceStatus(invoice);
		System.out.println("listInvoice=="+listInvoice.get(0).getDescription());
		request.setAttribute("Invoice",listInvoice );
		
		return model;
	}
	
}

    	
