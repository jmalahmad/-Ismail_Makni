package tn.esps.controller;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tn.esps.model.User;

/**
 * Servlet implementation class RegisterController
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
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//Vous êtes entrain de créer des boucles ouvertes 
		//doGet(request, response);
		HttpSession session=request.getSession();
		User user =(User) session.getAttribute("u");
		String cPwd= request.getParameter("cPwd");
		if(user!= null && user.getPwd().equals(cPwd)) {
			ServletContext application=getServletContext();
			List<User> listUser= (List<User>) application.getAttribute("users");
			if (listUser==null) {
				listUser=new ArrayList<>();
			}
			listUser.add(user);
			application.setAttribute("users", listUser);
			session.setAttribute("url", "Verif");
			response.sendRedirect("Verif.jsp");
		} else {
			session.removeAttribute("u");
			request.setAttribute("passwordError", "passwordError");
			getServletContext().getRequestDispatcher("/Register.jsp").forward(request, response);
		}
		
		
		
	}

}
