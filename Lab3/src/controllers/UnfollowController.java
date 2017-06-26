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



import models.BeanFollow;
import models.BeanTweet;
import models.BeanTweets;
import utils.DAO;

/**
 * Servlet implementation class AnonymusController
 */
@WebServlet("/UnfollowController")
public class UnfollowController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UnfollowController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		System.out.println("UnfollowController");
		HttpSession session = request.getSession();
		//System.out.println(request.getParameter("usertofollow"));
		String usertofollow = (String)request.getParameter("usertofollow");
		try{
			BeanFollow bf = new BeanFollow();
			bf.deleteFollow(usertofollow, session.getAttribute("user").toString());
		}
		catch(Exception e){
			System.out.println("excepcion UnfollowController");
			
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