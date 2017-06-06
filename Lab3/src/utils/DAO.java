package utils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
		
		ps = connection.prepareStatement("insert into users values(?,?,?,?,?,?,?,?);");
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
