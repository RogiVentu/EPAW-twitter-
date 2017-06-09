package models;

import java.sql.ResultSet;
import java.util.Date;

import utils.DAO;


public class BeanTweet {
	

	private String id = "0";
	private String title = "";
	private String text = "";
	private String user = "";
	private String time = "";
	private String picture = "";
	
	private int[] error = {0,0};
	

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
	public boolean isComplete() {
	    return(hasValue(getId()) &&
	    		hasValue(getTitle()) &&
	    		hasValue(getText()) &&
	    		hasValue(getUser()) &&
	    		hasValue(getTime()));
	}
	
	private boolean hasValue(String val) {
		return((val != null) && (!val.equals("")));
	}
	
}