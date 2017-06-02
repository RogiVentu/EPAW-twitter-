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
		this.user = user;
	}
	
	public void setPass(String pass){
		this.pass = pass;
	}
	public int[] getError() {
		return error;
	}
	
	public void setErrorU(int error) {
		this.error[0] = error;
	}
	
	public void setErrorP(int error) {
		this.error[1] = error;
	}
	public boolean isComplete() {
	    return(hasValue(getUser()) &&
	    		hasValue(getPass()));
	}
	
	
	private boolean hasValue(String val) {
		return((val != null) && (!val.equals("")));
	}

	
}