package com.infotech.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.infotech.dto.ClientManager;
import com.infotech.dto.Country;
import com.infotech.dto.Invoice;
import com.infotech.dto.Organization;
import com.infotech.dto.PurchaseOrder;
import com.infotech.dto.State;
import com.infotech.dto.User;
import com.infotech.dto.UserManager;


public class UserDaoImpl implements UserDao{

    @Autowired
	private JdbcTemplate jdbcTemplate;
    
	public UserDaoImpl(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public Boolean Validateuser(User login) {
		
		String sql = "SELECT COUNT(*) FROM user WHERE email= '"+login.getUsername() +"' and password = '"+ login.getPassword() +"' ";	
		int count = jdbcTemplate.queryForObject(sql, new Object[] {}, Integer.class);
		if(count==1){
			return true;
		}
		else
		return false;
	}
	
	public Boolean register(UserManager userManager) {
		String list=null;
	try{
		String sql = "SELECT COUNT(*) FROM user WHERE email= '"+userManager.getEmail()+"'";	
	int count = jdbcTemplate.queryForObject(sql, new Object[] {}, Integer.class);
	
	if(count==1){
		return false;
		
	}
	else{
			String sql2 = "insert into user(Name,Email,Password,ContactNo,Status)"
	                      + "values(?,?,?,?,?)";
		jdbcTemplate.update(sql2,new Object[]{userManager.getName(), userManager.getEmail(), userManager.getPassword(),
				 userManager.getContactNo(),1});
		String sql3 = "SELECT UserID FROM user WHERE email= '"+userManager.getEmail()+"'";	
		
		int userId = jdbcTemplate.queryForObject(sql3, new Object[] {}, Integer.class);
		userManager.setUserId(userId);;
		
		if(userId != 0)
		list =	userManager.getUserClient();
	String[] clientId=list.split(",");
		for(String cList:clientId) {
			
			String sql1 = "insert into userclient(UserId,ClientId) values(?,?)";
		    jdbcTemplate.update(sql1, new Object[] {userManager.getUserId(),cList});
		}
		 return true;
		 }
	}catch(Exception e){
		e.printStackTrace();
		return false;
	}
	}
	
	@Override
	public Boolean clientRegister(ClientManager clientManager) {
	
		String sql = "insert into client(OrgId,Project,ClientSpoc,ContactNo,Email,Password,Status)"
	            + "values(?,?,?,?,?,?,?)";		
		jdbcTemplate.update(sql,new Object[]{clientManager.getOrgId(), clientManager.getProject(), clientManager.getClientSpoc(), clientManager.getContactNo(), 
				clientManager.getEmail(), clientManager.getPassword(),1	});
		
			return true;
	}
	
	@Override
	public Boolean PoRegister(PurchaseOrder purchaseOrder) {
		
		String sql = "insert into po(ClientId, OrgId, PoNumber, Description, SacHsn, Amount, PoStartDate, PoEndDate, Status)"
			+ "values(?,?,?,?,?,?,?,?,?)";
		
		jdbcTemplate.update(sql,new Object[]{ purchaseOrder.getClientId(),purchaseOrder.getOrgId(),
			purchaseOrder.getPoNumber(), purchaseOrder.getDescription(), purchaseOrder.getSacHsn(),
			purchaseOrder.getAmount(),purchaseOrder.getPoStartDate(),purchaseOrder.getPoEndDate(),1});
		
		return true;
		
	}

    @Override
    public Boolean invoiceRegister(Invoice invoice) {
    	int poNo = invoice.getPoId();
    	
    	String sql1 = "SELECT poStartDate,poEndDate FROM po "
			+ "where PoId = "+invoice.getPoId()+" and Description ='"+invoice.getDescription()+"' ";
    	
    	@SuppressWarnings({ "unchecked", "rawtypes" })
    	List<PurchaseOrder> List  = jdbcTemplate.query(sql1, 
			new BeanPropertyRowMapper(PurchaseOrder.class));
    	
    	try{
    		Date currentDate=new Date();
    		String poEndDate=null;
    		String poStartDate=null;
    		if(List!=null){
    			for(PurchaseOrder b:List){  
    				System.out.println(b.getPoEndDate()+" "+b.getPoStartDate());  
    				poEndDate = b.getPoEndDate();
    				poStartDate= b.getPoStartDate();
    				}
    			
    			SimpleDateFormat sd= new SimpleDateFormat("yyyy-MM-dd");
    			Date poStartD = sd.parse(poStartDate);
    			Date poEndD = sd.parse(poEndDate);
    			String cDate=sd.format(currentDate);
    			Date cd=sd.parse(cDate);
    			
    			if(cd.after(poStartD)&&cd.before(poEndD)){ 	
    				String sql = "insert into invoice(PoId, Description, Amount, InvStartDate, InvDispatchDate, InvClosedDate,Remark,Milestone, Status)" 
    			+ "values(?,?,?,?,?,?,?,?,?)";
    				
    				jdbcTemplate.update(sql, new Object[]{ invoice.getPoId(), invoice.getDescription(),
    						invoice.getAmount(), invoice.getInvStartDate(), invoice.getInvDispatchDate(), invoice.getInvClosedDate(), 
    						invoice.getMilestone() ,invoice.getRemark() ,1});
    				
    				return true;
    				}
    			}
    		}
    	
    	catch (Exception e) {
    		e.printStackTrace();
    		}
    	
    	return false;
    	
    }
    
    @Override
    public Boolean orgRegister(Organization organization) {
    	
    	String sql = "Select COUNT(*) from org where OrgName = '"+organization.getOrgName()+"' ";
    	int count = jdbcTemplate.queryForObject(sql, new Object[] {}, Integer.class);
    	
    	if(count==1){
		return false;	
		}
    	
    	else{	
    		String sql1 = "Insert into org(OrgName, Country, State, City, Pincode,Address, Website, Status) values(?,?,?,?,?,?,?,?)";
    		
    		jdbcTemplate.update(sql1, new Object[]{organization.getOrgName(),organization.getCountry(),organization.getState(),
			organization.getCity(),organization.getPincode(),organization.getAddress(),organization.getWebsite(),1 });
		return true;
	}
    }
    
    @Override
    public List<Organization> fetchOrganizationName() {
    	
    	String sql = "Select * from org";
	
	    @SuppressWarnings({ "unchecked", "rawtypes" })
		List<Organization> organizations  = jdbcTemplate.query(sql,
	    		new BeanPropertyRowMapper(Organization.class));
	
	return organizations;
	}
    
    @Override
	public List<Country> fetchCountry() {
		
    	String sql = "select * from country";
    	
    	@SuppressWarnings({ "unchecked", "rawtypes" })
		List<Country> countries  = jdbcTemplate.query(sql,
	    		new BeanPropertyRowMapper(Country.class));
    	
		return countries;
	}
    
    @Override
   	public List<State> fetchState() {
   		
       	String sql = "select * from state";
       	
       	@SuppressWarnings({ "unchecked", "rawtypes" })
   		List<State> states  = jdbcTemplate.query(sql,
   	    		new BeanPropertyRowMapper(State.class));
       	
   		return states;
   	}
    
    @Override
    public List<ClientManager> fetchClient() {
    	
    	String sql = "Select * from client";
    	
    	@SuppressWarnings({"unchecked","rawtypes"})
    	List<ClientManager> clientManagers = jdbcTemplate.query(sql, 
			new BeanPropertyRowMapper(ClientManager.class));
	
	return clientManagers;
	}
    
    @Override
    public List<PurchaseOrder> fetchPurchaseOrder() {
    	
    	String sql = "Select * from po";
    	
    	@SuppressWarnings({ "rawtypes", "unchecked" })
    	List<PurchaseOrder> purchaseOrders = jdbcTemplate.query(sql,
			new BeanPropertyRowMapper(PurchaseOrder.class));
	return purchaseOrders;
	}
    
    @Override
    public List<Invoice> fetchInvoiceProfile() {
    	
    	String sql = "Select * from invoice";
    	
    	@SuppressWarnings({ "rawtypes", "unchecked" })
    	List<Invoice> invoices = jdbcTemplate.query(sql,
			new BeanPropertyRowMapper(Invoice.class));
	
	return invoices;
	}
    
    @Override
    public List<UserManager> fetchUser() {
    	
    	String sql = "Select * from user";
    	
    	@SuppressWarnings({ "unchecked", "rawtypes" })
    	List<UserManager> userManagers = jdbcTemplate.query(sql, 
			new BeanPropertyRowMapper(UserManager.class));

	return userManagers;
	}
    
    
    public List fetchInvoiceStatus(Invoice invoice) {
    	
    	String sql = "SELECT invoice.poId, po.PoNumber, invoice.Description,invoice.Milestone, invoice.amount,  invoice.InvStartDate, "
    			+ "invoice.InvDispatchDate, invoice.InvClosedDate,invoice.Remark, invoice.InvoiceState  FROM invoice "
    			+ "INNER JOIN po ON invoice.PoId=po.poId where invoice.Description = '"+invoice.getDescription()+"' ";
    	
    	@SuppressWarnings({ "rawtypes", "unchecked" })
		List<Invoice> invoices =jdbcTemplate.query(sql,
				new BeanPropertyRowMapper(Invoice.class));
    	
    	boolean invoiceState = invoice.isInvoiceState();
    	if(invoiceState == true){
    	
    	String sql1 = "Update invoice SET InvoiceState = "+1+" where Description = '"+invoice.getDescription()+"'"; 
    	jdbcTemplate.update(sql1);
    	
    	}
	
    	return invoices;
	}
    
    @Override
    public List fetchInvoiceSearch(Invoice invoice) {
    	int search = invoice.getSearch();
    	
    	if(search == 2){
    	
    		String sql = "SELECT invoice.poId, po.PoNumber, invoice.Description, invoice.amount,  invoice.InvStartDate, "
        			+ "invoice.InvDispatchDate, invoice.InvClosedDate,invoice.Remark, invoice.InvoiceState  "
        			+ "FROM invoice INNER JOIN po ON invoice.PoId=po.poId where invoice.InvoiceState = 1 ";
    		
    		@SuppressWarnings({ "rawtypes", "unchecked" })
    		List<Invoice> invoices =jdbcTemplate.query(sql,
    				new BeanPropertyRowMapper(Invoice.class));
    		
    		return invoices;
    	}
    	
    	else if(search == 1) {
    		
    		String sql = "SELECT invoice.poId, po.PoNumber, invoice.Description, invoice.amount,  invoice.InvStartDate, "
        			+ "invoice.InvDispatchDate, invoice.InvClosedDate,invoice.Remark, invoice.InvoiceState  "
        			+ "FROM invoice INNER JOIN po ON invoice.PoId=po.poId where invoice.InvoiceState = 0 ";
    		
    		@SuppressWarnings({ "rawtypes", "unchecked" })
    		List<Invoice> invoices =jdbcTemplate.query(sql,
    				new BeanPropertyRowMapper(Invoice.class));
    		
    		return invoices;
    		
    	}
    	else{
    		String sql = "SELECT invoice.poId, po.PoNumber, invoice.Description, invoice.amount,  invoice.InvStartDate, "
        			+ "invoice.InvDispatchDate, invoice.InvClosedDate,invoice.Remark, invoice.InvoiceState  "
        			+ "FROM invoice INNER JOIN po ON invoice.PoId=po.poId ";
    		
    		@SuppressWarnings({ "rawtypes", "unchecked" })
    		List<Invoice> invoices =jdbcTemplate.query(sql,
    				new BeanPropertyRowMapper(Invoice.class));
    		
    		return invoices;
    	}	
    }
    

	@Override
    public List fetchClientProfile(ClientManager clientManager) {
    	
    	String sql = "SELECT org.OrgName, org.Country,org.State, org.City, org.Address, org.Pincode, org.Website, client.Project, client.ClientSpoc,  client.ContactNo,client.Email, "
    			+ "client.Password, client.ClientId FROM client INNER JOIN org ON client.OrgId = org.OrgId where client.clientId = '"+clientManager.getClientId()+"' ";
    	
    	@SuppressWarnings({ "rawtypes", "unchecked" })
		List<ClientManager> clientManagers =jdbcTemplate.query(sql,
				new BeanPropertyRowMapper(ClientManager.class));
    	
    	return clientManagers;
    }
	
	@Override
	public List fetchUserProfile(UserManager userManager) {
	
		String sql = "Select * from user where userId = "+userManager.getUserId()+" ";
		
		@SuppressWarnings({ "rawtypes", "unchecked" })
		List<UserManager> userManagers =jdbcTemplate.query(sql,
				new BeanPropertyRowMapper(UserManager.class));
		
	return userManagers;
	}
	
	@Override
	public List clientAssigned(UserManager userManager) {
		
		String sql = "SELECT  client.ClientSpoc FROM userclient INNER JOIN user ON user.UserId = userclient.UserId "
				+ "Inner join client on userclient.clientId  = client.clientId  where user.userId = "+userManager.getUserId()+" ";
		
		@SuppressWarnings({ "rawtypes", "unchecked" })
		List<UserManager> userManagers =jdbcTemplate.query(sql,
				new BeanPropertyRowMapper(UserManager.class));
	
		return userManagers;
	}
	
	@Override
	public List fetchClientDropdown(ClientManager clientManager) {
		
		String sql = "Select clientspoc from client where orgid = "+clientManager.getOrgId()+" ";
		
		@SuppressWarnings({ "rawtypes", "unchecked" })
		List<ClientManager> clientManagers =jdbcTemplate.query(sql,
				new BeanPropertyRowMapper(ClientManager.class));
		
		return clientManagers;
		}
	
	@Override
	public List fetchPurchaseOrder(PurchaseOrder purchaseOrder) {
		
		String sql = "SELECT  client.ClientSpoc, org.OrgName, po.Email, po.ContactNo, po.PoNumber, po.Description, po.SacHsn, "
				+ "po.Amount, po.PoStartDate, po.PoEndDate FROM po INNER JOIN client ON po.ClientId = client.ClientId "
				+ "Inner join org on client.OrgId  = org.OrgId  where po.Description = '"+purchaseOrder.getDescription() +"'";
		
		@SuppressWarnings({ "rawtypes", "unchecked" })
		List<PurchaseOrder> purchaseOrders =jdbcTemplate.query(sql,
				new BeanPropertyRowMapper(PurchaseOrder.class));
		
		return purchaseOrders;
	}
	
	@Override
	public List userClientAssign(User login) {
		
		String sql = "SELECT userclient.userId,user.name, user.email, client.clientid, client.clientspoc, client.project, org.OrgId,org.OrgName, "
				+ "po.PoId, po.PoNumber,po.description, invoice.InvoiceId, invoice.Description, invoice.Amount, invoice.InvStartDate,"
				+ "invoice.InvDispatchDate, invoice.InvClosedDate, invoice.remark, invoice.invoicestate, invoice.milestone  FROM user "
				+ "INNER JOIN userclient ON userclient.UserId = user.userId "
				+ "inner join client on client.clientid = userclient.clientid "
				+ "inner join org on org.OrgId = client.orgid "
				+ "Inner join po on client.clientid  = po.clientid "
				+ "inner join invoice on po.poid = invoice.poid where user.email = '"+login.getUsername()+"' ";
		
		@SuppressWarnings({ "rawtypes", "unchecked" })
		List<User> users =jdbcTemplate.query(sql,
				new BeanPropertyRowMapper(User.class));
		
		return users;
	}
}	






