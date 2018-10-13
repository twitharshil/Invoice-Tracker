package com.infotech.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.infotech.dao.UserDao;
import com.infotech.dto.ClientManager;
import com.infotech.dto.Country;
import com.infotech.dto.Invoice;
import com.infotech.dto.Organization;
import com.infotech.dto.PurchaseOrder;
import com.infotech.dto.State;
import com.infotech.dto.User;
import com.infotech.dto.UserManager;


public class UserDetailsServiceImpl implements UserDetailsService{

	@Autowired
	private UserDao userdao;
	public UserDao getUserdao() {
		return this.userdao;
	}

	public void setUserdao(UserDao userdao) {
		this.userdao = userdao;
	}

	
	@Override
	public Boolean validateUser(User login) {
		return  userdao.Validateuser(login) ;
	}

	@Override
	public Boolean register(UserManager userManager) {
		return userdao.register(userManager);
			
	}

	@Override
	public Boolean clientRegister(ClientManager clientManager) {
		return userdao.clientRegister(clientManager);
	}

	@Override
	public Boolean PoRegister(PurchaseOrder purchaseOrder) {
		return userdao.PoRegister(purchaseOrder);
	}

	@Override
	public Boolean invoiceRegister(Invoice invoice) {
		return userdao.invoiceRegister(invoice);
	}
	
	@Override
	public Boolean orgRegister(Organization organization) {
		return userdao.orgRegister(organization);
	}
	
	@Override
	public List<Country> fetchCountry() {
		return userdao.fetchCountry();
	}
	
	@Override
	public List<State> fetchState(){
		return userdao.fetchState();
	}

	@Override
	public List<Organization> fetchOrganizationName() {
		return userdao.fetchOrganizationName();
	}

	@Override
	public List<ClientManager> fetchClient() {
		return userdao.fetchClient();
	}
	
	@Override
	public List<PurchaseOrder> fetchPurchaseOrder() {
		return userdao.fetchPurchaseOrder();
	}
	
	@Override
	public List<Invoice> fetchInvoiceProfile() {
		return userdao.fetchInvoiceProfile();
	}
	
	@Override
	public List<UserManager> fetchUser() {
		return userdao.fetchUser();
	}
	
	@Override
	public List fetchInvoiceStatus(Invoice invoice) {
		return userdao.fetchInvoiceStatus(invoice);
	}
	
	@Override
	public List fetchInvoiceSearch(Invoice invoice) {
		return userdao.fetchInvoiceSearch(invoice);
	}
	
	@Override
	public List fetchClientProfile(ClientManager clientManager) {
		return userdao.fetchClientProfile(clientManager);
	}
	
	@Override
	public List fetchUserProfile(UserManager userManager) {
		return userdao.fetchUserProfile(userManager);
	}
	
	@Override
	public List clientAssigned(UserManager userManager) {
		return userdao.clientAssigned(userManager);
	}
	
	@Override
	public List fetchClientDropdown(ClientManager clientManager) {
		return userdao.fetchClientDropdown(clientManager);
	}

	@Override
	public List fetchPurchaseOrder(PurchaseOrder purchaseOrder) {
		return userdao.fetchPurchaseOrder(purchaseOrder);
	}
	
	@Override
	public List userClientAssign(User login) {
		return userdao.userClientAssign(login);
	}
		
	@Override
	public Boolean rememberMe() {
		return true;
	}
	
}
