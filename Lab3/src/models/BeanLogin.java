package models;

import java.sql.ResultSet;
import utils.DAO;

public class BeanLogin {

	private String user = "";
	private String pass = "";
	private int[] error = {0,0};
	
	public String getUser(){
		return user;
	}
	public String getPass(){
		return pass;
	}
	
	public void setUser(String user){
		
		try{
			DAO dao = new DAO();
			ResultSet rs = dao.executeSQL("SELECT username FROM users WHERE username = '"+user+"'");
			
			if (!rs.first())
			{
				System.out.println("Username doesn't exist");
				this.error[0] = 1;
				return;
			}
			dao.disconnectBD();
		}
		catch(Exception e){
			System.out.println("Exceptione cojida mijo de user");
		}
		this.user = user;
	}
	
	public void setPass(String pass){
		
		try{
			DAO dao = new DAO();
			ResultSet rs = dao.executeSQL("SELECT password FROM users WHERE username = '" +this.user+ "' AND password = '" +pass+ "'");
			
			if (!rs.first())
			{
				System.out.println("Incorrect password");
				this.error[1] = 1;
				return;
			}
		dao.disconnectBD();
		}
		catch(Exception e){
			System.out.println("Exceptione cojida mijo de pass");
		}
		this.pass = pass;
	}
	public int[] getError() {
		return error;
	}
	
	public boolean isComplete() {
	    return(hasValue(getUser()) &&
	    		hasValue(getPass()));
	}
	
	
	private boolean hasValue(String val) {
		return((val != null) && (!val.equals("")));
	}
	
}