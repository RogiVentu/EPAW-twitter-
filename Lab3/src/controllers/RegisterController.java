package controllers;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

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
@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	   System.out.println("RegisterController. ASDFASDF");
	   BeanUser user = new BeanUser();
		
	   try {
	
		   
		   BeanUtils.populate(user, request.getParameterMap());
		
		   if (user.isComplete()) {
			   System.out.println("TODO: INSERT into DB");
			   try{
					DAO dao = new DAO();
					dao.insertUserSQL(user);
					
					if(dao.getStatus() > 0)
						System.out.println("You have been registred!");
					
					dao.disconnectBD();
					
					RequestDispatcher dispatcher = request.getRequestDispatcher("ViewLoginForm.jsp");
					dispatcher.forward(request, response);
						
				}
				catch (Exception e) {
		            System.out.println("error ???? JKODER");
			    }
			   
		   } 
		   else {
			   System.out.println("Waiting to submit...YA CASIL");
			   request.setAttribute("user",user);
			   RequestDispatcher dispatcher = request.getRequestDispatcher("ViewRegisterForm.jsp");
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
