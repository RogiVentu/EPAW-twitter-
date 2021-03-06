package models;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import utils.DAO;

public class BeanUser implements Serializable {

	private static final long serialVersionUID = 1L;

	private String name = "";
	private String surnames = "";
	private String gender = "";
	private String datebirth = "";
	private String user = "";
	private String pass = "";
	private String passconf = "";
	private String mail = "";
	private int isAdmin = 0;
	private String following = "";

	/* Control which parameters have been correctly filled */
	private int[] error = { 0, 0 };

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

	public String getUser() {
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

	public int getIsAdmin() {
		return isAdmin;
	}

	/* Setters */

	public void setErrorU(int er) {
		this.error[0] = er;
	}

	public void setErrorE(int er) {
		this.error[1] = er;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setSurnames(String surnames) {
		this.surnames = surnames;
	}

	public void setGender(String gender) {
		this.gender = gender;

	}

	public void setDatebirth(String datebirth) {
		this.datebirth = datebirth;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public void setPass(String pass) {
		this.pass = pass;

	}

	public void setPassconf(String passconf) {
		this.passconf = passconf;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getFollowing() {
		return following;
	}

	public void setFollowing(String following) {
		this.following = following;
	}
	
	/* Logic Functions */
	public List<BeanUser> getSearchedUsers(String user, String myuser) throws SQLException { // connect with the database and fill the ResultSet

		ResultSet rst = null;
		ResultSet isFollow = null;
		List<BeanUser> users = new ArrayList<>(); // here we store each user that corresponds with the search
		try {
			DAO dao = new DAO();
			rst = dao.executeSQL("SELECT username FROM users WHERE username like'" + user + "%'ORDER BY username;"); // returns every user that starts or is user
			while (rst.next()) {
				BeanUser bt = new BeanUser();
				bt.setUser(rst.getString("username")); // for each new BeanUser we store the username of the result set
				isFollow = dao.execute2SQL("SELECT COUNT(*) AS cfollow FROM follows WHERE followed='" + rst.getString("username") +"' AND byUser = '" + myuser + "';");
				int count = 0;
				if(isFollow.next()){
					count = Integer.parseInt(isFollow.getString("cfollow")) ;
				}
				if(count == 0){
					bt.setFollowing("Follow");
				}
				else{
					bt.setFollowing("Unfollow");
				}
				users.add(bt);
			}
			dao.disconnectBD(); // close the connection with the database
			return users;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Exception ocurred with searched users");
			e.printStackTrace();
		}

		return null;
	}
	
	public List<BeanUser> getFollowedUsers(String user) throws SQLException { // connect with the database and fill the ResultSet

		ResultSet rst = null;
		ResultSet isFollow = null;
		List<BeanUser> users = new ArrayList<>(); // here we store each user that corresponds with the search
		try {
			DAO dao = new DAO();
			rst = dao.executeSQL("SELECT followed FROM follows WHERE byUser='" + user + "';"); // returns every user that starts or is user
			while (rst.next()) {
				BeanUser bt = new BeanUser();
				bt.setUser(rst.getString("followed")); // for each new BeanUser we store the username of the result set
				isFollow = dao.execute2SQL("SELECT COUNT(*) AS cfollow FROM follows WHERE followed='" + rst.getString("followed") +"' AND byUser = '" + user + "';");
				int count = 0;
				if(isFollow.next()){
					count = Integer.parseInt(isFollow.getString("cfollow")) ;
				}
				if(count == 0){
					bt.setFollowing("Follow");
				}
				else{
					bt.setFollowing("Unfollow");
				}
				users.add(bt);
			}
			dao.disconnectBD(); // close the connection with the database
			return users;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Exception ocurred with searched users");
			e.printStackTrace();
		}

		return null;
	}
	
	public BeanUser getProfile(String user) throws SQLException {
		ResultSet rst = null;
		BeanUser usert = this;// here we store each user that corresponds with the search
		try {
			DAO dao = new DAO();
			rst = dao.executeSQL("SELECT name, surnames, gender, datebirth, username, email FROM users WHERE username = '" + user +"'"); // returns
			while (rst.next()) {
				usert.setName(rst.getString("name"));
				usert.setSurnames(rst.getString("surnames"));
				usert.setGender(rst.getString("gender"));
				usert.setDatebirth(rst.getString("datebirth"));
				usert.setUser(rst.getString("username"));
				usert.setMail(rst.getString("email"));
			}
			dao.disconnectBD(); // close the connection with the database
			return usert;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Exception ocurred with getProfile");
			e.printStackTrace();
			return usert;
		}
	}
	
	public void deleteUser(String us){
		try {
			DAO dao = new DAO();

			int res = dao.executeSQLUpdate("DELETE FROM users WHERE username='"+us+"';");
			if(res == 1){
				System.out.println("Correct Delete "+us);
			}else{

				System.out.println("Incorrect Delete "+us);
			}
			dao.disconnectBD();
		}catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Exception ocurred with Delete User");
			e.printStackTrace();
		}
	}
	public void changeValue(String who, String what, String value){
		
		try {
			DAO dao = new DAO();

			int r = dao.executeSQLUpdate("UPDATE users SET "+what+"='" + value +"' WHERE username='" + who +"'");
			dao.disconnectBD(); // close the connection with the database
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Exception when modify value");
		}
		
	}
	/* Check if all the fields are filled correctly */
	public boolean isComplete() {
		return (hasValue(getUser()) && hasValue(getMail()) && hasValue(getName()) && hasValue(getSurnames())
				&& hasValue(getGender()) && hasValue(getDatebirth()) && hasValue(getPass()));
	}

	private boolean hasValue(String val) {
		return ((val != null) && (!val.equals("")));
	}

}
