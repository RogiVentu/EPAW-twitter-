package models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import models.BeanTweet;

import utils.DAO;

public class BeanTweets {
	
	//This class is more used as a functionality than a Bean
	//But doing it like this way we respect the MVC model
	
	/*********Return tweets depending on your needs**********/
	
	/*********Return all created tweets (Guest)**********/
	public List<BeanTweet>  getTweets() throws SQLException{ //connect with the database and fill the ResultSet
		
		ResultSet rst = null;
		List<BeanTweet> alltweets= new ArrayList<>();
		try {
			DAO dao = new DAO();
			rst = dao.executeSQL("SELECT * FROM tweets;");		
			while(rst.next()){
				BeanTweet bt = new BeanTweet();
				bt.setId(rst.getString("id"));
				bt.setTitle(rst.getString("title"));
	    		bt.setText(rst.getString("text"));
	    		bt.setUser(rst.getString("user"));
	    		bt.setTime(rst.getString("time"));
	    		
				alltweets.add(bt);
			}
			dao.disconnectBD();
			return alltweets;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	/*********Return tweets of people you follow (Guest)**********/
	public List<BeanTweet>  getFollowedTweets(String user) throws SQLException{ //pass user as parameter to get the tweets of people we follow
		
		ResultSet rst = null;
		List<BeanTweet> alltweets= new ArrayList<>();		//initialize the list of BeanTweet that we will return
		try {
			DAO dao = new DAO();
			//System.out.println(user);
			rst = dao.executeSQL("SELECT id, title, text , user, time FROM tweets T, follows F WHERE F.byUser = '" + user + "' AND T.user = F.followed");		
			while(rst.next()){
				BeanTweet bt = new BeanTweet();
				bt.setId(rst.getString("id"));
				bt.setTitle(rst.getString("title"));
	    		bt.setText(rst.getString("text"));
	    		bt.setUser(rst.getString("user"));
	    		bt.setTime(rst.getString("time"));
	    		
				alltweets.add(bt);
			}
			dao.disconnectBD();
			return alltweets;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	//falta por implementar, devuelve un tweet específico dado un id
	public List<BeanTweet> getPersonalTweets(String user){
		
		ResultSet rst = null;
		List<BeanTweet> alltweets= new ArrayList<>();		//initialize the list of BeanTweet that we will return
		try {
			DAO dao = new DAO();
			System.out.println(user);
			rst = dao.executeSQL("SELECT id, title, text , user, time FROM tweets T WHERE T.user = '" + user + "';");		
			while(rst.next()){
				BeanTweet bt = new BeanTweet();
				bt.setId(rst.getString("id"));
				bt.setTitle(rst.getString("title"));
	    		bt.setText(rst.getString("text"));
	    		bt.setUser(rst.getString("user"));
	    		bt.setTime(rst.getString("time"));
	    		
				alltweets.add(bt);
			}
			dao.disconnectBD();
			return alltweets;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	public HashMap<String, java.util.List<BeanTweet>> getSearchedTweets(List<BeanUser> userlist){
		
		HashMap<String, List<BeanTweet>> tweets = new HashMap<>();
		ResultSet rst = null;
		
		try {
			DAO dao = new DAO();
			for (BeanUser user : userlist) {
				List<BeanTweet> alltweets= new ArrayList<>();		//initialize the list of BeanTweet that we will return
				System.out.println(user);
				String username = user.getUser();
				rst = dao.executeSQL("SELECT id, title, text , user, time FROM tweets T WHERE T.user = '" + username + "';");		
				while(rst.next()){
					BeanTweet bt = new BeanTweet();
					bt.setId(rst.getString("id"));
					bt.setTitle(rst.getString("title"));
		    		bt.setText(rst.getString("text"));
		    		bt.setUser(rst.getString("user"));
		    		bt.setTime(rst.getString("time"));
		    		
					alltweets.add(bt);
				}
				if(!(alltweets.isEmpty()))
					tweets.put(username,alltweets);
			}
			
			dao.disconnectBD();
			return tweets;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	/*********INSERT **********/
	/*public void setTweets(BeanTweet[] tweets) {
		this.alltweets = alltweets;
	}*/
}
