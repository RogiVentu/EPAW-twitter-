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
import models.BeanUser;
import utils.DAO;

/**
 * Servlet implementation class PersonalTweetsController
 */
@WebServlet("/PersonalTweetsController")
public class PersonalTweetsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonalTweetsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//FALTA AÑADIR Y RETORNAR LA IMAGEN DE LA PERSONAL PAGE
		
		System.out.println("PersonalTweetsController, loading: ViewPersonalPage.jsp");
		HttpSession session = request.getSession();

		try{
			BeanUser userProfile = new BeanUser();										//initialize tweet to fill it with the needed data
			userProfile.getProfile(session.getAttribute("user").toString());
			BeanTweets bts = new BeanTweets();
			List<BeanTweet> alltweets = null;				//initialize the list of tweets we will return
			if(session.getAttribute("isGuest") == null){	//if the user is a guest
				alltweets = bts.getPersonalTweets(session.getAttribute("user").toString()); //return the list of tweets of the people we follow
				BeanComparator reverseOrderBeanComparator = new BeanComparator("time", new ReverseComparator(new ComparableComparator()));
				Collections.sort(alltweets, reverseOrderBeanComparator);
				//System.out.println(session.getAttribute("user").toString());
				//System.out.println(alltweets.size());
			}
			
		session.setAttribute("userProfile", userProfile);
		session.setAttribute("alltweets", alltweets);		//store it in the session to take it in ViewMainTweets.jsp	
		request.setAttribute("alltweets", alltweets);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("ViewPersonalPage.jsp");
	    dispatcher.forward(request, response);
	    

		}
		catch(Exception e){
			System.out.println("excepcion PersonalTweetsController");
			
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