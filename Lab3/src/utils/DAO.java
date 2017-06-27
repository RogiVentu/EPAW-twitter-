package utils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import models.BeanFollow;
import models.BeanTweet;
import models.BeanUser;

public class DAO {
	private Connection connection;
	private Statement statement;
	private PreparedStatement ps;
	int status;

	public DAO() throws Exception {
		String user = "mysql";
		String password = "prac";
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		connection = DriverManager.getConnection("jdbc:mysql://localhost/ts1?user=" + user + "&password=" + password);
		statement = connection.createStatement();
	}

	// execute queries
	public ResultSet executeSQL(String query) throws SQLException {
		return statement.executeQuery(query);
	}
	
	public int executeSQLUpdate(String query) throws SQLException {
		return statement.executeUpdate(query);
	}
	
	public ArrayList<String> listUsernames() throws SQLException
	{
		
			ResultSet rs;
			rs = statement.executeQuery("SELECT username FROM users");
			
			ArrayList<String> us = new ArrayList<String>();
			while(rs.next())
			{
				us.add(rs.getString("username"));
			}
			return us;
		
	}
	public void insertUserSQL(BeanUser user) throws SQLException{
		
		ps = connection.prepareStatement("insert into users (username,password,email,name,surnames,gender,datebirth,isAdmin) values(?,?,?,?,?,?,?,?);");
		ps.setString(1, user.getUser());
		ps.setString(2, user.getPass());
		ps.setString(3, user.getMail());
		ps.setString(4, user.getName());
		ps.setString(5, user.getSurnames());
		ps.setString(6, user.getGender());
		ps.setString(7, user.getDatebirth());
		ps.setInt(8, user.getIsAdmin());
		
		status = ps.executeUpdate();;
		
		/*statement.executeUpdate("insert into users values (" + user.getUser()+","+user.getPass()+","+user.getMail()+","+user.getName()+
		","+user.getSurnames()+","+user.getGender()+","+user.getDatebirth()+");");*/
		
	}
	
	public void insertTweetSQL(BeanTweet tweet) throws SQLException{
		
		ps = connection.prepareStatement("insert into tweets (title,text,user,time,picture) values(?,?,?,?,?);");
		ps.setString(1, tweet.getTitle());
		ps.setString(2, tweet.getText());
		ps.setString(3, tweet.getUser());
		ps.setString(4, tweet.getTime());
		ps.setString(5, "NULL");
		
		status = ps.executeUpdate();

		/*statement.executeUpdate("insert into users values (" + user.getUser()+","+user.getPass()+","+user.getMail()+","+user.getName()+
		","+user.getSurnames()+","+user.getGender()+","+user.getDatebirth()+");");*/
		
	}

	public void insertFollowSQL(BeanFollow follow) throws SQLException{
		
		ps = connection.prepareStatement("insert into follows (followed,byuser) values (?,?);");
		System.out.println(follow.getFollowed());
	    System.out.println(follow.getByuser());
		ps.setString(1, follow.getFollowed());
		ps.setString(2, follow.getByuser());
		
		status = ps.executeUpdate();
	}
	
	public void unfollowSQL(BeanFollow unfollow) throws SQLException{
		
		
	    ps = connection.prepareStatement("delete from follows where followed = ? and byuser = ?;");
	    System.out.println(unfollow.getFollowed());
	    System.out.println(unfollow.getByuser());
		ps.setString(1, unfollow.getFollowed());
		ps.setString(2, unfollow.getByuser());
		
		status = ps.executeUpdate();
	}

	// TODO: code for updates for Assignments 2, 3 and 4.
	public void disconnectBD() throws SQLException {
		statement.close();
		connection.close();
		//ps.close();
	}
	
	public int getStatus(){
		return status;
	}
}
