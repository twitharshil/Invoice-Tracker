package com.infotech.dao;

import java.util.List;

import com.infotech.dto.ClientManager;
import com.infotech.dto.Country;
import com.infotech.dto.Invoice;
import com.infotech.dto.Organization;
import com.infotech.dto.PurchaseOrder;
import com.infotech.dto.State;
import com.infotech.dto.User;
import com.infotech.dto.UserManager;

public interface UserDao {

	public Boolean Validateuser(User login);
      
      public Boolean register(UserManager userManager);
      
	  public Boolean clientRegister(ClientManager clientManager);

	public Boolean PoRegister(PurchaseOrder purchaseOrder);

	public Boolean invoiceRegister(Invoice invoice);
	
	public Boolean orgRegister(Organization organization);
	
	public List<Organization> fetchOrganizationName();
	
	public List<Country> fetchCountry();
	
	public List<State> fetchState();
	
	public List<ClientManager> fetchClient();
	
	public List<PurchaseOrder> fetchPurchaseOrder();
	
	public List<Invoice> fetchInvoiceProfile();
	
	public List<UserManager> fetchUser();
	
	public List fetchInvoiceStatus(Invoice invoice);
	
	public List fetchInvoiceSearch(Invoice invoice);
	
	public List fetchClientProfile(ClientManager clientManager);
	
	public List fetchUserProfile(UserManager userManager);
	
	public List clientAssigned(UserManager userManager);
	
	public List fetchPurchaseOrder(PurchaseOrder purchaseOrder);
	
	public List fetchClientDropdown(ClientManager clientManager);
	
	public List userClientAssign(User login);
	
}
		