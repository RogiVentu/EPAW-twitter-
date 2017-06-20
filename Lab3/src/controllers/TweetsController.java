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
			//DAO dao = new DAO();
			BeanTweets bts = new BeanTweets();
			List<BeanTweet> alltweets = null;
			if(session.getAttribute("isGuest") != null){
				//System.out.println("isGuest = true");
				alltweets = bts.getTweets();
				BeanComparator reverseOrderBeanComparator = new BeanComparator("time", new ReverseComparator(new ComparableComparator()));
				Collections.sort(alltweets, reverseOrderBeanComparator);
				//System.out.println(alltweets.size());
			}
			else{
				
				alltweets = bts.getFollowedTweets(session.getAttribute("user").toString());
				BeanComparator reverseOrderBeanComparator = new BeanComparator("time", new ReverseComparator(new ComparableComparator()));
				Collections.sort(alltweets, reverseOrderBeanComparator);
				//System.out.println(session.getAttribute("user").toString());
				//System.out.println(alltweets.size());
				
			}
			
		session.setAttribute("alltweets", alltweets);
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