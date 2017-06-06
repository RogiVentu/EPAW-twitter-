package models;

import java.io.Serializable;
import java.sql.ResultSet;
import utils.DAO;

public class BeanUser implements Serializable  {

	private static final long serialVersionUID = 1L;

	private String name = "";
	private String surnames = "";
	private String gender= "";
	private String datebirth= "";
	private String user = "";
	private String pass = "";
	private String passconf = "";
	private String mail = "";
	private int isAdmin = 0;
	
	/*  Control which parameters have been correctly filled */
	private int[] error = {0,0}; 
	
	/* Getters */
	public String getName() {
		return name;
	}
	
	public String getSurnames() {
		return surnames;
	}

	public String getGender() {
		return gender;
	}
	
	public String getDatebirth() {
		return datebirth;
	}

	public String getUser(){
		return user;
	}
	
	public String getPass() {
		return pass;
	}
	
	public String getPassconf() {
		return passconf;
	}
	
	public String getMail() {
		return mail;
	}
	
	public int[] getError() {
		return error;
	}
	
	public int getIsAdmin(){
		return isAdmin;
	}
	
	/*Setters*/
	
	
	public void setErrorU(int er){
		this.error[0] = er;
	}
	
	public void setErrorE(int er){
		this.error[1] = er;
	}
	public void setName(String name) {
		System.out.println("Filling name field");
		this.name = name;
	}
	
	public void setSurnames(String surnames) {
		System.out.println("Filling surnames field");
		this.surnames = surnames;
	}

	public void setGender(String gender) {
		System.out.println("Filling gender field");
		this.gender = gender;
		
	}

	
	public void setDatebirth(String datebirth) {
		System.out.println("Filling datebirth field: ");
		this.datebirth = datebirth;
	}

	public void setUser(String user){	
		System.out.println("Filling user field");
		this.user = user;	
	}

	public void setPass(String pass) {
		System.out.println("Filling pass field");
		this.pass = pass;
		
	}

	public void setPassconf(String passconf) {
		System.out.println("Filling passconf field");
		this.passconf = passconf;
	}
	
	public void setMail(String mail){
		System.out.println("Filling mail field");
		this.mail = mail;
	}
	
	/* Logic Functions */
	
	/*Check if all the fields are filled correctly */
	public boolean isComplete() {
	    return(hasValue(getUser()) &&
	           hasValue(getMail()) &&
	           hasValue(getName()) &&
	           hasValue(getSurnames()) &&
	           hasValue(getGender()) &&
	           hasValue(getDatebirth()) &&
	           hasValue(getPass()));
	}
	
	private boolean hasValue(String val) {
		return((val != null) && (!val.equals("")));
	}


}
