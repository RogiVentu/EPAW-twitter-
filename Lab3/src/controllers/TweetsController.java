package controllers;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.Collections;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanComparator;
import org.apache.commons.collections.comparators.ComparableComparator;
import org.apache.commons.collections.comparators.ReverseComparator;

import models.BeanTweet;
import models.BeanTweets;
import utils.DAO;

/**
 * Servlet implementation class AnonymusController
 */
@WebServlet("/TweetsController")
public class TweetsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TweetsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		System.out.println("TweetsController, loading: ViewMainTweets.jsp");
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
			BeanTweets bts = new BeanTweets();
			List<BeanTweet> alltweets = null;				//initialize the list of tweets we will return
			if(session.getAttribute("isGuest") != null){	//if the user is a guest
				//System.out.println("isGuest = true");
				alltweets = bts.getTweets();				//return all the tweets created
				//with the BeanComparator and Collections we reverse the list of tweets returned to 
				//show the recent artweeted artweets at the top of the page
				BeanComparator reverseOrderBeanComparator = new BeanComparator("time", new ReverseComparator(new ComparableComparator()));
				Collections.sort(alltweets, reverseOrderBeanComparator);
				//System.out.println(alltweets.size());
			}
			else{											//if the user is not a guest
				
				alltweets = bts.getFollowedTweets(session.getAttribute("user").toString()); //return the list of tweets of the people we follow
				BeanComparator reverseOrderBeanComparator = new BeanComparator("time", new ReverseComparator(new ComparableComparator()));
				Collections.sort(alltweets, reverseOrderBeanComparator);
				//System.out.println(session.getAttribute("user").toString());
				//System.out.println(alltweets.size());
				
			}
			
		session.setAttribute("alltweets", alltweets);		//store it in the session to take it in ViewMainTweets.jsp	
		request.setAttribute("alltweets", alltweets);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("ViewMainTweets.jsp");
	    dispatcher.forward(request, response);
	    

		}
		catch(Exception e){
			System.out.println("excepcion TweetsController");
			
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}