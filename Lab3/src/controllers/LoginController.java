package controllers;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import models.BeanLogin;
import models.BeanTweet;
import utils.DAO;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("LoginController.");
		BeanLogin login = new BeanLogin();
	    try {
			
	    	BeanUtils.populate(login, request.getParameterMap());
	    	
	    	if (login.isComplete()) {

	    		try{
	    			DAO dao = new DAO();
	    			ResultSet rs = dao.executeSQL("SELECT username FROM users WHERE username = '" + login.getUser() + "'");
	    			if(!rs.next())
	    			{
	    				System.out.println("Username doesn't exist");
	    				login.setErrorU(1);
	    			
	    	    		request.setAttribute("login",login);
	    	    		RequestDispatcher dispatcher = request.getRequestDispatcher("ViewLoginForm.jsp");
	    			    dispatcher.forward(request, response);
	    			}
	    			else{
	    				ResultSet rs1 = dao.executeSQL("SELECT password FROM users WHERE username = '" + login.getUser() + "' AND password = '" + login.getPass() + "'");
		    			if(!rs1.next())
		    			{
		    				System.out.println("Incorrect password");
		    				login.setErrorP(1);
		    				
		    	    		request.setAttribute("login",login);
		    	    		RequestDispatcher dispatcher = request.getRequestDispatcher("ViewLoginForm.jsp");
		    			    dispatcher.forward(request, response);
		    			}
		    			else{
		    				System.out.println("WHYYas");
		    				
		    				HttpSession session = request.getSession();
		    		    	session.setAttribute("user",login.getUser());
		    		    	
		    		    	RequestDispatcher dispatcher = request.getRequestDispatcher("ViewLoginDone.jsp");
		    			    dispatcher.forward(request, response);
		    			}
	    			}
	    			
	    		dao.disconnectBD();
	    		}
	    		catch(Exception e){
	    			System.out.println("EXCEPTION: LoginController when DAO.");
	    		}
			    
		    } 
			else {
				
			    request.setAttribute("login",login);
			    RequestDispatcher dispatcher = request.getRequestDispatcher("ViewLoginForm.jsp");
			    dispatcher.forward(request, response);
		    	
		    }
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
