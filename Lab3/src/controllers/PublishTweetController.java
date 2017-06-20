package controllers;

import java.io.IOException;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import models.BeanTweet;
import models.BeanTweets;
import utils.DAO;

/**
 * Servlet implementation class AnonymusController
 */
@WebServlet("/PublishTweetController")
public class PublishTweetController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PublishTweetController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		System.out.println("PublishTweetController, loading: TweetController");
		HttpSession session = request.getSession();
		/*int i = 1;
	    while (i >= 0) {
			session.removeAttribute("title" + i);
			session.removeAttribute("text" + i);
			session.removeAttribute("user" + i);
			session.removeAttribute("time" + i);
			i--;
		}
	    i++;
	    session.removeAttribute("numtweets");*/
		try{
			//DAO dao = new DAO();
			BeanTweet tweet = new BeanTweet();										//initialize tweet to fill it with the needed data
			tweet.setUser(session.getAttribute("user").toString());					//get the username from the session
			DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");	//take the date in the format that we want
			Date date = new Date();
			tweet.setTime(dateFormat.format(date).toString()); 						//once we have it as we want make setTime
			BeanUtils.populate(tweet, request.getParameterMap());
			tweet.insertTweet();	    											//inside this method we insert the tweet in the database

		}
		catch(Exception e){
			System.out.println("Exception TweetsController");
			
		}
		
	    RequestDispatcher dispatcher = request.getRequestDispatcher("TweetsController");
	    dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}