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
import models.BeanUser;
import utils.DAO;

/**
 * Servlet implementation class AnonymusController
 */
@WebServlet("/FollowedController")
public class FollowedController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowedController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		System.out.println("FollowedController, loading: ViewFollowed.jsp");
		HttpSession session = request.getSession();

		try{
			//create BeanUser to get list of searched users
			//crete method in BeanUser getSearchedUsers
			BeanUser users = new BeanUser();
			List<BeanUser> userlist = null;						//initialize list of searched users
			String user = (String)session.getAttribute("user");
			userlist = users.getFollowedUsers(user);			//getSearchedUsers returns the list of users
			session.setAttribute("userlist", userlist);			//store it in the session to take it from the jsp
			request.setAttribute("userlist", userlist);
		    RequestDispatcher dispatcher = request.getRequestDispatcher("ViewFollowed.jsp");
		    dispatcher.forward(request, response);
		
		}
		catch(Exception e){
			System.out.println("Exception SearchController");
			
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