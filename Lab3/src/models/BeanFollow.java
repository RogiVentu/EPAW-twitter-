package models;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import utils.DAO;

public class BeanFollow implements Serializable {

	private static final long serialVersionUID = 1L;

	private String followed = "";
	private String byuser = "";

	/* Control which parameters have been correctly filled */
	private int[] error = { 0, 0 };

	/* Getters */
	public String getByuser() {
		return byuser;
	}

	public String getFollowed() {
		return followed;
	}
	
	public int[] getError() {
		return error;
	}

	/* Setters */
	
	public void setByuser(String byuser) {
		this.byuser = byuser;
	}

	public void setFollowed(String followed) {
		this.followed = followed;
	}
	
	public void setErrorU(int er) {
		this.error[0] = er;
	}

	public void setErrorE(int er) {
		this.error[1] = er;
	}

	/* Logic Functions */
	public void insertFollow(String followed, String byuser) throws SQLException { // connect with the database and fill the ResultSet

		ResultSet rst = null;
		try {
			DAO dao = new DAO();
			rst = dao.executeSQL("SELECT COUNT(*) AS countf FROM follows WHERE followed='" + followed + "' AND byuser='" + byuser + "';"); // returns if he is already following the other
			int count = 0;
			if(rst.next()){
				count = Integer.parseInt(rst.getString("countf")) ;
			}
			//int follow = rst.getInt(1);
			if(count == 0){
				this.setFollowed(followed);
				this.setByuser(byuser);
				dao.insertFollowSQL(this);
				if (dao.getStatus() > 0)
					System.out.println("Follow has been introduced in the database!");
			}
			else
				System.out.println("User "+ byuser +" is already following " + followed);
			dao.disconnectBD(); // close the connection with the database
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("EXCEPTION: Problem inserting follow in the database");
			e.printStackTrace();
		}
	}

	/* Check if all the fields are filled correctly 

	private boolean hasValue(String val) {
		return ((val != null) && (!val.equals("")));
	}
	*/
}
