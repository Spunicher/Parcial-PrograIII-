package Controlador1;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAOS.LoginDao;
import model.Usuario;






/**
 * Servlet implementation class ServeletUsuario
 */
public class ServeletUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServeletUsuario() {
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
		// TODO Auto-generated method stub
		
		String abrir = request.getParameter("btn1");
	    if(abrir!=null) {
	    	if(abrir.equals("Eliminar")) {
		    HttpSession abrirr =(HttpSession) request.getSession();	
		   abrirr.invalidate();
		   response.sendRedirect("gestionar.jsp");
		    }
	    }else {
	    	String usu = request.getParameter("usuario");
		    String con = request.getParameter("contra");
		    Usuario u = new Usuario();
			  LoginDao d = new LoginDao();
			  u.setNombre(usu);
			  u.setContrasenia(con);	  
try {
	int verri = d.RevisarUsuario(u).size();
	if (verri==1) {
		HttpSession s = request.getSession(true);
		s.setAttribute("usuario", usu);
		response.sendRedirect("gestionar.jsp");
     }else {
		System.out.println("Error");
	}
} catch (Exception e) {
	System.out.println("Error" + e);
}
	}
	
	}}

