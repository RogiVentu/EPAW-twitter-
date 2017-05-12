package controllers;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;

import models.BeanUser;
import utils.DAO;

/**
 * Servlet implementation class FormController
 */
@WebServlet("/FormController")
public class FormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BeanUser user = new BeanUser();
		
		try {
		
		   // Fill the bean with the request parmeters
		   BeanUtils.populate(user, request.getParameterMap());
		   
		   if (user.isComplete()) {
			   System.out.println("TODO: INSERT into DB");
<<<<<<< HEAD
			   try{
					DAO dao = new DAO();
					dao.insertSQL(user);
					dao.disconnectBD();
				}
				catch (Exception e) {
		            System.out.println("error");
			    }
		   } 
		   else {
			   System.out.println("yeeeepale");
=======

				try{
				DAO dao = new DAO();
				
				dao.insertSQL(user);
				
				dao.disconnectBD();
				}
			    catch (Exception e) {
		            System.out.println("error");
		        }

		   } 
		   else {
			   System.out.println("adfsdg" + user.getName());
>>>>>>> 3c1c6062d2fb4756d6dbb0b4e18eee94d4d40e48
			   // Put the bean into the request as an attribute
			   request.setAttribute("user",user);
			   RequestDispatcher dispatcher = request.getRequestDispatcher("/RegisterForm.jsp");
			   dispatcher.forward(request, response);
		   }
	    } 
		catch (IllegalAccessException | InvocationTargetException e) {
				e.printStackTrace();
	    }
		
<<<<<<< HEAD

=======
		
>>>>>>> 3c1c6062d2fb4756d6dbb0b4e18eee94d4d40e48
		//System.out.println(user.getGender() + user.getDatebirth() + user.getName());
		    
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
