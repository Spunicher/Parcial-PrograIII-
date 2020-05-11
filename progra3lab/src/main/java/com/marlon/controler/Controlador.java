package com.marlon.controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marlon.DAO.LoginDao;

import progra3lab.TbUsuariop;

/**
 * Servlet implementation class Controlador
 */
public class Controlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controlador() {
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
		String usu = request.getParameter("Usuario");
	    String con = request.getParameter("contraseña");
		  TbUsuariop u = new TbUsuariop();
		  LoginDao d = new LoginDao();
		  u.setUsuario(usu);
		  u.setContrasenia(con);

try {
	int verri = d.ingresosUsuarios(u).size();
	if (verri==1) {
		response.sendRedirect("busqueda.jsp");
     }else {
		System.out.println("Error");
	}
} catch (Exception e) {
	System.out.println("Error" + e);
}


}
	
	
}
