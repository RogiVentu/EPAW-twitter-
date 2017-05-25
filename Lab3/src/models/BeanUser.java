package models;

import java.sql.ResultSet;

import utils.DAO;

public class BeanUser implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	

	private String name = "PABLO ";
	private String surnames = "ESCOBAR";
	private String gender= "FEMALE";
	private String datebirth= "345345";
	private String user = "malpaario";
	private String pass = "1qwe4r4";
	private String passconf = "9i3e9i";
	private String mail = "mede@yin";
	
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
	
	
	public void setError(int er){
		this.error[0] = er;
	}
	public void setName(String name) {
		System.out.println("Filling name field");
		this.name = name;
	}
	
	public void setSurnames(String surnames) {
		System.out.println("Filling surnames field" + surnames);
		this.surnames = surnames;
	}

	public void setGender(String gender) {
		System.out.println("Filling gender field" + gender + "!");
		this.gender = gender;
	}

	
	public void setDatebirth(String datebirth) {
		System.out.println("Filling datebirth field");
		this.datebirth = datebirth;
	}

	public void setUser(String user){
		
		System.out.println("Filling user field");
		/* We simulate a user with the same username exists in our DB */
		
		try{
			DAO dao = new DAO();
			ResultSet rs = dao.executeSQL("SELECT username FROM users WHERE username = '"+user+"'");
			
			if (rs.wasNull())
				this.error[0] = 0;
			else
			{
				System.out.println("Username already exists");
				this.error[0]=1;
				return;
			}
			/*while (rs.next())
			{
				if (rs.getString("username").equalsIgnoreCase(user))
				{
					System.out.println("Username already exists");
					this.error[0]=1;
					return;
				}
			}*/
			dao.disconnectBD();
		}
		catch (Exception e) {
            //System.out.println("");
	    }
		
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
		
		try{
			DAO dao = new DAO();
			ResultSet rs = dao.executeSQL("SELECT email FROM users WHERE email = '"+mail+"'");
			
			if (rs.wasNull())
				this.error[1] = 0;
			else
			{
				System.out.println("Email already exists");
				this.error[1]=1;
				return;
			}
		/*try{
			DAO dao = new DAO();
			ResultSet rs = dao.executeSQL("SELECT email FROM users");
			
			while (rs.next())
			{
				if (rs.getString("email").equalsIgnoreCase(mail))
				{
					System.out.println("Email already exists");
					this.error[1]=1;
					return;
				}
			}*/
			dao.disconnectBD();
		}
		catch (Exception e) {
            //System.out.println("");
	    }
		
		this.mail = mail;
	}
	
	/* Logic Functions */
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
