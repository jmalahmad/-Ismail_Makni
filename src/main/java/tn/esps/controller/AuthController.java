package tn.esps.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tn.esps.model.User;

/**
 * Servlet implementation class AuthController
 */
@WebServlet("/AuthController")
public class AuthController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String pwd=request.getParameter("pwd");
		ServletContext application=getServletContext();
		List<User> listUser= (List<User>) application.getAttribute("users");
		boolean trouve=false;
		RequestDispatcher rd = null;
		if(listUser == null) {
			request.setAttribute("erreur", "erreur");
			// "Le chemin [Register.jsp] doit commencer pas par le caractère \"/\""
			rd=getServletContext().getRequestDispatcher("/Register.jsp");
		}else {
			for(User user:listUser) {
				if(user.getEmail().equals(email) && user.getPwd().equals(pwd)) {
					HttpSession session=request.getSession();
					session.setAttribute("currrentUser", user);
					trouve=true;
					break;
				}
				
			//Comparaison d'égalité ==
				if(trouve == false) {
					request.setAttribute("erreur", "erreur");
					rd=getServletContext().getRequestDispatcher("/Register.jsp");
				}else {
					rd= getServletContext().getRequestDispatcher("/Home.jsp");
				}
			}
		}
		rd.forward(request, response);
	}

}
