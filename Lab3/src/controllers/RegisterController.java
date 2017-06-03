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

	   System.out.println("RegisterController.");
	   BeanUser user = new BeanUser();
		
	   try {
		   BeanUtils.populate(user, request.getParameterMap());
		
		   if (user.isComplete()) {
			   System.out.println("shur");
			   try{
					DAO dao = new DAO();
					ResultSet rs = dao.executeSQL("SELECT username FROM users WHERE username = '" +user.getUser()+"'");

					if (rs.next())
					{
						System.out.println("Username already exists");
						user.setErrorU(1);

						System.out.println("Unsucsesful registration");
						
						request.setAttribute("user",user);
						RequestDispatcher dispatcher = request.getRequestDispatcher("ViewRegisterForm.jsp");
						dispatcher.forward(request, response);
						return;
					}
					
					ResultSet rs1 = dao.executeSQL("SELECT email FROM users WHERE email = '" +user.getMail()+"'");
					if (rs1.next())
					{
						System.out.println("Email already exists");
						user.setErrorE(1);

						System.out.println("Unsucsesful registration");
						
						request.setAttribute("user",user);
						RequestDispatcher dispatcher = request.getRequestDispatcher("ViewRegisterForm.jsp");
						dispatcher.forward(request, response);
						return;
					}

					dao.insertUserSQL(user);

					
					if(dao.getStatus() > 0)
						System.out.println("You have been registred!");

					RequestDispatcher dispatcher = request.getRequestDispatcher("ViewLoginForm.jsp");
					dispatcher.forward(request, response);
					
					dao.disconnectBD();
				}
				catch (Exception e) {
		            System.out.println("EXCEPTION: RegisterController when dao");
			    }		   
		   }
		   else 
		   {
			   request.setAttribute("user",user);
			   RequestDispatcher dispatcher = request.getRequestDispatcher("ViewRegisterForm.jsp");
			   dispatcher.forward(request, response);   
		   }
	   }catch(IllegalAccessException|

	InvocationTargetException e)
	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
