package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.BeanUser;

/**
 * Servlet implementation class ChangeProfileController
 */
@WebServlet("/ChangeProfileController")
public class ChangeProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeProfileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("ChangeProfileController");
		HttpSession session = request.getSession();
		try{

			//DAO dao = new DAO();
			BeanUser userToChange = new BeanUser();										//initialize tweet to fill it with the needed data
			
			String what = request.getParameter("change_what").toString();
			String value = request.getParameter("change_value").toString();
			String who = request.getParameter("change_who").toString();
			userToChange.changeValue(who, what , value);
		}
		catch(Exception e){
			System.out.println("Exception ChangeProfileController");
			
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
