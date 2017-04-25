package hw;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

import jdk.nashorn.internal.ir.Statement;
import utils.DAO;

@WebServlet("/HelloWorld")
public class HelloWorld extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HelloWorld() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		out.println("<html><head><link rel='stylesheet' href='styles.css'></head><body>");
        out.println("<h1> Hello World </h1>");
        out.println("<p><h2> There is a table of our database: <h2></p>");

	
		try {
			DAO dao= new DAO();
            ResultSet rs = dao.executeSQL("SELECT * FROM taula");
            out.println("<table id='users'>");
            out.println("<tr><th>ID</th><th>Nombre</th><th>Descripción</th><th>Telefono</th><tr>");
            while (rs.next()) {
                String n = rs.getString("nom");
                String d = rs.getString("descripcio");
                int i = rs.getInt("id");
                int t = rs.getInt("telefon"); 
                out.println("<tr><td>" + i + "</td><td>" + n + "</td><td>" + d + "</td><td>" + t + "</td></tr>"); 
            }
            
            out.println("</body></html>");
            dao.disconnectBD();
           }
            catch (Exception e) {
            out.println("error");
            }
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
