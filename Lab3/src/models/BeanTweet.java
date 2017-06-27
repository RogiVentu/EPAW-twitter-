package models;

import java.lang.reflect.InvocationTargetException;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.RequestDispatcher;

import org.apache.commons.beanutils.BeanUtils;

import utils.DAO;

public class BeanTweet {

	private String id = "0";
	private String title = "";
	private String text = "";
	private String user = "";
	private String time = "";
	private String picture = "";

	private int[] error = { 0, 0 };

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
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

	/*
	 * public ResultSet getTweet(ResultSet rs){ try{ DAO dao = new DAO(); rs =
	 * dao.executeSQL("SELECT * FROM tweets;" );
	 * 
	 * } catch(Exception e){ System.out.println("error getAllTweets");
	 * 
	 * } return rs; }
	 */

	public void insertTweet() {

		if (this.isComplete()) {
			System.out.println("tweet okey");
			try {
				DAO dao = new DAO();
				dao.insertTweetSQL(this);
				if (dao.getStatus() > 0)
					System.out.println("Tweet has been introduced in the database!");

				dao.disconnectBD();
			} catch (Exception e) {
				System.out.println("EXCEPTION: Problem inserting tweet in the database");
			}
		}
	}
	
	public void deleteTweet(String idt){
		try {
			DAO dao = new DAO();

			int res = dao.executeSQLUpdate("DELETE FROM tweets WHERE id='"+idt+"'");
			if(res == 1){
				System.out.println("Correct Delete "+idt);
			}else{

				System.out.println("Incorrect Delete "+idt);
			}
			dao.disconnectBD();
		}catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Exception ocurred with Delete Tweet");
			e.printStackTrace();
		}
	}
	
	public boolean isComplete() {
		return (hasValue(getId()) && hasValue(getTitle()) && hasValue(getText()) && hasValue(getUser())
				&& hasValue(getTime()));
	}

	private boolean hasValue(String val) {
		return ((val != null) && (!val.equals("")));
	}

}