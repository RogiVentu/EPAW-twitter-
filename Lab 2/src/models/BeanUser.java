package models;

import java.io.Serializable;

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
	
	/*Setters*/
	
	public void setName(String name) {
		System.out.println("Filling user field (name)");
		this.name = name;
		System.out.println(this.name);
	}
	
	public void setSurnames(String surnames) {
		System.out.println("Filling user field (surnames)");
		this.surnames = surnames;
	}

	public void setGender(String gender) {
		System.out.println("Filling user field (gender)");
		this.gender = gender;
	}

	
	public void setDatebirth(String datebirth) {
		System.out.println("Filling user field (datebirth)");
		this.datebirth = datebirth;
	}

	public void setUser(String user){
		
		System.out.println("Filling user field (user)");
		/* We simulate a user with the same username exists in our DB */
		this.user = user;
		//error[0] = 1;
		
	}

	public void setPass(String pass) {
		System.out.println("Filling user field (pass)");
		this.pass = pass;
	}

	public void setPassconf(String passconf) {
		System.out.println("Filling user field (passconf)");
		this.passconf = passconf;
	}
	
	public void setMail(String mail){
		System.out.println("Filling mail field (mail)");
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
